<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="TwitFish.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TwitFish</title>
</head>
<body style="background-color:#333333">

<%
	MySQLAccess dao = new MySQLAccess();
	dao.readDataBase();
%>
	
	<div class="container" >
	<ul class="nav nav-tabs" style="background-color:#FFFFFF">
  		<li role="presentation" class="active"><a href="#">Home</a></li>
  		<li role="presentation"><a href="#">Profile</a></li>
  		<li role="presentation"><a href="#">Messages</a></li>
	</ul>
		<div class="jumbotron">
		  <h1>TwitFish</h1>
		  <p></p>
		  <p><a class="btn btn-primary btn-lg" href="#" role="button" onclick="doSomething()">Learn more</a></p>
		</div>
	</div>
	
	<%
	
	%>
</body>
</html>>