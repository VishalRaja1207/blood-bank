<%
	String name = request.getParameter("uname");
	String pass = request.getParameter("pass");
	if(name.equals("vishal") && pass.equals("12345678")) {
		response.sendRedirect("addNewDonor.jsp");
	}
	else {
		response.sendRedirect("adminLogin.jsp?msg=invalid");
	}
%>