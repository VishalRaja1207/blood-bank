<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}
</style>
</head>
<body>
<div class="header" style="background-color:#1e1e2d;padding-bottom: 0px;">
  <a href="#default" class="logo">BBS</a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>
<body>
<div class="container">
<br>
	<br>

	<%	
		String msg = request.getParameter("msg");
		if("invalid".equals(msg)) { 
	%>	
		<center><font color="red" size="5">Invalid username or password</font></center>
	<% } %>	

	
	
<form action = "adminLoginAction.jsp" method="post">
	<div class = "form-group">
		<center><h2>Username</h2></center>
		<input type="text" placeholder="Enter username" name = "uname">
		<br><br>
		<center><h2>Password</h2></center>
		<input type="password" placeholder="Enter password" name = "pass">
		<br><br>
		<center><button type="submit" class = "button" style="background-color: #1e1e2d; border-radius: 50px">Submit</button></center>
	</div>
	
</form>
	
	
</div>
<br>
<br>
<br>
<br>
<h3><center> 2023 © Influence - Designed by Vishal </center></h3>
</body>
</html>
