package techcraft.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnection {
	static Connection conn = null;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/techcraft?useSSL=false", "root", "Harshal@7");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception {
		return conn;
	}
}
