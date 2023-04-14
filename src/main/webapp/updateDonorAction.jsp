<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String fname = request.getParameter("fname");
	String mname = request.getParameter("mname");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	try {
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement st = con.prepareStatement("update donor set name=?, father=?, mother=?, mobile=?, email=?, address=? where id=?");
		st.setString(1, name);
		st.setString(2, fname);
		st.setString(3, mname);
		st.setString(4, mobile);
		st.setString(5, email);
		st.setString(6, address);
		st.setString(7, id);
		st.executeUpdate();
		response.sendRedirect("editDeleteList.jsp?msg=valid");
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("editDeleteList.jsp?msg=invalid");
	}
%>