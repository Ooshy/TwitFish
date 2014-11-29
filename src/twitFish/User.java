package twitFish;
import java.util.*;
import java.sql.*;



public class User
{
	private Integer _id;
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
	public void clearMessages()
	{
		_messages.clear();
	}
	public String toString()
	{
		return this.getClass().getName() + "[firstName=" + _firstName + ", lastName=" + _lastName + ", address=" + _address + 
				", phone=" + _phone + ", profilePicture=" + _profilePicture + ", email=" + _email ;
	}
	
	public void changeSettings(String firstName, String lastName, String address, String email, String phone)
	{
		if (!(firstName == null || firstName == "")) _firstName = firstName;
		if (!(lastName  == null || lastName  == "")) _lastName  = lastName;
		if (!(address   == null || address   == "")) _address   = address;
		//if (!(profilePicture == null || profilePicture == "")) _profilePicture = profilePicture;
		if (!(email     == null || email     == "")) _email     = email;
		if (!(phone     == null || phone     == "")) _phone     = phone;
	}
	public User(int id, String firstName, String lastName, String address, String profilePicture, String email, String phone)
	{
		// assign user a unique id
		_id = id;
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
	public void sendMessage(String messageText, Integer messageID)
	{
		Connection conn = null;
		if (messageText != null)
		{
			//Message message = new Message(messageID, messageText, this);
			Message message = UserSingletonFactory.getMessageFromDatabase( messageID , null);
			UserSingletonFactory.addMessage(message);
			for ( User user : _followers )
			{
				user.addMessage(message);
				
				try
				{
					 Class.forName("com.mysql.jdbc.Driver");
			         conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

			         
				  	 String insertString = "INSERT INTO messageuser VALUES (?, ?)";
				  	 PreparedStatement insertStatement = conn.prepareStatement(insertString);
				  	    
				  	 insertStatement.setInt(1, messageID);
				  	 insertStatement.setInt(2, user.getId());
				  	   
				  	 insertStatement.executeUpdate();
				} catch (Exception e)
				{
					e.printStackTrace();
				}
				finally
				{

				}
				
				
				
			}
			
			
	
			try
			{
				 Class.forName("com.mysql.jdbc.Driver");
		         conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

		         
			  	 String insertString = "INSERT INTO messageuser VALUES (?, ?)";
			  	 PreparedStatement insertStatement = conn.prepareStatement(insertString);
			  	    
			  	 insertStatement.setInt(1, messageID);
			  	 insertStatement.setInt(2, this.getId());
			  	   
			  	 insertStatement.executeUpdate();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			//_messages.add(message);
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
	public Integer getId()
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