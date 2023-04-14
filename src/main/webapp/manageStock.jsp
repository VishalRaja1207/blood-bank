<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
body{
  background-color: #ffffff;
}

input[type="text"], input[type="password"], input[type="submit"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:50%;	
	border-radius: 25px;
}

	.styled-table {
	    border-collapse: collapse;
	    margin: 25px 0;
	    font-size: 0.9em;
	    font-family: sans-serif;
	    min-width: 400px;
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	}
	
	.styled-table thead tr {
	    background-color:#303050;
	    color: #ffffff;
	    text-align: left;
	}
	
	.styled-table th, .styled-table td {
    	padding: 12px 15px;
	}
	
	.styled-table tbody tr {
    	border-bottom: 1px solid #dddddd;
	}

	.styled-table tbody tr:nth-of-type(even) {
    	background-color: #f3f3f3;
	}

	.styled-table tbody tr:last-of-type {
    	border-bottom: 2px solid #303050;
	}
	
	.styled-table tbody tr.active-row {
    	font-weight: bold;
    	color: #009879;
	}
	
	.form-group {
		display: flex;
		margin-left: 6%; 
		margin-right: 6%; 
	}
	
	.form-select {
		width: 100%;
	}
	
	
</style>
</head>
<body>

<% 
	String msg = request.getParameter("msg");
	if("valid".equals(msg)) {	
%>
		<center><font color="red" size="5">Successfully Updated</font></center>	
<%
	}
	if("invalid".equals(msg)) {
%>		
		<center><font color="red" size="5">Something went wrong</font></center>	
<%
	}
%>
	<br>
	<form action = "manageStockAction.jsp" style="margin-left:10%">
		<div class = "form-group">
			<div class = "form-select">
				<h4 style="padding-left: 41%;">Select blood group</h4><br>
				<select name="bloodgroup">
					<option value = "A+">A+</option>
					<option value = "A-">A-</option>
					<option value = "B+">B+</option>
					<option value = "B-">B-</option>
					<option value = "O+">O+</option>
					<option value = "O-">O-</option>
					<option value = "AB+">AB+</option>
					<option value = "AB-">AB-</option>
				</select>
			</div>
			<br><br>
			
			<div class = "form-select">
				<h4 style="padding-left: 36%;">Select Increase/Decrease</h4><br>
				<select name="incdec">
					<option value = "inc">Increase</option>
					<option value = "dec">Decrease</option>
				</select>
			</div>
			<br><br>
				
			<div class = "form-select">
				<h4 style="padding-left: 53%;">Units</h4><br>
				<input type = "text" placeholder = "Enter units of blood" name = "units" >
			</div>		
			<br>
		</div>
		<br>
		<button type="submit" class = "button" style="margin-left:48%; margin-right:48%; background-color: #1e1e2d; border-radius: 50px">Save</button>
	</form>
	<br>
		<table class = "styled-table"  style="margin-left:43%;">
			<thead>
				<tr>
					<th>Blood Group</th>
					<th>units</th>
				</tr>
			</thead>
			
			<tbody>
			<tr>
				<%
					try {	
						Connection con = ConnectionProvider.getConnection();
						Statement st = con.createStatement();
						ResultSet rst = st.executeQuery("select * from stock");
						while(rst.next()) { 
				%>
					
							<td><%= rst.getString(1) %></td>
							<td><%= rst.getString(2) %></td>
				</tr>	
			</tbody>		
			<%
					}
				}
				catch(Exception e) {
					System.out.println(e);
				}
			%>
		</table>
<br>
<br>
<br>
<br>
<p><center style="padding-left: 150px">2023 © Influence - Designed by Vishal</center></p>
</body>
</html>