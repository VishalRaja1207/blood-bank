<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	
	String name = request.getParameter("dname");
	String pno = request.getParameter("pno");
	String mail = request.getParameter("email");
	String blood = request.getParameter("blood");
	String status = "pending";
	try{
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement("insert into blooddonor values(?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, pno);
		ps.setString(3, mail);
		ps.setString(4, blood);
		ps.setString(5, status);
		int i = ps.executeUpdate();
		response.sendRedirect("index.jsp?msg=valid");
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("index.jsp?msg=invalid");
	}
	
%>