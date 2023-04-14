<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
</style>
</head>
<body>

<div class="header" style="background-color:#1e1e2d;padding-bottom: 0px;">
  <a href="#default" class="logo">BBS</a>
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<div style="max-width:100%">
  <img class="mySlides"  src="slide.jpg" >
  <img class="mySlides"  src="slide2.png" >
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


<body>
  <br>  
  	
 	<%
  		String res = request.getParameter("msg");
  		if("valid".equals(res)) { 
  	%>
  		<center><font color="red" size="5">Form Submitted Successfully, you will be notified within 24 hrs</font></center>		
  		
  	<%	}  %>
  		
  	<% 
  		if("invalid".equals(res)) {
  	%>
  		<center><font color="red" size="5">Invalid data</font></center>	
  	
  	<% } %> 
 
  		
 	<center>Enter your details for blood donation</center> 
 	<br>	
 	<form action = "indexFormAction.jsp" method="post">
 		<input type = "text" name = "dname" placeholder="Enter your name" required/>
 		<input type = "text" name = "pno" placeholder="Enter your number" required/>
 		<input type = "mail" name = "email" placeholder="Enter your mail id" required/>
 		<input type = "text" name = "blood" placeholder="Enter your blood type" required/>
 		<button class = "button1" style="background-color: #1e1e2d"><span>Submit</span></button>
  	</form>
 

  <br>
  <br>
  </div>
</div>
<h3><center>2023 © Influence - Designed by Vishal</center></h3>

</body>
</html>

