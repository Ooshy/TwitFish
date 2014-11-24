<%@page import="twitFish.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
<%
	Connection conn = null;
	Integer messageID = null;
	try
	{
		 Class.forName("com.mysql.jdbc.Driver");
	     conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");
	
	     
	  	 String insertString = "INSERT INTO message VALUES (null, ?, ?, ?)";
	  	 PreparedStatement insertStatement = conn.prepareStatement(insertString);
	  	  	   
	  	 insertStatement.setInt(1, (Integer) session.getAttribute("userid"));
	  	 insertStatement.setString(2, (String) request.getParameter("message"));
	  	 insertStatement.setDate(3, new java.sql.Date(System.currentTimeMillis()));
	  	   
	  	 insertStatement.executeUpdate();
	  	 
	  	 Statement stmt = conn.createStatement();
         String selNum = "SELECT LAST_INSERT_ID()";
         ResultSet st = stmt.executeQuery(selNum);
	  	 if (st.next())
	  	 {
	  		 messageID = st.getInt("LAST_INSERT_ID()");
	  	 }
	  	 
	} catch (Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		conn.close();
	}


	User u = UserSingletonFactory.getUser((Integer) session.getAttribute("userid"));
	u.sendMessage((String)request.getParameter("message"), messageID);
	
	
	
	response.sendRedirect("MainScreen.jsp");
%>