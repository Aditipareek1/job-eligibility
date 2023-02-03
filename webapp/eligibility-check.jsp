<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<style>
.card {
	margin-top: 3rem;
	margin-left: 12vw;
	margin-right: 12vw;
	margin-bottom: 2rem;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.8);
	background-color: rgba(255, 255, 255, 1);
	border-radius: 20px;
}

.card2 {
	margin: 3 rem;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: lightgrey
}

#table2 tbody tr:nth-of-type(odd) {
	background-color: white;
}

div.sticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	text-align: center;
}
.eligiblemage{
	background-image:url('./resources/img/yes.jpg');
	width:6.5 rem;
    background-position: center;
    border-radius:15px 80px 80px 15px;
} 
.NotEligibleImage{
	background-image:url('./resources/img/no.jpg');
	width:6.5 rem;
    background-position: center;
    border-radius:80px 15px 15px 80px;;
}
#eligibleimg{
	width:6.5 rem;
    background-position: center;
}
h2{
	font-size:30pt; 
	font-weight:900;
	font-family: 'Times New Roman', serif; 
	color:#1b2e35;
	border-radius: 20px;
	text-align: center;
}
.table{
		border-radius: 12px;
}
label{
	font-family: 'Times New Roman', serif; 
	font-weight: 900;
}
td{
	font-family: 'Times New Roman', serif; 
	font-weight: 900;
}
</style>
</head>
<!--  <body style="background-image: url('./resources/img/AdobeStock_330412807.jpeg'); background-size: cover; background-repeat: no-repeat;">   -->
<body class="bg-primary">
	<form name="vform">
		<div class="card">
			<div class="sticky">
				<h2 class="bg-dark text-light">
					Eligibility Check<br>
				</h2>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 border">
						<div class="card2">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-8">
										<label>Job
											Type</label><br>
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle"
												type="button" data-bs-toggle="dropdown" id="jobpost"
												aria-expanded="false">&emsp;&emsp;&emsp;&emsp;Job
												Type&emsp;&emsp;&emsp;&emsp;</button>
											<input id="selected_jobpost" name="jobpost" type="hidden">
											<ul class="dropdown-menu">
												<li><a class="dropdown-item"
													onclick="selectJobpost(this);sendJobtype();" href="#"
													id="Software Developer">SoftwareDeveloper</a></li>
												<li><a class="dropdown-item" href="#"
													onclick="selectJobpost(this);sendJobtype();"
													id="Project Manager">ProjectManager</a></li>
												<li><a class="dropdown-item" href="#"
													onclick="selectJobpost(this);sendJobtype();"
													id="Human Resource">HumanResource</a></li>
											</ul>
										</div>
										<br>
										<label for="Name" class="form-label">Name </label> <input
											type="text" id="Name" class="form-control" name="name"
											onkeyup="sendInfo();"><br><label
											for="El-Formula" class="form-label">Eligibility
											Formula </label> <input type="text" id="ElFormula" name="ElFormula"
											class="form-control"> <br>
										
									</div>

									<div class="col-lg-4">

										<label class="form-label"><b>Eligibility</b></label>
										&nbsp;&nbsp;&nbsp;
										<div id= normalimg><img src="./resources/img/yes-no-signs_1325-370.jpg"
											class="img-fluid" style="width: 7.4rem"></div>
										<p id= eligibleimg></p>
											<br> 
											<button type="button" class="btn text-light bg-warning h-25 w-100" onclick="formulaevaluate(event);"
											style="background-color: #043050"><h4>Check Eligibility</h4></button>
									</div>
								</div>
							</div>
							<hr>
							<table class="table table-striped" id="table">
								
							</table>
						</div>
					</div>
					<div class="col-lg-4 border">
						<br>
						<div class="card3"><h2><small>Information</small></h2></div>
						<br>
						<table class="table table-borderless" id="table2">
							<tbody>
								<tr>
									<td>Name</td>
									<td><span id="nameinfo"></span></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td><span id="genderinfo"></span></td>
								</tr>
								<tr>
									<td>Age</td>
									<td><span id="ageinfo"></span></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><span id="emailinfo"></span></td>
								</tr>
								<tr>
									<td>Country</td>
									<td><span id="countryinfo"></span></td>
								</tr>
								<tr>
									<td>Qualification</td>
									<td><span id="qualinfo"></span></td>
								</tr>
								<tr>
									<td>Desired WorkPlace</td>
									<td><span id="workplaceinfo"></span></td>
								</tr>
								<tr>
									<td>Desired Salary</td>
									<td><span id="salinfo"></span></td>
								</tr>
								<tr>
									<td>Experience</td>
									<td><span id="expinfo"></span></td>
								</tr>
								<tr>
									<td>Skills</td>
									<td><span id="skillinfo"></span></td>
								</tr>
								<tr>
									<td>Technical Skills</td>
									<td><span id="techskillinfo"></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
<%@include file="eligibility-check.js" %>

</script>
</html>