<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css" type="text/css">
	<!-- <script src="https://kit.fontawesome.com/43290fa92d.js" crossorigin="anonymous"></script> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
	
	
</head>

	<body>
	
		<!-- Navigation Bar -->
		<%@include file="navigation_bar.jsp" %>
		
		
		<main class="p-5 banner-background  primary-background " style="">
			
			<div class="container">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
						
							<i class="fas fa-user-circle mb-2 fa-3x"></i>
							<br>
							<p>Register Here</p>
							
						</div>
						
						<div class="card-body">
							
							<form id="reg-form" action="ResisterServlet" method="post">
							
							  <div class="form-group">
							    <label for="userName">User Name</label>
							    <input name="userName" type="text" class="form-control" id="userName" aria-describedby="emailHelp" placeholder="Enter name here">
							  </div>
						
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="userEmail" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="userPass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  
							  <div class="form-group">
							    <label for="gender">Gender</label>
							    <br>
							    <input type="radio"  id="gender" name="userGender" value="Male">Male
							    <input type="radio"  id="gender" name="userGender" value="Female">Female
							  </div>
							  
							  <div class="form-group">
							    <textarea rows="5"  name="userAbout" class="form-control" placeholder="Enter somthing about your self"></textarea>
							  </div>
							  
							  <div class="form-check">
							    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
							  </div>
							  
							  <br>
							  <div  class="container text-center" id="loader" style="display: none;">
							  	<i class="fa-solid fa-arrows-rotate fa-spin fa-4x"></i>
							  	<h4>Please wait..</h4>
							  </div>
							  
							  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
							
							 </form>
							
						</div>
						
						<div class="card-footer">
							
						</div>
						
					</div>
				</div>
			</div>
			
		</main>
		
		
		
		<!-- JavaScript -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
		
		
	<script type="text/javascript">
		$(document).ready(function () {
			console.log("Page is ready..");
			
			$("#reg-form").on('submit', function(event){
				
				// It prevent to the going to servlete page
				event.preventDefault();
				// load the full form data in this variable
				let form = new FormData(this);
				// Send the data to register servlete page
				
				// Hide submit button and show refress icon
				$("#submit-btn").hide();
				$("#loader").show();
				
				$.ajax({
					url: "ResisterServlet",
					data: form,
					type: 'POST',
					success: function(data, textStatus, jqXHR){
						console.log(data);	
						// Hide repress icon  and show submit button
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim() == 'Success'){
							
							swal("Registered successfully.. Go To Login Page..")
							.then((value) => {
							  window.location = "login_page.jsp";
							});
							
						}else{
							swal(data);
						}
						
						
						
					},
					
					error: function(jqXHR, textStatus, errorThrown){
						// Hide repress icon  and show submit button
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something went wrong.. please try again..");
					},
					processData: false,
					contentType: false
				
				})
				
				
			})
		})
			
		
	</script>
		
	</body>
	
</html>