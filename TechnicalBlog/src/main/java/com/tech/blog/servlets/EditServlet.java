package com.tech.blog.servlets;

import jakarta.servlet.ServletContext;
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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Messages;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EditServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		// Fetching data from user edit form
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String userAbout = request.getParameter("userAbout");
		// get image
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		//get the user info from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		// set new data into user object
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		
		String oldFile = user.getProfile();
		
		user.setProfile(imageName);
		
		// updating data into database
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		
		boolean isUpdate = userdao.updateUser(user);
		
		if(isUpdate) {
			
			
			String oldFilePath = getServletContext().getRealPath("/")+"pic"+File.separator+oldFile;
			
			if(oldFile.equals("default.png")) {
				Helper.deleteFile(oldFilePath);
			}
			
			
			String path = getServletContext().getRealPath("/")+"pic"+File.separator+user.getProfile();
			
			if(Helper.saveFile(part.getInputStream(), path)) {
				
				Messages msg = new Messages("Profile Update successfully..", "success", "alert-success");
				session.setAttribute("msg", msg); 
			}else {
				
				Messages msg = new Messages("Somthing happen worng, Please try again", "error", "alert-danger");
				session.setAttribute("msg", msg);
				
			}
			
			
		}else {
			out.println("Update Feild, Somthing with worng.");
			Messages msg = new Messages("Somthing happen worng, Please try again", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		
		response.sendRedirect("profile.jsp");
		
		
	}

}
