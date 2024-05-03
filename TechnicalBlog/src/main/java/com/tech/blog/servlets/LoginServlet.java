package com.tech.blog.servlets;
import com.tech.blog.entities.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.cj.protocol.Message;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch email and pass form login page using request
		
		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("userLoginEmail");
		String userPassword = request.getParameter("userLoginPassword");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			
		}else {
			//out.println("Invalide Details..Plase try agail.");
			
			Messages msg = new Messages("Invalide Details..Please try again", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}
	}

}
