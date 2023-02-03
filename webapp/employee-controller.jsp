<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="emp" class="com.jobeligibility.org.model.Employee"/>
	<jsp:useBean id="empRepo" class="com.jobeligibility.org.repository.EmployeeRepository"/>
	
	<%
		try{
			emp.setName(request.getParameter("name"));
			emp.setGender(request.getParameter("gender"));
			emp.setAge(Integer.parseInt(request.getParameter("age")));
			emp.setPhone(request.getParameter("phone"));
			emp.setEmail(request.getParameter("email"));
			emp.setCountry(request.getParameter("country"));
			emp.setQualification(request.getParameter("qual"));
			emp.setWorkplace(request.getParameter("workplace"));
			emp.setMinsalary(Integer.parseInt(request.getParameter("minsalary")));
			emp.setJobtype(request.getParameter("jobtype"));
			emp.setExperience(Integer.parseInt(request.getParameter("exp")));
			String[] skills = request.getParameterValues("skills");
			String finalstring = String.join(";",skills);
			emp.setSkills(finalstring);
			String[] technicalskills = request.getParameterValues("technicalskills");
			String finalstring1 = String.join(";",technicalskills);
			emp.setTechnicalskills(finalstring1);
			empRepo.saveEmployee(emp);
			String redirectURL="emplyee-view.jsp";
			response.sendRedirect(redirectURL);
			
		}
	catch(Exception ex){
		System.out.println(ex);
	}
	//response.sendRedirect("./emplyee-view.jsp");
	
	%>
</body>
</html>
