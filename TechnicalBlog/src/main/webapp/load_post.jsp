
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.*" %>
<%@page import="com.tech.blog.entities.*"%>


	<div class="row">
	
	<%
	
		User user = (User) session.getAttribute("currentUser");
	
		Thread.sleep(1000);
		PostDao postdao = new PostDao(ConnectionProvider.getConnection());
	
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		List<Post> posts = null;
	
		if(cid == 0){
			posts = postdao.getAllPost();
		}else{
			posts = postdao.getPostByCatId(cid);
		}
		
		if(posts.size() == 0){
			out.println("<h3 class='display-3 text-center'>No Data Found..</h3>");
			return;
		}
		
		for(Post p: posts){
			
			%>
			
			<div class="col-md-6 mt-2">
				<div class="card">
				
					<img style="height: 250px; width: 100es; border-radius: 10px; " class="card-img-top" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
					<div class="card-body">
						
						<b><%= p.getpTitle() %></b>
						<p><%= p.getpContent() %></p>
						<%-- <pre><%= p.getpCode() %></pre> --%>
					
					</div>
					
					<div class="card-footer primary-background text-center">
					
						<%
							LikeDao ldo = new LikeDao(ConnectionProvider.getConnection());
									
						%>
					
						<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
						
						
					</div>
					
				</div>
			
			</div>
			
			<%
		}
	
	%>
	
	</div>