package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Messages;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddPostServlet() {
        super();
        
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String postCode = request.getParameter("postCode");
		
		Part part = request.getPart("postPicture");
		String postImage = part.getSubmittedFileName();
		
		// getting current user id from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		int userId = user.getId();
		
		// Load the data to post object
		Post post = new Post(postTitle, postContent, postCode, postImage, cid, userId);
		
		// save the data into database using post dao method
		PostDao pdao = new PostDao(ConnectionProvider.getConnection());
		
		if(pdao.savePost(post)) {
			
			
			
			// save picture into file
			String path = getServletContext().getRealPath("/")+"blog_pic"+File.separator+postImage;
			Helper.saveFile(part.getInputStream(), path);
			
			out.println("Done");
				
				
		}else {
			out.println("Post Submit Failed, Somthing happpen worng.");
		}
		
		//out.println(cid+postTitle+postContent+postCode);
		//out.println(part.getSubmittedFileName());
		
		
	}

}
