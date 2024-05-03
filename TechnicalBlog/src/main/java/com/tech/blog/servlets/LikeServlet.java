package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;


public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void generateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	PrintWriter out = response.getWriter();
    	
    	int pid = Integer.parseInt(request.getParameter("pid"));
    	int uid = Integer.parseInt(request.getParameter("uid"));
    	String operation = request.getParameter("operation");
    	
		/* out.println(pid+" "+uid+" "+operation); */
    	
    	LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
    	
    	if(operation.equals("like")) {
    		boolean f = likedao.insertLike(pid, uid);
    		out.println(f);
    	}
    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		generateData(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		generateData(request, response);
	}

}
