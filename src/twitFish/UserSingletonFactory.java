package twitFish;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserSingletonFactory {
	private static UserSingletonFactory userSingletonFactory;
	private static HashMap<Integer, User> users = null;
	private static HashMap<Integer, Message> messages = null;

	protected UserSingletonFactory() {
		// Exists only to defeat instantiation.
	}

	public static UserSingletonFactory getInstance() {
		if (userSingletonFactory == null) {
			userSingletonFactory = new UserSingletonFactory();
			users = new HashMap<Integer, User>();
			messages = new HashMap<Integer, Message>();
		}
		return userSingletonFactory;
	}

	public static void addMessage(Message message) {
		if (!messages.containsKey(message.getId()))
			messages.put(message.getId(), message);
	}
	public static Message getMessageFromMemory(Integer id) 
	{
		if (messages.containsKey(id))
			try {
				return messages.get(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	public static boolean isFollowing(User user1, User user2)
	{
		Statement stmt = null;
		ResultSet st = null;
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");
			stmt = conn.createStatement();
			String selNum = "SELECT count(*) FROM followers WHERE UserID = " + user1.getId() + " && FollowerID = " + user2.getId() ;
			st = stmt.executeQuery(selNum);
			if (st.next()) {
				Integer count = st.getInt("count(*)");
				conn.close();
				st.close();
				stmt.close();
				if (count >= 1) return true;
				else return false;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		try
		{
			if (conn != null)
				conn.close();
		} catch (SQLException e) { System.out.println(e.getMessage()); }
		return false;
	}
		
		
	
	public static Message getMessageFromDatabase(Integer id, Connection conn) {
	
		Statement stmt = null;
		ResultSet st = null;
		Message m = null;

//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		} catch (Exception e) {
//
//			
//		}

		// find user by ID

		
		
		try {
			stmt = conn.createStatement();
			String selNum = "SELECT * FROM message WHERE MessageID = " + id;
			st = stmt.executeQuery(selNum);
			if (st.next()) {
				m = new Message(st.getInt("MessageID"),
						st.getString("Text"), st.getDate("Date"),
						UserSingletonFactory.getUser(st.getInt("SenderID")));

				messages.put(st.getInt("MessageID"), m);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return m;
	}

	public static void addUser(User user) {
		users.put(user.getId(), user);
	}

	public static void updateUser(Integer id, User user) {
		users.replace(id, user);
	}

	public static User getUser(Integer id) {
		return getUser("", "", id);
	}

	private static User getUser(String username, String password, Integer id) {

		Connection conn = null;
		Statement stmt = null;
		ResultSet st = null;
		User u = null;
		
		// find user by ID
		if (id != -1) {
			if (users.containsKey(id)) {
				try {

					u = users.get(id);
					loadMessages(u);
					loadFollowers(u);
					loadFollowing(u);
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

			} else {
				try {
					try {
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection(
								"jdbc:mysql://localhost/TwitFish", "root", "password");

					} catch (Exception e) {

					}

					
					stmt = conn.createStatement();
					String selNum = "SELECT * FROM user WHERE UserID = " + id;
					st = stmt.executeQuery(selNum);
					if (st.next()) {
						u = new User(st.getInt("UserID"),
								st.getString("FirstName"),
								st.getString("LastName"),
								st.getString("Address"),
								st.getString("ProfilePicture"),
								st.getString("Email"), st.getString("Phone"));

						loadMessages(u);
						loadFollowing(u);
						loadFollowers(u);
						users.put(st.getInt("UserID"), u);
						st.close();
						stmt.close();
						conn.close();
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		// find user by username and password
		else {
			try {
				// try to get user from memory
				try {
					stmt = conn.createStatement();
					String selNum = "SELECT * FROM user WHERE username = '"
							+ username + "' && password = '" + password + "'";
					st = stmt.executeQuery(selNum);

					int UserID = st.getInt("UserID");
					u = users.get(UserID);
					loadMessages(u);
					loadFollowers(u);
					loadFollowing(u);

					st.close();
					stmt.close();
					conn.close();
				} catch (Exception e) // user did not exist in memory
				{
					System.out.println(e.getMessage());
				}

				try {

					if (st.next()) {
						u = new User(st.getInt("UserID"),
								st.getString("FirstName"),
								st.getString("LastName"),
								st.getString("Address"),
								st.getString("ProfilePicture"),
								st.getString("Email"), st.getString("Phone"));
						loadMessages(u);
						loadFollowing(u);
						loadFollowers(u);
						users.put(st.getInt("UserID"), u);

						st.close();
						stmt.close();
						conn.close();
					}

				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}

		return u;
	}

	private static void loadFollowers(User u) {
		// TODO Auto-generated method stub

	}

	private static void loadFollowing(User u) {
		// TODO Auto-generated method stub

	}

	public static User getUser(String username, String password) {
		return getUser(username, password, -1);
	}

	public static void loadMessages(User u) {
		u.clearMessages();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/TwitFish", "root", "password");

			Statement loadMessages = conn.createStatement();
			String loadMessagesString = "SELECT M.* FROM message AS M JOIN messageuser as MU ON M.MessageID = MU.MessageID JOIN user as U ON U.UserID = M.SenderID WHERE MU.UserID = "
					+ u.getId();
			ResultSet loadMessagesResultSet = loadMessages
					.executeQuery(loadMessagesString);

			// if (loadMessagesResultSet.getInt("count(*)") !=
			// u.getMessages().size()) // if number of messages in db != to
			// messages in memory

			while (loadMessagesResultSet.next()) {
				Message m = UserSingletonFactory
						.getMessageFromMemory(loadMessagesResultSet.getInt("MessageID"));
				if (m == null)
				{
					m = UserSingletonFactory
							.getMessageFromDatabase(loadMessagesResultSet.getInt("MessageID"), conn);
				}
				u.addMessage(m);
			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}

	}

}
