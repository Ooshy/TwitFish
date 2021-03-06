<%@page import="twitFish.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
<%
	String newFirstName = (String) request.getParameter("firstname");
	String newLastName  = (String) request.getParameter("lastname");
	String newAddress   = (String) request.getParameter("address");
	String newEmail     = (String) request.getParameter("email");
	String newPhone     = (String) request.getParameter("phone");
	
	Connection conn = null;
	try
	{
		  Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

          Statement stmt = conn.createStatement();
          String selNum = "UPDATE User SET ";
          
          boolean commaNeeded = false;
          if (!(newFirstName == "" || newFirstName == null))
          {
        	  selNum += "FirstName='" + newFirstName + "'";
			  commaNeeded = true;        	  
          }
          if (!(newLastName  == "" || newLastName  == null))
          {
        	  if (commaNeeded) selNum += ",";
        	  selNum += "LastName='" + newLastName + "'";
			  commaNeeded = true;        	  
          }
          if (!(newAddress   == "" || newAddress   == null))
          {
        	  if (commaNeeded) selNum += ",";
        	  selNum += "Address='" + newAddress + "'";
			  commaNeeded = true;        	  
          }
          if (!(newEmail     == "" || newEmail     == null))
          {
        	  if (commaNeeded) selNum += ",";
        	  selNum += "Email='" + newEmail + "'";
			  commaNeeded = true;        	  
          }
          if (!(newPhone     == "" || newPhone     == null))
          {
        	  if (commaNeeded) selNum += ",";
        	  selNum += "Phone='" + newPhone + "'";
			  commaNeeded = true;        	  
          }
          if (commaNeeded == false) response.sendRedirect("settings.jsp"); // blank fields 
          
          selNum += " WHERE UserID = " + (Integer) session.getAttribute("userid");
          stmt.executeUpdate(selNum);
          
          User u = UserSingletonFactory.getUser((Integer) session.getAttribute("userid"));
          u.changeSettings(newFirstName, newLastName, newAddress, newEmail, newPhone);
          UserSingletonFactory.updateUser((Integer) session.getAttribute("userid"), u);
          //throw new Exception();
          response.sendRedirect("settings.jsp");
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}

%>