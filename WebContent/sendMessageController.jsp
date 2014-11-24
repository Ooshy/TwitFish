<%@page import="twitFish.*"%>
<%
	User u = UserSingletonFactory.getUser((Integer) session.getAttribute("userid"));
	u.sendMessage((String)request.getParameter("message"));
	response.sendRedirect("MainScreen.jsp");
%>