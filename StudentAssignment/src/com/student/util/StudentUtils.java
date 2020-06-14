package com.student.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StudentUtils {
	private static String url = "jdbc:mysql://localhost:3306/student";
	private static String diriver = "com.mysql.cj.jdbc.Driver";
	private static String username = "root";
	private static String password = "root";
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName(diriver);
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static Date stringToDate(String sDate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date date = null;
		try {
			date = sdf.parse(sDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
		
	}

}


