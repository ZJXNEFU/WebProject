package dao;

import java.sql.*;
import java.util.*;


public class JDBCclass {

	 String url="jdbc:mysql://127.0.0.1:3306/webproject";
     String user="root";	
	 String password="root";
	 Connection conn=null;
	public JDBCclass() throws ClassNotFoundException, SQLException
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,password);
	}
	
	public Connection getConnection() {
		
		return conn;
	}
	
	
}
