package twitFish;
public class AuthenticatedUserSingleton
{
	private static AuthenticatedUserSingleton authenticatedUserSingleton;
	private static User authenticatedUser = null;
	
	 protected AuthenticatedUserSingleton() {
	      // Exists only to defeat instantiation.
	   }
	 public static AuthenticatedUserSingleton getInstance() {
	      if(authenticatedUserSingleton== null) {
	    	  authenticatedUserSingleton= new AuthenticatedUserSingleton();
	      }
	      return authenticatedUserSingleton;
	   }


	public static void setAuthenticatedUser(User user)
	{
		authenticatedUser = user;
	}

	public static User getUser()
	{
		return authenticatedUser;
	}
	
}