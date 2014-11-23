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
<script>
	function validateMessage()
	{
		alert("WHY");
		//var message = document.forms["messageForm"]["message"].value;
		//alert(message);
		return true;
	}
</script>
<style>
#grad1 {
    height: 200px;
    background: -webkit-linear-gradient( #33CCFF, #003399); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient( #33CCFF, #003399); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient( #33CCFF,  #003399); /* For Firefox 3.6 to 15 */
    background: linear-gradient(#33CCFF, #003399); /* Standard syntax (must be last)
</style>

</head>

<%

	String username = (String)session.getAttribute("username");
	
	
	if (username == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
		/*User user = new User((String) session.getAttribute("firstname"),
				(String)session.getAttribute("lastname"),
				(String)session.getAttribute("address"),
				(String)session.getAttribute("profile"),
				(String)session.getAttribute("email"),
				(String)session.getAttribute("phone]"));
		*/
		User user = AuthenticatedUserSingleton.getUser();
				
%>


<body id = "grad1">
 
 
     
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
        <li class="active"><a href="#">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="#">Messages</a></li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search @example #topic">
        </div>
        <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-search" aria-hidden="false"></span></button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="settings.jsp">Settings</a></li>
            <li class="divider"></li>
            <li><a href="logoutController.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  <div class="row">
  
     
    <div class="large-3 columns ">
      <div class="panel">
        <a href="settings.jsp"><img src="img/default_profile_large.jpg"/></a>
        <h5><a href="#"><%= user.getFirstName() + " " + user.getLastName() %></a></h5>
          <div class="section-container vertical-nav" data-section data-options="deep_linking: false; one_up: true">
          
          <section class="section">
          	<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#basicModal"><span class="glyphicon glyphicon-envelope" aria-hidden="false"></span> Send Message</a>
          </section>
          <br/>
          <section class="section">
            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#followingModal">
  				Following <span class="badge"><%= user.getNumFollowing() %></span>
			</a>
          </section>
          <br/>
          <section class="section">
    	    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#followersModal">
  				Followers <span class="badge"><%= user.getNumFollowers() %></span>
			</a>
          </section>
        </div>
 
      </div>
    </div>
    
    <!-- modal -->
    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&amp;times;</button>
	            <h4 class="modal-title" id="myModalLabel">Send a Message</h4>
	            </div>
	            <form name="messageForm" action="sendMessageController.jsp" onsubmit="return validateMessage()" method="POST">
		            <div class="modal-body">
		                <textarea class="span6" rows="3" placeholder="Type your message here..." name="message" required></textarea>
		            </div>
	            	<div class="modal-footer">
	                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                
	               		<button type="submit" class="btn btn-success" data-dismiss="modal">Send</button>
	               	</div>
	            </form>
	                
	        </div>
	    </div>
	</div>
	
	<!-- followers modal -->
    <div class="modal fade" id="followersModal" tabindex="-1" role="dialog" aria-labelledby="followersModal" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&amp;times;</button>
	            <h4 class="modal-title" id="myModalLabel">People following you...</h4>
	            </div>
	            <div class="modal-body">
	                <%
	                	for ( User u : user.getFollowers())
	                	{
	                %>
	                <p><%= u.getFirstName() + " " + u.getLastName() %></p>
	                <%
	                	}
	                %>
	            </div>
            	<div class="modal-footer">
                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                

               	</div>
	            
	                
	        </div>
	    </div>
	</div>
	
    <!-- modal -->
    <div class="modal fade" id="followingModal" tabindex="-1" role="dialog" aria-labelledby="followingModal" aria-hidden="true">
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
    <div class="large-9 columns">
 
       <%
       for (int i = 0; i != 3; ++i)
       {
       %>
       <div class="panel" style="background-color:#FFFFFF">
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
          <p style="color:#DDDDDD">� Copyright TwitFish LLC.</p>
        </div>
        <div class="large-7 columns">
          <ul class="inline-list right">
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
</div>
</body>

<%
	}
%>
</html>>

