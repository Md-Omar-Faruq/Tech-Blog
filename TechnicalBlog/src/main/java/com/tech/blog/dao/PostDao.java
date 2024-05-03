package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categoris;
import com.tech.blog.entities.Post;

public class PostDao {
	
	Connection con;
	

	public PostDao(Connection con) {
		super();
		this.con = con;
	}


	// getting all categories from database
	public ArrayList<Categoris> getAllCategories()

	
	{
		ArrayList<Categoris> list = new ArrayList<Categoris>();
		
		try {
			
			String query = "select * from categories";
			
			
			PreparedStatement pst = con.prepareStatement(query);
		
			
			ResultSet set = pst.executeQuery();
			
			while (set.next()) {
				
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				
				Categoris c = new Categoris(cid, name, description);
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	// Inser the user post into database
	public boolean savePost(Post p) {
		boolean f = false;
		
		try {
			
			String query = "insert into posts(p_title, p_content, p_code, p_pic, cat_id, user_id) values(?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1, p.getpTitle());
			pst.setString(2, p.getpContent());
			pst.setString(3, p.getpCode());
			pst.setString(4, p.getpPic());
			pst.setInt(5, p.getCatID());
			pst.setInt(6, p.getUserID());
			
			pst.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	// getting all post from database
	public List<Post> getAllPost(){
		List<Post> list = new ArrayList<>();
		
		try {
			
			String query = "select * from posts order by pid desc";
			PreparedStatement pst = con.prepareStatement(query);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				
				
				int postId = rs.getInt("pid");
				String postTitle = rs.getString("p_title");
				String postContent = rs.getString("p_content");
				String postCode = rs.getString("p_code");
				String postPic = rs.getString("p_pic");
				Timestamp postTime = rs.getTimestamp("p_time");
				int catId = rs.getInt("cat_id");
				int userId = rs.getInt("user_id");
				
				Post post = new Post(postId, postTitle, postContent, postCode, postPic, postTime, catId, userId);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// getting all post from database by categories wise
	public List<Post> getPostByCatId(int catid){
		List<Post> list = new ArrayList<>();
		
		try {
			
			String query = "select * from posts where cat_id = ? order by pid desc";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, catid);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				
				
				int postId = rs.getInt("pid");
				String postTitle = rs.getString("p_title");
				String postContent = rs.getString("p_content");
				String postCode = rs.getString("p_code");
				String postPic = rs.getString("p_pic");
				Timestamp postTime = rs.getTimestamp("p_time");
				int userId = rs.getInt("user_id");
				
				Post post = new Post(postId, postTitle, postContent, postCode, postPic, postTime, catid, userId);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Post getPostByPostId(int postId) {
		Post post = null;
		
		try {
			
			String query = "select * from posts where pid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, postId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				
				//int postId = rs.getInt("pid");
				String postTitle = rs.getString("p_title");
				String postContent = rs.getString("p_content");
				String postCode = rs.getString("p_code");
				String postPic = rs.getString("p_pic");
				Timestamp postTime = rs.getTimestamp("p_time");
				int catid = rs.getInt("cat_id");
				int userId = rs.getInt("user_id");
				
				post = new Post(postId, postTitle, postContent, postCode, postPic, postTime, catid, userId);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
		
	}
	
	
}
