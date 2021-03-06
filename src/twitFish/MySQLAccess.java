package twitFish;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;


public class MySQLAccess {
  private Connection connect = null;
  private Statement statement = null;
  private PreparedStatement preparedStatement = null;
  private ResultSet resultSet = null;

  public void readDataBase() throws Exception {
    try {
      // this will load the MySQL driver, each DB has its own driver
      Class.forName("com.mysql.jdbc.Driver");
      // setup the connection with the DB.
      connect = DriverManager
          .getConnection("jdbc:mysql://localhost:3306/twitfish?"
              + "user=root&password=password");
//      connect = DriverManager
//              .getConnection("jdbc:mysql://rosemary.umw.edu/twitter?"
//                  + "user=czimmer2&password=Cz635804");
      // statements allow to issue SQL queries to the database
//      statement = connect.createStatement();
//      // resultSet gets the result of the SQL query
//      resultSet = statement
//          .executeQuery("select * from Users");
//      writeResultSet(resultSet);
//
      // preparedStatements can use variables and are more efficient
      preparedStatement = connect
          .prepareStatement("insert into User values (null, ?, ?, ?)");
      // "myuser, webpage, datum, summary, COMMENTS from FEEDBACK.COMMENTS");
      // parameters start with 1
      preparedStatement.setString(1, "Chris");
      preparedStatement.setString(2, "Zimmerman");
      preparedStatement.setString(3, "101 Wilderness Drive");
      
      preparedStatement.executeUpdate();
//
//      preparedStatement = connect
//          .prepareStatement("SELECT first_name, last_name from Users");
//      resultSet = preparedStatement.executeQuery();
//      writeResultSet(resultSet);
//
//      // remove again the insert comment
////      preparedStatement = connect
////      .prepareStatement("delete from Users where first_name = ? ; ");
////      preparedStatement.setString(1, "Chris");
////      preparedStatement.executeUpdate();
////      
//      resultSet = statement
//      .executeQuery("select * from Users");
//      writeMetaData(resultSet);
      
    } catch (Exception e) {
      System.out.println( e);
    } finally {
      close();
    }

  }

  private void writeMetaData(ResultSet resultSet) throws SQLException {
    // now get some metadata from the database
    System.out.println("The columns in the table are: ");
    System.out.println("Table: " + resultSet.getMetaData().getTableName(1));
    for  (int i = 1; i<= resultSet.getMetaData().getColumnCount(); i++){
      System.out.println("Column " +i  + " "+ resultSet.getMetaData().getColumnName(i));
    }
  }

  private void writeResultSet(ResultSet resultSet) throws SQLException {
    // resultSet is initialised before the first data set
    while (resultSet.next()) {
      // it is possible to get the columns via name
      // also possible to get the columns via the column number
      // which starts at 1
      // e.g., resultSet.getSTring(2);
      String first_name = resultSet.getString("first_name");
      String last_name = resultSet.getString("last_name");
      
      System.out.println("User: " + first_name);
      System.out.println("Website: " + last_name);
      
    }
  }

  // you need to close all three to make sure
  private void close() {
    try{
    	resultSet.close();
    }catch (Exception e) {}
    try{
    	statement.close();
    }
    catch (Exception e) {}
    try{
    	connect.close();
    }catch (Exception e){}
  }
//  private void close(Closeable c) {
//    try {
//      if (c != null) {
//        c.close();
//      }
//    } catch (Exception e) {
//    // don't throw now as it might leave following closables in undefined state
//    }
//  }
} 