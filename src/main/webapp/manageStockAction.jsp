<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<% 
	String bloodgroup = request.getParameter("bloodgroup");
	String incdec = request.getParameter("incdec");
	int units_up = Integer.parseInt(request.getParameter("units"));
	
	if("dec".equals(incdec)) { 
		units_up = -units_up;
	}
	
	try {
		Connection con = ConnectionProvider.getConnection();
		Statement st = con.createStatement();
		st.executeUpdate("update stock set units=units+'"+units_up+"' where bloodgroup='"+bloodgroup+"'");
		response.sendRedirect("manageStock.jsp?msg=valid");
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("manageStock.jsp?msg=valid");
	}
%>