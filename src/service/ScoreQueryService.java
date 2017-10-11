package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.JDBCclass;

public class ScoreQueryService {

	public ResultSet scoreQuery(String banji) {
		
		String sql;
		ResultSet rs = null;
		
		switch(banji) {
		
			case "15级计算机五班":
				sql = "select * from 15jisuanji5ban";
				break;
			case "15级计算机一班":
				sql = "select * from 15jisuanji1ban";
				break;
			case "14级计算机一班":
				sql = "select * from 14chengji";
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
