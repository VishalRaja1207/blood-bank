<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
	String status_up = "Completed";
	String mobile = request.getParameter("mobile");
	try {	
		Connection con = ConnectionProvider.getConnection();
		Statement st = con.createStatement();
		st.executeUpdate("update blooddonor set status = '"+status_up+"' where phone = '"+mobile+"'"); 
		response.sendRedirect("requestForBlood.jsp");
	}
	catch(Exception e) {
		response.sendRedirect("requestForBlood.jsp");
	}
%>
