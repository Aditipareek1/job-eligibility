<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="application/json" %>
<%@ page import="org.json.simple.JSONObject"%>

<%
String jobtype = request.getParameter("val2");
System.out.println("test " + jobtype);
if (jobtype == null) {
	out.print("<p>Please select job type!</p>");
} else {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobeligibility", "root", "root");
		PreparedStatement p = con.prepareStatement("Select id,formula from jobtype where JobType = ?");
		p.setString(1, jobtype);
		ResultSet r = p.executeQuery();
		r.next();
		int id = r.getInt("id");
		String formula = r.getString("formula");
		JSONObject json = new JSONObject();
		json.put("formula",formula);
		//out.print(id);

		PreparedStatement ps = con.prepareStatement("select sno,field,Operator,Value from eligibilityconditions where id =?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		System.out.println(id);
		String table= "";
		if (!rs.isBeforeFirst()) {
			out.println("<p>No Record Found!</p>");
		} else {
			table+=("<tr><th>SrNo</th><th>Field</th><th>Operator</th><th>Value</th></tr>");
			while (rs.next()) {
				table+=("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
						+ "</td><td>" + rs.getString(4) + "</td></tr>");
			}
			json.put("table",table);
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
}
%>