package twitFish;
import java.util.*;
import java.util.*;
import java.sql.*;
import java.io.*;

public class User
{
	private int _id;
	private String _firstName;
	private String _lastName;
	private String _address;
	private String _phone;
	private String _profilePicture;
	private String _email;
	private List<Message> _messages;
	//private List<DirectMessage> _directMessages;
	private List<User> _followers;
	private List<User> _following;
	
	public String toString()
	{
		return this.getClass().getName() + "[firstName=" + _firstName + ", lastName=" + _lastName + ", address=" + _address + 
				", phone=" + _phone + ", profilePicture=" + _profilePicture + ", email=" + _email ;
	}
	public User(String username, String password)
	{
		_followers = new ArrayList<User>();
		_following = new ArrayList<User>();
		_messages = new ArrayList<Message>();
		Connection conn = null;
		try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

            Statement stmt = conn.createStatement();
            String selNum = "SELECT * FROM user WHERE username = '" + username + "' && password = '" + password + "'";
            ResultSet st = stmt.executeQuery(selNum);
            if(st.next()){
            		//_id = st.getInt(0);
                    _firstName = st.getString("FirstName");
                    _lastName = st.getString("LastName");
                    _address = st.getString("Address");
                    _phone = st.getString("Phone");
                    _profilePicture = st.getString("ProfilePicture");
                    _email = st.getString("Email");
            }
            Statement loadMessages = conn.createStatement();
            String loadMessagesString = "SELECT * FROM message AS M JOIN messageuser as MU ON M.MessageID = MU.MessageID WHERE MU.UserID = " + _id;
            ResultSet loadMessagesResultSet= loadMessages.executeQuery(loadMessagesString);
            while (loadMessagesResultSet.next())
            {
            	 Statement loadUser = conn.createStatement();
                 String loadUserString = "SELECT * FROM user WHERE UserID = " + loadMessagesResultSet.getInt("SenderID");
                 ResultSet loadUserResultSet= loadUser.executeQuery(loadUserString);
                 User u = null;
                 if (loadUserResultSet.next())
                 {
                	 u = new User(loadUserResultSet.getString("FirstName"),
                			 loadUserResultSet.getString("LastName"),
                			 loadUserResultSet.getString("Address"),
                			 loadUserResultSet.getString("ProfilePicture"),
                			 loadUserResultSet.getString("Email"),
                			 loadUserResultSet.getString("Phone"));	 
                 }
            	this._messages.add(new Message(loadMessagesResultSet.getString("Text"), loadMessagesResultSet.getDate("Date"), u ));
            }
		}catch (Exception e) {
			
			try
			{
				conn.close();
			}
			catch (Exception ex){}
		}
		
		
	}

	public User(String firstName, String lastName, String address, String profilePicture, String email, String phone)
	{
		// assign user a unique id
		//_id = userIdIncrementer;
		

		_firstName = firstName;
		_lastName = lastName;
		_address = address;
		_profilePicture = profilePicture;
		_email = email;
		_phone = phone;
		_followers = new ArrayList<User>();
		_following = new ArrayList<User>();
		_messages = new ArrayList<Message>();
	}
	public void addFollowing(User user)
	{
		if (user != null)
			_following.add(user);
	}

	/**
	 *
     *
     */
	public void sendMessage(String messageText)
	{
		if (messageText != null)
		{
			Message message = new Message(messageText, this);
			for ( User user : _followers )
			{
				user.addMessage(message);
			}
		}
	}

	public void addMessage(Message message)
	{
		if (message != null)
			_messages.add(message);
	}
	public int getNumFollowers()
	{
		return _followers.size();
	}
	public int getNumFollowing()
	{
		return _following.size();
	}
	
	public List<User> getFollowers()
	{
		return _followers;
	}
	public List<User> getFollowing()
	{
		return _following;
	}
	public List<Message> getMessages()
	{
		return _messages;
	}
	public int getId()
	{
		return _id;
	}
	
	public String getFirstName()
	{
		return _firstName;
	}
	public String getLastName()
	{
		return _lastName;
	}
	public String getAddress()
	{
		return _address;
	}
	public String getProfilePicture()
	{
		return _profilePicture;
	}
	public String getEmail()
	{
		return _email;
	}
	public String getPhone()
	{
		return _phone;
	}
	
}