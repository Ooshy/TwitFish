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

<script>
        function validateUsernameAndPassword() {
                var x = document.forms["loginForm"]["username"].value;
                var y = document.forms["loginForm"]["password"].value;
                if (x == null || x == "" || y == null || y == "") {
                        alert("You must enter both a username and password.");
                        return false;
                }
                return true;
        }
        
        
</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TwitFish</title>
</head>
<body style="background-color:#333333; background-image: url('img/fishLogin.jpg')">
     
 
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
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  <div class="row">
 
    <div class="large-6 columns">
		<div class="row" style="background-color:#008AE6; padding-top:5px;padding-bottom:10px;margin-top:40px;">
			<br/>

	        <div class="large-10 columns">
	        <h3 style="color:#FFFFFF;font-family:"Helvetica Neue"> Welcome to TwitFish</h3>
	        <form name="loginForm" action="loginController.jsp" onsubmit="return validateUsernameAndPassword()" method="POST">				
	        	<div class="input-group">
				  <input type="text" class="form-control" placeholder="Username" name="username">
				</div>
				<div class="input-group">
				  <input type="password" class="form-control" placeholder="Password" name="password">
				</div>
				</br>
				<button type="submit" class="btn btn-primary btn-default">Log In</button>
		    </form>
			
	        </form>
	       <br/>
	          <ul class="inline-list">
	          	<li>
	          		<p style="color:#FFFFFF">Don't want an account? </p>
	            	<form name="browseAnonymously" action="browseAnonymously.jsp"  method="POST">
	            		<button type="submit" class="btn btn-primary btn-default">Browse Anonymously</button>
	            	</form>
	            </li>
	            <li>
	            	<p style="color:#FFFFFF">Don't have an account? </p>
	            	<form name="registerForm" action="registerController.jsp" onsubmit="return validateUsernameAndPassword()" method="POST">
	            		<button type="submit" class="btn btn-primary btn-default">Register</button>		
	            	</form>
	            </li>
	          </ul>
	        </div>
	      </div>
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
            <li><a href="#" style="color:#DDDDDD">Contact</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
    
</body>
</html>>