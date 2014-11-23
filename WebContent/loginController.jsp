<%@page import="twitFish.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%
        String username = request.getParameter("username");        
        String password  = request.getParameter("password");

        //Hashtable<String, String> lg_info = new Hashtable<String, String>();
        //session.setAttribute("lg_info", lg_info);

        //lg_info.put("error", "");

        if (username == "" || username == null || password == "" || password == null){
		     // should never happen
        }else{
               try{
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

                       Statement stmt = conn.createStatement();
                       String selNum = "SELECT count(*) AS 'COUNT' FROM User WHERE username = '" + username + "' && password = '" + password + "'";
                       ResultSet st = stmt.executeQuery(selNum);
                       if(st.next()){
                               int num = st.getInt("COUNT");
                               if ( num == 0 ) // create account
                               {
                            	   response.sendRedirect("login.jsp");
                            	  // error you do not exist
                               }
                               else
                               {
                            	   Statement userInfoStmt = conn.createStatement();
                                   String userInfoString = "SELECT *  FROM User WHERE username = '" + username + "' && password = '" + password + "'";
                                   ResultSet userInfoResultSet = userInfoStmt.executeQuery(userInfoString);
                                   if (userInfoResultSet.next())
                                   {
                                	   
                                		session.setAttribute("firstname", userInfoResultSet.getString("FirstName"));
                                		session.setAttribute("lastname",  userInfoResultSet.getString("LastName"));
                                		session.setAttribute("address", userInfoResultSet.getString("Address"));
                                		session.setAttribute("phone", userInfoResultSet.getString("Phone"));
                                		session.setAttribute("email", userInfoResultSet.getString("Email"));
                                   }
                            	   session.setAttribute("username", username);
                            	   AuthenticatedUserSingleton userSingleton = AuthenticatedUserSingleton.getInstance();
                           		
                           		User user = new User(username, password);
                           		//out.println(user);
                           		//if (true) throw new Exception("Debug");
                           		if (AuthenticatedUserSingleton.getUser() == null)
                           			AuthenticatedUserSingleton.setAuthenticatedUser(user);
                            	   conn.close();
                            	   response.sendRedirect("MainScreen.jsp");
                            	   // return error message THIS NAME HAS ALREADY BEEN TAKEN
                               }
                       }
                       

                       conn.close();
               } catch (Exception e)
               {
               		out.println(e);
               }
         }
 %>                                      