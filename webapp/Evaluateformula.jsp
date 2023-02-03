<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="application/json" %>
<%@ page import="org.json.simple.JSONObject"%>

<%
String s = request.getParameter("val");
if (s == null || s.trim().equals("")) {
	out.print("Please enter name");
} else {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobeligibility", "root", "root");
		PreparedStatement ps = con.prepareStatement("select formula from jobtype where JobType=?");
		ps.setString(1, s);
		ResultSet rs = ps.executeQuery();
		String formula = rs.getString("formula");
		JSONObject json = new JSONObject();
		json.put("formula",formula);
		System.out.println(formula);
	
	con.close();
		}
	 catch (Exception e) {
		e.printStackTrace();
	}
}
%>