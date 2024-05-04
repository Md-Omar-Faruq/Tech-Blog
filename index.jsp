<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Tech Blog</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css" type="text/css">
	<!-- <script src="https://kit.fontawesome.com/43290fa92d.js" crossorigin="anonymous"></script> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
	
	
	</head>
	
	<body>
	
		<!-- Navigation Bar -->
		<%@include file="navigation_bar.jsp" %>
		
		<!-- Banner -->
		<div class="container-fluid p-0 m-0">
			<div class="jumbotron primary-background text-white">
				<div class="container">
					<h3 class="display-3">Welcome to TechBlog</h3>
					
					<p>A programming language is a set of instructions written by a programmer to instruct a computer on how to perform a task. Programming languages are commonly categorized into four types: imperative, functional, logic, and object oriented.</p>

					<p>
						Gaining a job in the IT industry is easy and also quite tough. You will need to possess both technical and non-technical skills. In terms of technical, the first and foremost skill any aspirant looking for a place in tech must acquire is the mastery of programming languages.
					</p>

					<button class="btn btn-outline-light btn-lg">Start ! its Free</button>
					<a href="login_page.jsp" class="btn btn-outline-light btn-lg">Login</a>
				
				</div>
				
			</div>
			
			<!-- Card Design -->
			<div class="container">
			
				<!-- Row 1 -->
				<div class="row mb-2">
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					
				</div>
			
				<!-- Row 1 -->
				<div class="row">
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					<!-- Column 1 -->
					<div class="col-md-4">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title">Java Programming Language</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
					</div>
					
					
				</div>
				
			</div>
			
			
		</div>
		
		<!-- JavaScript -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		
		
		
		
	</body>
</html>