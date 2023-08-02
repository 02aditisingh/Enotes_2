package com.Db;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	
		private static Connection conn;
		public static Connection getConn() {
			try {
				if(conn==null) {
				//load the driver
				Class.forName("com.mysql.jdbc.Driver");
				
				//creating a connection
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","system");
			}
			}
			catch(Exception e) {
				e.printStackTrace();
				
				
			
		}
			return conn;
		
	}
		
}
