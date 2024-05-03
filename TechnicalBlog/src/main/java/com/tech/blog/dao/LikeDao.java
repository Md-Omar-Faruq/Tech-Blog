package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

	Connection con;
	
	
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		
		try {
			
			String query = "insert into likes(pid, uid) values(?, ?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			pst.executeUpdate();
			
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		int count = 0;
		
		try {
			
			String query = "select count(*) from likes where pid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, pid);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean isLikeByUser(int pid, int uid) {
		boolean f = false;
		
		try {
			
			String query = "select * from likes where pid = ? and uid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		
		try {
			
			String query = "delete form likes where pid = ? and uid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}
