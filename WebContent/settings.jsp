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
<title>TwitFish - Account Settings</title>
<style>
#grad1 {
    height: 200px;
    background: -webkit-linear-gradient( #33CCFF, #003399); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient( #33CCFF, #003399); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient( #33CCFF,  #003399); /* For Firefox 3.6 to 15 */
    background: linear-gradient(#33CCFF, #003399); /* Standard syntax (must be last)
</style>
<script>
	function validateSettingsChanges()
	{
		var newFirstName = document.forms["settingsForm"]["firstname"].value;
		var newLastName  = document.forms["settingsForm"]["lastname"].value;
		var newAddress   = document.forms["settingsForm"]["address"].value;
		var newEmail     = document.forms["settingsForm"]["email"].value;
		var newPhone     = document.forms["settingsForm"]["phone"].value;
	}
</script>
</head>

<body id="grad1">
<%
	String username = (String)session.getAttribute("username");
	
	
	if (username == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
	
		UserSingletonFactory userSingleton = UserSingletonFactory.getInstance();
		User user = UserSingletonFactory.getUser();
%>

 <div class="container"> 
	 <nav class="navbar navbar-default" role="navigation" style="background-color:#008AE6">
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
	        <li class="active"><a href="MainScreen.jsp">Home<span class="sr-only">(current)</span></a></li>
	        <li><a href="#">Messages</a></li>
	      </ul>
	      <form class="navbar-form navbar-left" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search @example #topic">
	        </div>
	        <button type="submit" class="btn btn-success" >Go</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="#">Settings</a></li>
	            <li class="divider"></li>
	            <li><a href="logoutController.jsp">Logout</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	 <!-- modal -->
    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&amp;times;</button>
	            <h4 class="modal-title" id="myModalLabel">Send a Message</h4>
	            </div>
	            <form name="messageForm" action = "sendMessageController.jsp" onsubmit="return validateMessage()" method="POST">
		            <div class="modal-body">
		                <textarea class="span6" rows="3" placeholder="Type your message here..." required name="message"></textarea>
		            </div>
	            	<div class="modal-footer">
	                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                
	               		<button type="submit" class="btn btn-success" data-dismiss="modal">Send</button>
	               	</div>
	            </form>
	                
	        </div>
	    </div>
	</div>
	
	  <div class="row">
	  
	     
	    <div class="col-md-3">
	      <div class="panel">
	        <a href="#"><img src="img/default_profile_large.jpg"/></a>
	        <h5><a href="#"><%= user.getFirstName() + " " + user.getLastName() %></a></h5>
	          <div class="section-container vertical-nav" data-section data-options="deep_linking: false; one_up: true">
	          
	          <section class="section">
	          	<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#basicModal"><span class="glyphicon glyphicon-envelope" aria-hidden="false"></span> Send Message</a>
	          </section>
	          <br/>
	          <section class="section">
	            <button class="btn btn-primary" type="button">
	  				Following <span class="badge"><%= user.getNumFollowing() %></span>
				</button>
	          </section>
	          <br/>
	          <section class="section">
	    	      <button class="btn btn-primary" type="button">
	  				Followers <span class="badge"><%= user.getNumFollowers() %></span>
					</button>
	          </section>
	        </div>
	 
	      </div>
	    </div>
	    <div class="col-md-8">
	    	<div class="panel">
	    		<div class="row">
	    			<div class="col-sm-12" style="text-align:center;vertical-align:text-bottom">
	    				<h3>Account Information</h3>
	    			</div>
	    		</div>
	    	</div>
	    	<div class="panel">	    		
	    		<div class="row">
	    		<form name="settingsForm" action="changeSettingsController.jsp" onsubmit="return validateSettingsChanges()" method="POST">
	    			 <div class="section-container vertical-nav" data-section data-options="deep_linking: false; one_up: true">
	          
			          <section class="section">
			          	<div class="col-md-3" style="text-align:center;vertical-align:text-bottom">
			          		First Name:
			          	</div>
			          	<div class="col-md-9">
			          		<input type="text" placeholder=<%= user.getFirstName() %> name="firstname"></input>
			          	</div>
			          </section>
			          <br/>
			          <section class="section">
				          <div class="col-md-3" style="text-align:center;vertical-align:text-bottom">
				            Last Name:
				          </div>
				          <div class="col-md-9">
				            <input type="text" placeholder=<%= user.getLastName() %> name="lastname"></input>
				          </div>
			          </section>
			          <br/>
			          <section class="section">
				          <div class="col-md-3" style="text-align:center;vertical-align:text-bottom">
				    	    Address:
				    	  </div>
				    	  <div class="col-md-9">
				    	    <input type="text" placeholder=<%= user.getAddress() %> name="address"></input>
				    	  </div>
			          </section>
			          <br/>
			          <section class="section">
			         	  <div class="col-md-3" style="text-align:center;vertical-align:text-bottom">
				    	    Email:
				    	  </div>
				    	  <div class="col-md-9">
				    	    <input type="text" placeholder=<%= user.getEmail() %> name="email"></input>
				    	  </div>
				      </section>
			          <br/>
			          <section class="section">
			          	<div class="col-md-3" style="text-align:center;vertical-align:text-bottom">
			    	    	Phone:
			    	   	</div>
			    	   	<div class="col-md-9">
			    	   		<input type="text" placeholder=<%= user.getPhone() %> name="phone"></input>
			    	   	</div>
			          </section>
			          <section class="section">
			          	<div class="col-md-12" style="text-align:center;vertical-align:text-bottom">
			    	    	<button type="submit" class= "btn btn-success">Save Changes</button>
			    	   	</div>
			          </section>
			        </div>
			       </form>
	    
	    		</div>
	    	</div>
	    </div>
	   </div>
    </div>

</body>
</html>
<%
	}
%>
