<%@page import="twitFish.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%
        String username = request.getParameter("username");

        
        String password  = request.getParameter("password");

        if (username == "" || username == null || password == "" || password == null){
			// this should never happen
        }else{
               
               try{
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

                       Statement stmt = conn.createStatement();
                       String selNum = "SELECT count(*) AS 'COUNT' FROM User WHERE username = '" + username + "'";
                       ResultSet st = stmt.executeQuery(selNum);
                       if(st.next()){
                               int num = st.getInt("COUNT");
                               if ( num == 0 ) // create account
                               {
                            	   
                            	   String insertString = "INSERT INTO User VALUES (null, ?, ?, ?, null, ?, ?, ?, ?)";
                            	   PreparedStatement insertStatement = conn.prepareStatement(insertString);
                            	   String firstName = (String) request.getParameter("firstname");
                            	   String lastName  = (String) request.getParameter("lastname");
                            	   String address   = (String) request.getParameter("address");
                            	   String email     = (String) request.getParameter("email");
                            	   String phone     = (String) request.getParameter("phone");
                            	   
                            	   insertStatement.setString(1, firstName != null ? firstName : "");
                            	   insertStatement.setString(2, lastName  != null ? lastName  : "");
                            	   insertStatement.setString(3, (String) address != null ? address : "");
                            		// set profile picture to null
                            	   insertStatement.setString(4, username != null ? username : "");
                            	   insertStatement.setString(5, password != null ? password : "");
                            	   insertStatement.setString(6, email    != null ? email    : "");
                            	   insertStatement.setString(7, phone    != null ? phone    : "");
                            	   insertStatement.executeUpdate();
                            	   
                            	   conn.close();
                            	   session.setAttribute("username", username);
                            	   session.setAttribute("firstname", firstName);
                           		   session.setAttribute("lastname",  lastName );
                           		   session.setAttribute("address", address );
                           		   session.setAttribute("phone", phone );
                           		   session.setAttribute("email", email );
                           		   
	                           		User user = new User(username, password);
	                           		//out.println(user);
	                           		//if (true) throw new Exception("Debug");
	                           		if (AuthenticatedUserSingleton.getUser() == null)
	                           			AuthenticatedUserSingleton.setAuthenticatedUser(user);
	                            	   
	                            	  
                            	   response.sendRedirect("MainScreen.jsp");
                               }
                               else
                               {
                            	   session.setAttribute("username", null);
                            	   // return error message THIS NAME HAS ALREADY BEEN TAKEN
                               }
                       }
                       

                       conn.close();
               } catch (Exception e)
               {
            	   out.println(e);
//            	   response.sendRedirect("register.jsp");
               }
         }
 %>                                      