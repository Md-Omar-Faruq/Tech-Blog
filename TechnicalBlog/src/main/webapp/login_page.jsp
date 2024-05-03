<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.tech.blog.entities.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css" type="text/css">
	<!-- <script src="https://kit.fontawesome.com/43290fa92d.js" crossorigin="anonymous"></script> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
	
	
</head>

<body>

	<!-- Navigation Bar -->
	<%@include file="navigation_bar.jsp" %>

	<main class="d-flex align-items-center primary-background " style="height: 70vh">
	
		<div class="container">
			<div class="col-md-4 offset-md-4">
				
				<div class="card">
					
					<div class="card-header primary-background text-white text-center">
						
						
						<i class="fas fa-user-circle fa-3x mb-2 "></i>
						<br>
						<p>Login Here</p>
						
					</div>
					
					<%
						Messages msg =(Messages) session.getAttribute("msg");
						if(msg != null){
					%>
					
						<div class="alert <%= msg.getCssClass() %>" role="alert">
							  <%= msg.getContent() %>
						</div>
					
					<%	
						session.removeAttribute("msg");	
						}
					%>
					
					<div class="card-body">
					
						<form action="LoginServlet" method="post" >
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name="userLoginEmail" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="userLoginPassword" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  
						  
						  <div class="container text-center">
						  	<button type="submit" class="btn btn-primary">Submit</button>
						  </div>
						  
						</form>
					</div>
					
				</div>
				
			</div>
		</div>
		
	</main>




	<!-- JavaScript -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		
</body>

</html>