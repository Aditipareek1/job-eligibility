<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobeligibility", "root", "root");
		PreparedStatement ps = con.prepareStatement("select username, password from userlogin");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
		if(username == rs.getString(1) && password == rs.getString(2)){
			//System.out.println(username + "*****" + password);
			response.sendRedirect("emplyee-view.jsp");
		}
	}
	con.close();
		}
	 catch (Exception e) {
		e.printStackTrace();
	}
%>