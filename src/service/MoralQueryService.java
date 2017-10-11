package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.JDBCclass;

public class MoralQueryService {

	
public ResultSet moralQuery(String nianji) {
		
		String sql;
		ResultSet rs = null;
		
		switch(nianji) {
		
			case "2三月":
				sql = "select * from moral201503 order by ID";
				break;
			case "3三月":
				sql = "select * from moral201603 order by ID";
				break;
			case "3四月":
				sql = "select * from moral201604 order by ID";
				break;
			default:
				sql = "";
		}
		 
		   try {
			   JDBCclass jdbc = new JDBCclass();
			   Connection con = jdbc.getConnection();
			   PreparedStatement pst = con.prepareStatement(sql);
			rs= pst.executeQuery();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		   return rs;
	}
	
}
