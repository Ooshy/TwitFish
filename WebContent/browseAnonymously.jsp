<%@page import="twitFish.*"%>
<%
	session.setAttribute("userid", Integer.valueOf("-2"));
	response.sendRedirect("MainScreen.jsp");
%>