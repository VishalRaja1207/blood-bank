<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String fname = request.getParameter("fname");
	String mname = request.getParameter("mname");
	String mobile = request.getParameter("mobile");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String bloodgroup = request.getParameter("bloodgroup");
	String address = request.getParameter("address");
	
	try {
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement st = con.prepareStatement("insert into donor values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
		st.setString(1, id);
		st.setString(2, name);
		st.setString(3, fname);
		st.setString(4, mname);
		st.setString(5, mobile);
		st.setString(6, gender);
		st.setString(7, email);
		st.setString(8, bloodgroup);
		st.setString(9, address);
		st.executeUpdate();
		response.sendRedirect("addNewDonor.jsp?msg=valid");
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("addNewDonor.jsp?msg=invalid");
	}
	
%>