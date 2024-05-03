package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		//super();
		this.con = con;
	}
	
	
	// insert the data user to database
	
	public boolean insertUser(User user) {
		
		boolean f = false;
		
		try {
			
			String query = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
			
			PreparedStatement ps = this.con.prepareStatement(query);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			
			ps.executeUpdate();
			f = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	// get user by user email and password
	public User getUserByEmailAndPassword(String email, String password) {
		
		User user = null;
		
		try {
			
			String query = "select * from user where email = ? and password = ?";
			
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet set = pst.executeQuery();
			
			if(set.next()) {
				
				user = new User();
				
				//Get the data form database
				String name = set.getString("name");
				
				// Set the data to user object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("reg_time"));
				user.setProfile(set.getString("profile"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

	
	public boolean updateUser(User user) {
		
		boolean success = false;
		try {
			
			String query = "update user set name = ?, email = ?, password = ?, gender = ?, about = ?, profile = ? where id = ?";
			
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			pst.setString(6, user.getProfile());
			
			pst.setInt(7, user.getId());
			
			pst.executeUpdate();
			success = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;
		
		try {
			
			String query = "select * from user where id = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, userId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				
				user = new User();
				
				//Get the data form database
				String name = rs.getString("name");
				
				// Set the data to user object
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("reg_time"));
				user.setProfile(rs.getString("profile"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
