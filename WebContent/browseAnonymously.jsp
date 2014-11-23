<%

	session.setAttribute("username", "anonymous");
	session.setAttribute("firstname", "Anonymous");
   	session.setAttribute("lastname",  "" );
   	session.setAttribute("address", "Anonymous" );
   	session.setAttribute("phone", "Anonymous" );
   	session.setAttribute("email", "Anonymous");
	response.sendRedirect("MainScreen.jsp");

%>