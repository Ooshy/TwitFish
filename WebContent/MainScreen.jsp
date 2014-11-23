<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="twitFish.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="jquery-2.1.1.min.js"></script>
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/foundation.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/foundation.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TwitFish</title>
</head>

<%

	String username = (String)session.getAttribute("username");
	
	
	if (username == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>


<body style="background-color:#333333">
     
 
 <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">TwitFish</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="#">Messages</a></li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search TwitFish...">
        </div>
        <button type="submit" class="btn btn-default" style="visibility:hidden"></button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Settings</a></li>
            <li class="divider"></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  <div class="row">
  
     
    <div class="large-3 columns ">
      <div class="panel">
        <a href="#"><img src="img/default_profile_large.jpg"/></a>
        <h5><a href="#">Chris Zimmerman</a></h5>
          <div class="section-container vertical-nav" data-section data-options="deep_linking: false; one_up: true">
          <section class="section">
            <button class="btn btn-primary" type="button">
  				Following <span class="badge">4</span>
			</button>
          </section>
          <section class="section">
    	      <button class="btn btn-primary" type="button">
  				Followers <span class="badge">4</span>
				</button>
          </section>
        </div>
 
      </div>
    </div>
    
     
     
    <div class="large-6 columns" style="background-color:#222222">
 
       <%
       for (int i = 0; i != 3; ++i)
       {
       %>
      <div class="row" style="background-color:#FFFFFF">
      	<br/>
        <div class="large-2 columns small-3"><img src="img/default_profile_small.jpg"/></div>
        <div class="large-10 columns">
          <p><strong>Some Person said:</strong> Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>
          <ul class="inline-list">
            <li><a href="">Reply</a></li>
            <li><a href="">Share</a></li>
          </ul>
        </div>
      </div>
      <%
       if (i != 3) {
    	%>
    	<hr/>
    	<% 
       }
	}
  %>
       
             
 
    </div>
  </div>
 
 
   
 
  <footer class="row">
    <div class="large-12 columns">
      <hr/>
      <div class="row">
        <div class="large-5 columns">
          <p style="color:#DDDDDD">© Copyright TwitFish LLC.</p>
        </div>
        <div class="large-7 columns">
          <ul class="inline-list right">
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
    
</body>

<%
	}
%>
</html>>

