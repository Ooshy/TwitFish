package twitFish;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserSingletonFactory
{
	private static UserSingletonFactory userSingletonFactory;
	private static HashMap<Integer, User> users = null;
	
	 protected UserSingletonFactory() {
	      // Exists only to defeat instantiation.
	   }
	 public static UserSingletonFactory getInstance() {
	      if(userSingletonFactory== null) {
	    	  userSingletonFactory= new UserSingletonFactory();
	    	  users = new HashMap<Integer, User>();
	      }
	      return userSingletonFactory;
	   }
	 
	 public static void addUser(User user)
	 {
		 users.put(user.getId(), user);
	 }
	 
	public static User getUser(Integer id)
	{
		return getUser("", "", id);
	}
	 
	private static User getUser(String username, String password, Integer id)
	{

		
		Connection conn = null;
		Statement stmt = null;
		ResultSet st = null; 
		User u = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");
		   
		    
		}catch (Exception e) { e.printStackTrace(); }
		

	     
	    
		// find user by ID
		if (id != -1)
		{
			if (users.containsKey(id))
				try 
				{
					
					u = users.get(id);
	//				loadMessages(u);
	//				loadFollowers(u);
	//				loadFollowing(u);
					return u;
				}
				catch (Exception e)
				{
					
				}
			else
			{
				try {
					stmt = conn.createStatement();
					String selNum = "SELECT * FROM user WHERE UserID = " + id;
					st = stmt.executeQuery(selNum);
					if(st.next()){
						u = new User(st.getInt("UserID"),
					            st.getString("FirstName"),
					            st.getString("LastName"),
					            st.getString("Address"),
					            st.getString("Phone"),
					            st.getString("ProfilePicture"),
					            st.getString("Email"));
						
						loadMessages(u);
						loadFollowing(u);
						loadFollowers(u);
						users.put(st.getInt("UserID"), u);
						return u;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		// find user by username and password
		else
		{
			try{
	            // try to get user from memory
	            try
	            {
	            	stmt = conn.createStatement();
					String selNum = "SELECT * FROM user WHERE username = '" + username + "' && password = '" + password + "'";
					st = stmt.executeQuery(selNum);
					
	            	int UserID = st.getInt("UserID");
	            	u = users.get(UserID);
	            	loadMessages(u);
	            	loadFollowers(u);
	            	loadFollowing(u);
	            	return u;
	            }
	            catch (Exception e)  // user did not exist in memory
	            {
	            	e.printStackTrace();
	            }
	            
	            try
	            {
	            	
		            if(st.next()){
		            	u = new User(st.getInt("UserID"),
		                        st.getString("FirstName"),
		                        st.getString("LastName"),
		                        st.getString("Address"),
		                        st.getString("Phone"),
		                        st.getString("ProfilePicture"),
		                        st.getString("Email"));
		            	loadMessages(u);
		            	loadFollowing(u);
		            	loadFollowers(u);
		            	users.put(st.getInt("UserID"), u);
		            	return u;
		            }
				   
	            } catch (Exception e) { e.printStackTrace(); }
	            
			

			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally { 
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
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
	public static User getUser(String username, String password)
	{	
		return getUser(username, password, -1);
	}
	public static void loadMessages(User u)
	{
		Connection conn = null;
		try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

			Statement loadMessages = conn.createStatement();
		    String loadMessagesString = "SELECT M.*, count(*) FROM message AS M JOIN messageuser as MU ON M.MessageID = MU.MessageID JOIN user as U ON U.UserID = M.SenderID WHERE MU.UserID = " + u.getId();
		    ResultSet loadMessagesResultSet= loadMessages.executeQuery(loadMessagesString);
		    
		    if (loadMessagesResultSet.getInt("count(*)") != u.getMessages().size()) // if number of messages in db != to messages in memory
			     
			    while (loadMessagesResultSet.next())
			    {
			    	User user = getUser(loadMessagesResultSet.getInt("UserID"));
			    	Message m = new Message(loadMessagesResultSet.getString("Text"), loadMessagesResultSet.getDate("Date"), user);
			    	u.addMessage(m);
			    }
		}catch (Exception e) {
			try
			{
				conn.close();
			}
			catch (Exception ex){
				ex.printStackTrace();
			}
		}
	}
	
}	
		
