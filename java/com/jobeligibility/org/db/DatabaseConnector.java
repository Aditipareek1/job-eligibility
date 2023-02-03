package com.jobeligibility.org.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
	
	private static DatabaseConnector dbObj;
	
	private DatabaseConnector() {
		
	}
	
	public static DatabaseConnector getInstance() {
		
		if(dbObj == null) {
			dbObj = new DatabaseConnector();
		}
		
		return dbObj;
	}
	
	public Connection getConnection()throws ClassNotFoundException, SQLException {
		
		Connection con = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/jobeligibility","root","root");
		return con;
	}

}
