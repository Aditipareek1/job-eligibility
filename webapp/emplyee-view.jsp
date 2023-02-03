<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Form</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="./resources/css/bootstrap.bundle.min.js"></script>
<style>
body {
	background-size:cover;
	margin-top: 3rem;
	margin-bottom: 2rem;
	margin-left: 8rem;
	margin-right: 8rem;
}

.col-sm-5 {
	
}

.col-sm-7 {
	
}

.card {
	background-color: rgba(255, 255, 255, 1);
	border-radius: 20px;
}

.form-container {
	margin-top: 10px;
	margin-bottom: 20px;
	margin-right: 40px;
	margin-left: 10px;
}

.btn {
	width: 100%;
}
h1{
	text-align:center;
	color: white;
	font-family: 'Times New Roman', serif;
	border-radius: 20px;
}
</style>
</head>
<body class="bg-primary">
	<div class="card">
	<h1 class= "bg-dark">Registration Form</h1>
		<div class="row">
			<div class="col-sm-5" style= "">
				<img src="./resources/img/try.jpg"
					style="width: 100%; height: 100%; border-radius:12px">
			</div>
			<div class="col-sm-7">
				<div class="form-container">

					<form method="post" action="employee-controller.jsp" name="myform" id="form">
						<label for="Name" class="form-label">Name </label> <input
							type="text" id="Name" class="form-control" name="name">
						<div class="row">
							<div class="col">
								<label class="form-label">Gender</label><br>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input" id="radio1"
										name="gender" value="Male" checked>Male <label
										class="form-check-label" for="radio1"></label>
								</div>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input" id="radio2"
										name="gender" value="Female">Female <label
										class="form-check-label" for="radio2"></label>
								</div>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input" id="radio3"
										name="gender" value="Others">Others <label
										class="form-check-label" for="radio3"></label>
								</div>
							</div>
							<div class="col">
								<label for="age" class="form-lable">Age</label> <input
									type="number" id="age" class="form-control" name="age">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="Phone" class="form-label">Phone Number</label> <input
									type="text" id="Phone" class="form-control" name="phone">

							</div>
							<div class="col">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="email" name="email">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="country">Country</label> <input type="text"
									id="country" class="form-control" name="country">
							</div>
							<div class="col">
								<label class="form-label">Highest Qualification</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="HSecondary"
										name="qual" value="HSecondary"> <label
										class="form-check-label" for="HSecondary">12th</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="bachelors"
										name="qual" value="bachelors"> <label
										class="form-check-label" for="bachelor">Bachelor</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="masters"
										name="qual" value="masters"> <label
										class="form-check-label" for="masters">Masters</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Work-place</label><br>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input" id="Onsite"
										name="workplace" value="Onsite" checked>On-site <label
										class="form-check-label" for="radio1"></label>
								</div>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input" id="remote"
										name="workplace" value="Remote">Remote <label
										class="form-check-label" for="radio2"></label>
								</div>
							</div>
							<div class="col">
								<label for="minsalary" class="form-label">Minimum
									Expected Salary </label> <input type="Number" id="minsalary"
									name="minsalary" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Job-Type</label><br>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input"
										id="Internship" name="jobtype" value="Internship" checked>Internship
									<label class="form-check-label" for="radio1"></label>
								</div>
								<div class="form-check form-check-inline">
									&nbsp;<input type="radio" class="form-check-input"
										id="Fulltime" name="jobtype" value="Full-Time">Full-Time
									<label class="form-check-label" for="radio2"></label>
								</div>
							</div>
							<div class="col">
								<label for="Exp" class="form-label">Experience (In
									Years) </label> <input type="Number" id="Exp" class="form-control"
									name="exp">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label class="form-label">Skills</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="fluency"
										name="skills" value="fluency"> <label
										class="form-check-label" for="fluency">Fluent
										Communication</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="MSOffice"
										name="skills" value="MSOffice"> <label
										class="form-check-label" for="MSOffice">MS Office</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="skills"
										id="emailwriting" value="emailwriting"> <label
										class="form-check-label" for="emailwriting">Email
										Writing</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="tom"
										name="skills" value="tom"> <label
										class="form-check-label" for="tom">Time Of Meeting</label>
								</div>
							</div>
							<div class="col">
								<label class="form-label">Technical Skills</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="frontend"
										name="technicalskills" value="frontend"> <label
										class="form-check-label" for="Frontend">Front-end
										Development</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="backend"
										name="technicalskills" value="backend"> <label
										class="form-check-label" for="Backend">Back-end
										Development</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="fullstack"
										name="technicalskills" value="fullstack"> <label
										class="form-check-label" for="fullstack">Full-Stack
										Development</label>
								</div>
							</div>
						</div>
						<br>
						<button type="submit" class="btn btn-dark" onclick="return validateform()">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
<%@include file="emplyee-view.js" %>

</script>
</html>