<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%
        String username = request.getParameter("username");
		out.println("FUCK THIS SHIT");
		out.println(username);
        
        
        String password  = request.getParameter("password");
        out.println("FUCK THIS SHIT");
        out.println(password);
        //Hashtable<String, String> lg_info = new Hashtable<String, String>();
        //session.setAttribute("lg_info", lg_info);

        //lg_info.put("error", "");

        if (username == "" || username == null || password == "" || password == null){
                //lg_info.put("error", "Missing first name or last name.");
                out.println("FUCK THIS SHIT");
                //response.sendRedirect("login.jsp");
        }else{
                //lg_info.put("username", username);
                //lg_info.put("password", password);
               

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
                            	   Statement insertStatement = conn.createStatement();
                            	   String insertString = "INSERT INTO User VALUES (null, null, null, null, null, '" + username + "', '" + password + ")";
                            	   conn.close();
                            	   session.setAttribute("username", username);
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
               		
               }
         }
 %>                                      