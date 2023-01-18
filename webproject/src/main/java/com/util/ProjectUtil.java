package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProjectUtil 
{
	static Connection conn = null;
    public static Connection createConnection()
    {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhargav_java","root","");
		} catch (Exception e) {
         e.printStackTrace();		
        }
		return conn;
}
}
 