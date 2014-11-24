package twitFish;
import java.util.*;




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