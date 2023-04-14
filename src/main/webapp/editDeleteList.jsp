<%@page import = "Project.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<style>
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
%>

<%
	if("invalid".equals(msg)) {
%>		
		<center><font color="red" size="5">Something went wrong</font></center>	
<%
	}
%>

<%
	if("deleted".equals(msg)) {
%>		
		<center><font color="red" size="5">Successfully Deleted</font></center>	
<%
	}
%>

<br>
	<table class="styled-table" style="margin-left:20.5%; width: 79%">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Father Name</th>
				<th>Mother Name</th>
				<th>Gender</th>
				<th>Mobile</th>
				<th>Email</th>
				<th>Blood Group</th>
				<th>Address</th>
				<th>Edit</th>
				<th>Delete</th>			
			</tr>
		</thead>
		<tbody>
			<tr>
			<%
				try {	
					Connection con = ConnectionProvider.getConnection();
					Statement st = con.createStatement();
					ResultSet rst = st.executeQuery("select * from donor");
					while(rst.next()) { 
			%>
					
							<td><%= rst.getInt(1) %></td>
							<td><%= rst.getString(2) %></td>
							<td><%= rst.getString(3) %></td>
							<td><%= rst.getString(4) %></td>
							<td><%= rst.getString(5) %></td>
							<td><%= rst.getString(6) %></td>
							<td><%= rst.getString(7) %></td>
							<td><%= rst.getString(8) %></td>
							<td><%= rst.getString(9) %></td>
							<td><a href = "updateDonor.jsp?id=<%= rst.getString(1) %>" style="text-decoration:none;">Edit</a></td>
							<td><a href = "deleteDonor.jsp?id=<%= rst.getString(1) %>" style="text-decoration:none;">Delete</a></td>
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