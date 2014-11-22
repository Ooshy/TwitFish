package twitFish;
import java.util.HashMap;
public class UserFactory
{
	private HashMap<Integer, User> users;
	public UserFactory()
	{
		users = new HashMap<Integer,User>();
	}

	public void createUser(String firstName, String lastName, String address)
	{
		User user = new User(firstName, lastName, address);
		users.put(user.getId(), user);
	}

	public User getUser(int id)
	{
		try
		{
			User user = users.get(id);
			return user;	
		}
		catch ( Exception e )
		{
			System.out.println(e);
		}
		return null;
	}
	
}