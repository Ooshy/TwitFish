<%@page import="twitFish.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%

	String searchText = (String) request.getParameter("searchText");
	
	Connection conn = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");
	
	    
	} catch (Exception e)
	{
			System.out.println(e.getMessage());
	}
	
	
	if (searchText.startsWith("@"))
	{
		String userName = searchText.substring(1);
	
		Statement stmt = conn.createStatement();
	    String selNum = "SELECT UserID from User Where username = '" + userName + "'";
	    ResultSet st = stmt.executeQuery(selNum);
	    if(st.next()){
	                 	   
     	    session.setAttribute("profileid", st.getInt("UserID"));  
       		/*session.setAttribute("firstname", userInfoResultSet.getString("FirstName"));
       		session.setAttribute("lastname",  userInfoResultSet.getString("LastName"));
       		session.setAttribute("address", userInfoResultSet.getString("Address"));
       		session.setAttribute("phone", userInfoResultSet.getString("Phone"));
       		session.setAttribute("email", userInfoResultSet.getString("Email"));*/
      
	         
            conn.close();
            st.close();
            stmt.close();
         	response.sendRedirect("userProfile.jsp");
	         	 
	    
	    }
	    else // no user exists with inputted name
	    {
	    	response.sendRedirect("MainScreen.jsp");// TODO
	    }
	}
	else if (searchText.startsWith("#"))
	{
		Statement stmt = conn.createStatement();
	    String selNum = "";
	    ResultSet st = stmt.executeQuery(selNum);
	    if(st.next()){
	            int num = st.getInt("COUNT");
	            if ( num == 0 ) // create account
	            {
	         	   response.sendRedirect("login.jsp");
	         	  // error you do not exist
	            }
	            else
	            {             	   
	           	    session.setAttribute("userid", st.getInt("UserID"));  
	             		/*session.setAttribute("firstname", userInfoResultSet.getString("FirstName"));
	             		session.setAttribute("lastname",  userInfoResultSet.getString("LastName"));
	             		session.setAttribute("address", userInfoResultSet.getString("Address"));
	             		session.setAttribute("phone", userInfoResultSet.getString("Phone"));
	             		session.setAttribute("email", userInfoResultSet.getString("Email"));*/
	            }
	         
	            conn.close();
	            st.close();
	            stmt.close();
	         	response.sendRedirect("MainScreen.jsp");
	         	 
	    
	    }
	}
	else
	{
		Statement stmt = conn.createStatement();
	    String selNum = "";
	    ResultSet st = stmt.executeQuery(selNum);
	    if(st.next()){
	            int num = st.getInt("COUNT");
	            if ( num == 0 ) // create account
	            {
	         	   response.sendRedirect("login.jsp");
	         	  // error you do not exist
	            }
	            else
	            {             	   
	           	    session.setAttribute("userid", st.getInt("UserID"));  
	             		/*session.setAttribute("firstname", userInfoResultSet.getString("FirstName"));
	             		session.setAttribute("lastname",  userInfoResultSet.getString("LastName"));
	             		session.setAttribute("address", userInfoResultSet.getString("Address"));
	             		session.setAttribute("phone", userInfoResultSet.getString("Phone"));
	             		session.setAttribute("email", userInfoResultSet.getString("Email"));*/
	            }
	         
	            conn.close();
	            st.close();
	            stmt.close();
	         	response.sendRedirect("MainScreen.jsp");
	         	 
	    
	    }
	}
	
	try
	{
		if (conn != null)
		{
			conn.close();
		}
	} catch (SQLException e) { System.out.println(e.getMessage());}
	
%>