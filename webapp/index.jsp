<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<style>
	.col-lg-6{
		background-image:url('./resources/img/welcome.jpg');
		background-size:cover;
	}
	.card{
		margin-left: 230px;
		margin-right: 230px;
		margin-top:4rem ;
		border-radius: 16px;
	}
	.col-lg-4{
		font-family: 'Andale Mono', monospace;
		font-weight: 900;
	}
	.col{
		font-family: 'Andale Mono', monospace;
		font-weight: 900;
	}
	.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}
@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}
h1{
	font-size:45pt; font-weight:900;font-family: 'Times New Roman', serif; color:#1b2e35;
}
h2{
	color:#C46458;
}

</style>
</head>
<body class="bg-primary">
<div class="slideshow-container" style="margin-top: 2 rem;">
	<div class="mySlides">
		<div class="card">
		<div class="row">
			<div class="col-lg-1">
			</div>
			<div class="col-lg-4 text-primary">
			<br><br><br><h1>WELCOME</h1><br><h2 style="color:#C08B01;"><small>to</small> <br><strong>Job-Eligibility-Check</strong></h2><br><h4>Check if a candidate is eligible for a job or not in an instance</h4><h5>Happy to make your selection process one click simple :)</h5><div class="btn btn-warning">Swipe to learn more about it</div><br><br><br>
			</div>
			<div class="col-lg-6">
			<p></p>
			</div>
			<div class="col-lg-1">
			</div>
		</div>
		</div>
	</div>
	<div class="mySlides">
		<div class="card" style="background-image:url('./resources/img/registration2.jpg');background-size:cover;">
			<br><br><h1 class="d-flex justify-content-center">REGISTRATION</h1>
			<div class="row">
			<div class="col">
			<p></p>
			</div>
			<div class="col">
			<div class="row">
			<div class="col-lg-11">
				<br><br><h2><strong>Fill out all the details of the candidate</strong></h2><br><h4>Don't worry the details are only required for comparison and will not be shared with anyone</h4>
				<br><div class="d-flex justify-content-center w-80 h-25">
					<button type="button" class="btn btn-danger" onclick="formopen()">Click to fill the details</button><br><br>
				</div><br>
				<div class="d-flex justify-content-end">
					<br><h6>Or Swipe -></h6>
				</div>
			</div>
			<div class="col-lg-1">
			</div>
			</div>
			<br><br><br>
			</div>
		</div>
		</div>
	</div>
	<div class="mySlides">
		<div class="card" style="background-color:#F4F8FF;">
		<div class="row">
			<div class="col-lg-7" >
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-11">
						<br><h1><small><small>How to Check Eligibility?</small></small></h1>
						<br>
						<img src="./resources/img/paint.jpg" width=590>
						<br><br>
					</div>
				</div>
			</div>
			<div class="col-lg-4" >
					<img src ="./resources/img/jobeligimg.jpg" width=400>
					<br><br><br>
					<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-dark" onclick="eligopen()">Click to Check Eligibility</button><br><br>
				</div><br>
			</div>
			<div class="col-lg-1" >
			</div>
		</div>
		</div>
	</div>
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>
</body>
<script type="text/javascript">
<%@include file="index.js" %>

</script>
</html>