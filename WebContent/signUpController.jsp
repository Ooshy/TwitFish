<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*" %>

<%
        String username = request.getParameter("username");
        String password  = request.getParameter("password");
        //Hashtable<String, String> lg_info = new Hashtable<String, String>();
        //session.setAttribute("lg_info", lg_info);

        //lg_info.put("error", "");

        if (username == "" || username == null || password == "" || password == null){
                //lg_info.put("error", "Missing first name or last name.");
                response.sendRedirect("login.jsp");
        }else{
                //lg_info.put("username", username);
                //lg_info.put("password", password);




               String JDBC_DRIVER = "com.mysql.jdbc.Driver";
               

               try{
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gruntLabor", "bholster", "datascience");

                       Statement stmt = conn.createStatement();

               
                       String selNum = "SELECT count(*) AS 'COUNT' FROM Bots WHERE username = '"+firstAndpassword+"'";
                       ResultSet st = stmt.executeQuery(selNum);
                       if(st.next()){
                               num = st.getInt("COUNT");
                       }
                       

                       conn.close();
               } catch (Exception e)
               {
               		
               }
         }
 %>                                      