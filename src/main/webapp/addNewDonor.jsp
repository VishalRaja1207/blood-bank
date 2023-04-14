<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
body {
  background-color:  #ffffff;
}
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
h2
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
  		String res = request.getParameter("msg");
  		if("valid".equals(res)) { 
  	%>
  		<center><font color="red" size="5">Successfully Submitted</font></center>		
  		
  	<%	}  %>
  		
  	<% 
  		if("invalid".equals(res)) {
  	%>
  		<center><font color="red" size="5">Invalid data</font></center>	
  	
  	<% } %> 

	<%
		int id = 1;
		try {
			Connection con = ConnectionProvider.getConnection();
			Statement st = con.createStatement();
			ResultSet rst = st.executeQuery("select max(id) from donor");
			if(rst.next()) {
				id = rst.getInt(1);
				id = id + 1;
			}
	%>
	<div class="container">
		<%= id %>
		<h1 style="color: black; margin-left: 25%">Donor id : <% out.println(id); %></h1>
	</div>
	<%
		}
		catch (Exception e) {
			System.out.println(e);
		}
	%>
	
	<br><br>
	<div class="container"  style="margin-left: 6%">
		<form action="addNewDonorAction.jsp" method="post">
			<input type = "hidden" name="id" value = "<% out.println(id); %>">
			<h2>Name</h2>
			<input type = "text" placeholder = "Enter name" name = "name" >
			<br><br>
			<h2>Father</h2>
			<input type = "text" placeholder = "Enter father name" name = "fname" >
			<br><br>
			<h2>Mother</h2>
			<input type = "text" placeholder = "Enter mother name" name = "mname" >
			<br><br>
			<h2>Mobile</h2>
			<input type = "number" placeholder = "Enter mobile number" name = "mobile" >
			<br><br>
			<h2>Gender</h2>
			<select name="gender">
				<option value="Male">Male</option>
				<option value="Male">Female</option>
				<option value="Male">Others</option>
			</select>
			<br><br>
			<h2>Email</h2>
			<input type = "email" placeholder = "Enter your mail" name = "email" >
			<br><br>
			<h2>Blood Group</h2>
			<select name="bloodgroup">
				<option value="A+">A+</option>
				<option value="A-">A-</option>
				<option value="B+">B+</option>
				<option value="B-">B-</option>
				<option value="O+">O+</option>
				<option value="O-">O-</option>
				<option value="AB+">AB+</option>
				<option value="AB-">AB-</option>
			</select>
			<br><br>
			<h2>Address</h2>
			<input type = "text" placeholder = "Enter your address" name = "address" >
			<br><br>
			<center>
				<button class = "button" style="background-color: #1e1e2d; border-radius: 50px"><span>Save</span></button>
			</center>
		</form>
	</div>
	
	
<br>
<br>
<br>
<br>

<p><center style="padding-left: 100px">2023 © Influence - Designed by Vishal</center></p>

</body>
</html>