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
                            	   
                            	   String insertString = "INSERT INTO User VALUES (null, ?, ?, ?, ?, ?, null, ?, ?)";
                            	   PreparedStatement insertStatement = conn.prepareStatement(insertString);
                            	   String firstName = (String) request.getParameter("firstname");
                            	   String lastName  = (String) request.getParameter("lastname");
                            	   String address   = (String) request.getParameter("address");
                            	   String email     = (String) request.getParameter("email");
                            	   String phone     = (String) request.getParameter("phone");
                            	   
                            	   insertStatement.setString(1, firstName != null ? firstName : "");
                            	   insertStatement.setString(2, lastName  != null ? lastName  : "");
                            	   insertStatement.setString(3, (String) address != null ? address : "");
                            	   insertStatement.setString(4, email    != null ? email    : "");
                            	   insertStatement.setString(5, phone    != null ? phone    : "");
                            		// set profile picture to null
                            	   insertStatement.setString(6, username != null ? username : "");
                            	   insertStatement.setString(7, password != null ? password : "");
                            	   
                            	   insertStatement.executeUpdate();
                            	   // i think that may be it
                            	   conn.close();
                            	   
	                            	   
	                            	  
                            	   response.sendRedirect("login.jsp");
                               }
                               else
                               {
                            	   session.setAttribute("userid", null);
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