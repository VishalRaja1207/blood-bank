<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>

<%
	String id = request.getParameter("id");
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rst = st.executeQuery("select * from donor where id = '"+ id +"'");
	while(rst.next()) {
%>

	<div class="container"  style="margin-left: 6%">
		<form action="updateDonorAction.jsp" method="post">
			<input type = "hidden" name="id" value = "<% out.println(id); %>">
			<h2>Name</h2>
			<input type = "text" placeholder = "Enter name" value = <%= rst.getString(2) %> name = "name" >
			<br><br>
			<h2>Father</h2>
			<input type = "text" placeholder = "Enter father name" value = <%= rst.getString(3) %> name = "fname" >
			<br><br>
			<h2>Mother</h2>
			<input type = "text" placeholder = "Enter mother name" value = <%= rst.getString(4) %> name = "mname" >
			<br><br>
			<h2>Mobile</h2>
			<input type = "number" placeholder = "Enter mobile number" value = <%= rst.getString(5) %> name = "mobile" >
			<br><br>
			<h2>Email</h2>
			<input type = "email" placeholder = "Enter your mail" value = <%= rst.getString(7) %> name = "email" >
			<br><br>
			<h2>Address</h2>
			<input type = "text" placeholder = "Enter your address" value = <%= rst.getString(9) %> name = "address" >
			<br><br>
			<center>
				<button class = "button"><span>Save</span></button>
			</center>
		</form>
	</div>

<% } %>

<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Days :: 2020  </center></h3>

</body>
</html>