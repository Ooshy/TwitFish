<%@page import="twitFish.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%
	String username = request.getParameter("username");        
    String password  = request.getParameter("password");
    Connection conn = null;
    //Hashtable<String, String> lg_info = new Hashtable<String, String>();
    //session.setAttribute("lg_info", lg_info);

    //lg_info.put("error", "");

    if (username == "" || username == null || password == "" || password == null){
   // should never happen
    }else{
       try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/TwitFish", "root", "password");

            Statement stmt = conn.createStatement();
            String selNum = "SELECT *, count(*) AS 'COUNT' FROM User WHERE username = '" + username + "' && password = '" + password + "'";
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
                   	    session.setAttribute("userid", st.getInt("UserID"));  
                     		/*session.setAttribute("firstname", userInfoResultSet.getString("FirstName"));
                     		session.setAttribute("lastname",  userInfoResultSet.getString("LastName"));
                     		session.setAttribute("address", userInfoResultSet.getString("Address"));
                     		session.setAttribute("phone", userInfoResultSet.getString("Phone"));
                     		session.setAttribute("email", userInfoResultSet.getString("Email"));*/
                    }
                 
                 	response.sendRedirect("MainScreen.jsp");
                 	 
            
            }
       } catch (Exception e)
       {
       		out.println(e);
       }
       finally
       {
    	   conn.close();
       }
    }
%>                                      