<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>

	<%
		User user = (User) session.getAttribute("currentUser");
		if(user == null){
			response.sendRedirect("login_page.jsp");
		}else{
			
			
		}
		
		
	%>
    
    <%
    	int post_id = Integer.parseInt(request.getParameter("post_id"));
    
    	PostDao postdao = new PostDao(ConnectionProvider.getConnection());
    	Post p = postdao.getPostByPostId(post_id);
    	
    	UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		User u = userdao.getUserByUserId(p.getUserID());
    	
    %>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title><%= p.getpTitle() %> || TechBlog</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="css/mystyle.css" type="text/css">
		<!-- <script src="https://kit.fontawesome.com/43290fa92d.js" crossorigin="anonymous"></script> -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
		<script type="text/javascript" src="js/myjs.js"></script>
		
		<style type="text/css">
			
			.post-title{
				font-weight: 100;
				font-size: 30px;
			}
			
			.post-content{
				font-weight: 100;
				font-size: 25px;
			}
			
			.pic-size{
				height: 250px;
				width:  100es;
				border-radius: 10px;
			}
			
			.post-date{
				font-style: italic;
				font-weight: bold;
			}
			
			.post-user-info{
				font-size: 20px;
			}
			.row-user{
				border: 2px solid #e2e2e2;
				padding-top: 15px;
			}
			
			body{
				background: url(img/white.avif);
				background-size: cover;
				background-attachment: fixed;
			}
		</style>
		
		
	</head>
	
	<body >
	
		<!-- Navigation Bar Start -->
	
		<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		  <a class="navbar-brand" href="index.jsp"><i class="fas fa-blog"></i> Tech Block</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="profile.jsp">Profile <span class="sr-only">(current)</span></a>
		      </li>
		      
		      <li class="nav-item active dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Categories
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="#">Programming Language</a>
		          <a class="dropdown-item" href="#">Project Implementation</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="#">Data Structure</a>
		        </div>
		      </li>
		      
		      <li class="nav-item active">
		        <a class="nav-link" href="#">Contact</a>
		      </li>
		      
		      <li class="nav-item active">
		        <a class="nav-link" data-toggle="modal" data-target="#add-post-modal" href="#">Do Post</a>
		      </li>
		      
		     
		      
		    </ul>
		    
		    <ul class="navbar-nav mr-right">
		    
		    
		    	<li class="nav-item active">
		        	<a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><i class="fas fa-user-circle mr-2"></i><%= user.getName() %></a>
		      	</li>
		    
		    	<li class="nav-item active">
		        	<a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket mr-2"></i>Logout</a>
		      	</li>
		      	
		      	
		    </ul>
		    
		  </div>
		</nav>
	
	<!-- End Navigation Bar -->
	
	<!-- Main Part of Post Details -->
	
		<div class="container">
		
			<div class="row my-4">
			
					<div class="col-md-8 offset-md-2">
					
						<div class="card">
						
							<div class="card-header primary-background text-white">
								<h4 class="post-title"><%= p.getpTitle() %></h4>
							</div>
							
							<div class="card-body">
							
								<img class="card-img-top my-3 pic-size" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
								
								<div class="row my-3 row-user">
									
									<div class="col-md-8">
										<p class="post-user-info"><a href="#"><%= u.getName() %></a> Has Posted</p>
									</div>
									
									<div class="col-md-4">
										<p class="post-date"><%=p.getpTime().toLocaleString() %></p>
									</div>
									
								</div>
								
								<p class="post-content"><%= p.getpContent() %></p><br><br>
								
								<div class="post-code">
									<pre><%= p.getpCode() %></pre>
								</div>
								
							</div>
							
							<div class="card-footer primary-background">
							
								<%
									LikeDao ldo = new LikeDao(ConnectionProvider.getConnection());
									
								%>
							
								<a href="#!" onclick="doLike(<%=p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ldo.countLikeOnPost(p.getPid()) %></span> </a>
								<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span> </a>
							</div>
							
							
						</div>
					</div>
			</div>
		</div>
	
	<!-- End of main part of Post Details -->
		
		
	<!-- Profile Modal -->
	
		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white text-center"> 
		        <h5 class="modal-title" id="exampleModalLabel">TechBlock</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	
		      	<div class="container text-center">
		      	
		      		<img alt="" src="pic/<%= user.getProfile() %>" style="border-radius: 50%; max-width: 100px"><br>
		      		<h5 class="modal-title mt-3 mb-3" id="exampleModalLabel"><%= user.getName() %></h5>
		      		
		      		<!-- User Details Table-->
		      		
		      		<div id="profile-details">
		      			
			      		<table class="table">
							 
							  <tbody>
							  
							    <tr>
							      <th scope="row">ID :</th> 
							      <td><%= user.getId() %></td>
							    </tr>
							    
							    <tr>
							      <th scope="row">Email :</th>
							      <td><%= user.getEmail() %></td>
							    </tr>
							    
							    <tr>
							      <th scope="row">Gender :</th>
							      <td><%= user.getGender() %></td>
							    </tr>
							    
							    <tr>
							      <th scope="row">Status :</th>
							      <td><%= user.getAbout() %></td>
							    </tr>
							    
							    <tr>
							      <th scope="row">Registered on :</th>
							      <td><%= user.getDateTime().toString() %></td>
							    </tr>
							    
							  </tbody>
							  
						 </table>
					
					</div>
					
					<!-- Edit User Details Table-->
					
					<div id="profile-edit" style="display: none">
						<h3>Please Edit Carefully..</h3>
						
						<form action="EditServlet" method="post" enctype="multipart/form-data">
						
							 <table class="table">
							 	<tr>
							 		<td>ID :</td>
							 		<td><%= user.getId() %></td>
							 	</tr>
							 	
							 	<tr>
							 		<td>Name :</td>
							 		<td> <input class="form-control" type="text" name="userName" value="<%= user.getName() %>"> </td>
							 	</tr>
							 	
							 	<tr>
							 		<td>Email :</td>
							 		<td> <input class="form-control" type="email" name="userEmail" value="<%= user.getEmail() %>"> </td>
							 	</tr>
							 	
							 	<tr>
							 		<td>Password :</td>
							 		<td> <input class="form-control" type="password" name="userPassword" value="<%= user.getPassword() %>"> </td>
							 	</tr>
							 	
							 	<tr>
							 		<td>Gender :</td>
							 		<td><%= user.getGender().toUpperCase() %></td>
							 	</tr>
							 	
							 	<tr>
							 		<td>About :</td>
							 		<td>
							 			<textarea class="form-control" name="userAbout" rows="3" cols="">
							 				<%= user.getAbout() %>
							 			</textarea>
							 		</td>
							 	</tr>
							 	
							 	<tr>
							 		<td>Set Profile :</td>
							 		<td>
							 			<input type="file" name="image" class="form-control"  >
							 		</td>
							 	</tr>
							 	
							 </table>
							 
							 <div class="container">
							 	<button type="submit" class="btn btn-outline-primary">Save</button>
							 </div>
							 
						</form>
					</div>
		      	
		      	</div>
		      	
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<!-- End of profile modal -->
	
	<!-- Add Post Modal -->
	
		
		
		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	
		      	<form action="AddPostServlet" method="post" id="add-post-form">
		      	
		      		<div class="form-group">
		      			<select class="form-control" name="cid">
		      				<option selected disabled>--Select Categories--</option>
		      				
		      				<%
		      					PostDao postdao1 = new PostDao(ConnectionProvider.getConnection());
		      					ArrayList<Categoris> list = postdao1.getAllCategories();
		      				
		      					for(Categoris c: list){
		      						
		      					
		      					
		      				%>
		      				<option value="<%= c.getCid() %>"><%= c.getName() %></option>
		      				<%
		      					}
		      				%>
		      			</select>
		      		</div>
		      	
		      		<div class="form-group">
		      			<input class="form-control" type="text" placeholder="Enter post title" name="postTitle">
		      		</div> 
		      		
		      		<div class="form-group">
		      			<textarea class="form-control" type="text" placeholder="Enter post content" name="postContent" style="height: 200px;"></textarea>
		      		</div> 
		      		
		      		<div class="form-group">
		      			<textarea class="form-control" type="text" placeholder="Enter code here (if any)" name="postCode" style="height: 200px;"></textarea>
		      		</div> 
		      		
		      		<div class="form-group">
		      			<label>Upload picture</label>
		      			<input class="form-control" type="file" name="postPicture">
		      		</div> 
		      		
		      		<div class="container text-center">
		      			<button type="submit" class="btn btn-outline-primary">Post</button>
		      		</div>
		      		
		      	</form>
		      	
		      </div>
		      
		      
		      
		    </div>
		  </div>
		</div>
	
	<!-- End Post Modal -->
	
	
	
	
	
	<!-- JavaScript -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				let editStatus = false;

				$('#edit-profile-button').click(function(){
					
					if(editStatus == false){
						
						$('#profile-details').hide();
						$('#profile-edit').show();
						
						editStatus = true;
						$(this).text("Back");
					}else{
						$('#profile-details').show();
						$('#profile-edit').hide();
						
						editStatus = false;
						$(this).text("EDIT");
					}
					
				});
				
			});
		
		</script>
		
		<!-- Add Post JavaScript -->
		<script type="text/javascript">
		
			$(document).ready(function(e){
				
				$("#add-post-form").on("submit", function(event){
					//this code execute when post form is submitted
					event.preventDefault();
					console.log("add post form is worke");
					
					let form = new FormData(this);
					
					//nwo request to server
					$.ajax({
						url: "AddPostServlet",
						type: 'POST',
						data: form,
						
						success: function(data, textStatus, jqXHR){
							//success msg
							console.log(data);
							if(data.trim() == "Done"){
								swal("Great Work..!", "Post submitted.", "success");
							}else{
								swal("Error occer", "Somthing happen worng.", "Error");
							}
						},
						
						error: function(jqXHR, textStatus, errorThrown){
							// error msg
							swal("Error occer", "Somthing happen worng.", "Error");
						},
						
						processData: false,
						contentType: false
						
					})
				})
				
			})
		</script>
		
			
	</body>

</html>