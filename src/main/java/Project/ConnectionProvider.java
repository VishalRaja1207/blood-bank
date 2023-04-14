package Project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "vishal");
			return con;
		}
		
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
