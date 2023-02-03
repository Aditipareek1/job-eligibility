<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="./resources/css/bootstrap.min.js"></script>
<style>
	body{
		background-color: black;
		margin-top : 2rem;
		margin-bottom: 2rem;
	}
	.container{
		background-image: url('./resources/img/laptop1.jpg');
		background-repeat :no-repeat;
	}
	h1{
		color: white;
		text-align: center;
		font-family: Verdana, sans-serif;
		text-shadow:0 0 30px rgba(0,0,0,1);	
	}
	h4{
		
		text-align: center;
		font-family: Verdana, sans-serif;
		text-shadow:0 0 30px rgba(0,0,0,1);
	}
	.card{
		margin: 60px;
		background-color: rgba(0,0,0,0.5);
		width: 25vw;
		height: 50vh;
		margin-left: 29rem;
		margin-top: 5rem;
	}
	.cardin{
		margin: 30px;
	}
	.btn{
		width:100%;
	}
	
</style>
</head>
<body>
<div class="container">
<br><br><br>
<div class="card">
	<div class="cardin">
		<h4 class="text-warning">Login here</h4><br>
		<form method="post" action="loginverify.jsp" name="myform" id="form">
			<label for="username" class="form-label text-light">Username</label>
			<input type="text" class="form-control" id="username" name="username" placeholder="username">
			<label for="password" class="form-label text-light">Password</label>
			<input type="password" class="form-control" id="password" name="password" placeholder="password"><br><br>
			<button type="submit" class="btn btn-warning">Login</button>
		</form>
	</div>
</div>
<h6 style="text-align:center; color:white">no copyright</h6><br><br>
</div>
</body>
</html>