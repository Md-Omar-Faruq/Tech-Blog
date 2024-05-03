package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class ResisterServlet
 */
@MultipartConfig
public class ResisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String pass = request.getParameter("userPass");
		String gender = request.getParameter("userGender");
		String about = request.getParameter("userAbout");
		
		String confirm = request.getParameter("check");
		
		if(confirm==null) {
			out.println("Please Agree Terms and Condition..");
		}else {
			
			//create object user and set all data to that object
			User user = new User(name, email, pass, gender, about);
			
			// Create object userDao
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.insertUser(user)) {
				out.println("Success");
			}else {
				out.println("Error occer..");
			}
			
		}
		
		
		
	}

}
