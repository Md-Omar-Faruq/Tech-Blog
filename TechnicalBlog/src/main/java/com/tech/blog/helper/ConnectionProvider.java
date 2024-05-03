package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection() {
		
		String url = "jdbc:mysql://localhost:3306/techblock";
		String userName = "root";
		String password = "";
		
		try {
			
			if(con==null) {
				// Load Driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				// Create Connection
				con = DriverManager.getConnection(url, userName, password);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
}
