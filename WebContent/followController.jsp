<%@page import="twitFish.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
<%
	Integer followerID = (Integer) session.getAttribute("followerid");
	Integer userID = (Integer) session.getAttribute("userid");
	Connection conn = null;
	
	try
	{
	     conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");
	
	  	 
	  	 /*Statement stmt = conn.createStatement();
         String selNum = "SELECT count(*) FROM Followers WHERE UserID = " + userID + " && FollowerID = " + followerID + ")";
         ResultSet st = stmt.executeQuery(selNum);
	  	 if (st.next())
	  	 {
	  		 if (st.getInt("Count(*)") == 1) response.sendRedirect("MainScreen.jsp");
	  		 return;
	  	 }	*/     
	     
	     
	  	 String insertString = "INSERT INTO Followers VALUES (null, ?, ?)";
	  	 PreparedStatement insertStatement = conn.prepareStatement(insertString);
	  	  	   
	  	 insertStatement.setInt(1, (Integer) session.getAttribute("userid"));
	  	 insertStatement.setInt(2, followerID);
	  
	  	 insertStatement.executeUpdate();
	  	 
	  	 // this may be problematic in the future.
		 response.sendRedirect("userProfile.jsp");
	  	 
	} catch (Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		try
		{
			if (conn != null)
				conn.close();
		} catch (SQLException e) { System.out.println(e.getMessage()); }
		
	}

	
	
%>