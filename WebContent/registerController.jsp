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
                            	   
                            	   String insertString = "INSERT INTO User VALUES (null, ?, ?, ?, null, ?, ?, ?)";
                            	   PreparedStatement insertStatement = conn.prepareStatement(insertString);
                            	   insertStatement.setString(1, (String) request.getAttribute("firstname"));
                            	   insertStatement.setString(2, (String) request.getAttribute("lastname"));
                            	   insertStatement.setString(3, (String) request.getAttribute("address"));
                            		// set profile picture to null
                            	   insertStatement.setString(4, (String) request.getAttribute("username"));
                            	   insertStatement.setString(5, (String) request.getAttribute("password"));
                            	   insertStatement.setString(6, (String) request.getAttribute("email"));
                            	   insertStatement.executeUpdate(insertString);
                            	   
                            	   conn.close();
                            	   session.setAttribute("username", username);
                            	   session.setAttribute("firstname", request.getAttribute("firstname"));
                           		   session.setAttribute("lastname",  request.getAttribute("lastname"));
                           		   session.setAttribute("address", request.getAttribute("address"));
                           		   session.setAttribute("phone", request.getAttribute("phone"));
                           		   session.setAttribute("email", request.getAttribute("email"));
                           		   
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
            	   
            	   response.sendRedirect("register.jsp");
               }
         }
 %>                                      