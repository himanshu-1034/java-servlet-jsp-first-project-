package project;

import java.sql.DriverManager;
import java.sql.*;
public class ConnectionProvider {
	
	public static Connection getCon() {
		Connection connection = null;
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
		     connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","e_commerce_java_web","");
			
		}catch(Exception e) {e.printStackTrace();}
		
		return connection;
	}

}

//
//Class.forName("oracle.jdbc.driver.OracleDriver");
//connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","","");