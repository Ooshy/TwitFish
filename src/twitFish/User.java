package twitFish;
import java.util.*;
public class User
{
	private int _id;
	private String _firstName;
	private String _lastName;
	private String _address;
	private List<Message> _messages;
	//private List<DirectMessage> _directMessages;
	private List<User> _followers;
	private List<User> _following;
	public static int userIdIncrementer = 0;

	private User()
	{

	}

	public User(String firstName, String lastName, String address)
	{
		// assign user a unique id
		//_id = userIdIncrementer;
		userIdIncrementer += 1;

		_firstName = firstName;
		_lastName = lastName;
		_address = address;
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

	public int getId()
	{
		return _id;
	}
}