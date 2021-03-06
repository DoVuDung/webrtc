<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function validate()
{
	var a=user();
	var b=pass();
	return a && b;
	
	}
function user()
{
	var name=document.getElementById("userName").value;
	
	if (name==null || name=="")
	{
		document.getElementById("user-error").innerHTML="Please enter user name";
		return false;
	}
	
	else
	{
		document.getElementById("user-error").innerHTML="";
		return true;
	}
}

function pass()
{
	var name=document.getElementById("password").value;
	
	if (name==null || name=="")
	{
		document.getElementById("pass-error").innerHTML="Please enter password";
		return false;
	}
	
	else
	{
		document.getElementById("pass-error").innerHTML="";
		return true;
	}
}
 function clear(){

	document.getElementById("userName").value="";
    document.getElementById("password").value="";
    document.getElementById("errordiv").innerHTML="";
    document.getElementById("user-error").value="";
    document.getElementById("pass-error").value="";
} 

</script>
<script language="javascript">
	document.onmousedown=disableclick;
	status="Right Click Disabled";
	function disableclick(event)
	{
  		if(event.button==2)
  		 {
     		alert(status);
     		return false;    
  		 }
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="login.css">
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
            $(document).ready(function() {
            	$("#userName").focus();
                $('#login-form').submit(function() {
                    $('#progress').show();
                });
            });
     </script>
     <style>
            #progress { 
                display: none;
                color: green; 
            }
     </style> 

</head>
<body onload=" noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<!-- <body style="background-image:/DhirendraNath/WebContent/images/Background-5.jpg "> -->
<div style="padding-bottom: 100px"></div>
	<!-- TOP BAR -->
	<div id="top-bar">		
		
	</div> <!-- end top-bar -->
	
	<div class="header">
			<a href="Registration.jsp">Register</a>
		    <p>Unified Communicator</p>
	</div> 
	
	<!-- MAIN CONTENT -->
	<div id="progress"><h1>Please wait while we redirect you to the home page...</h1></div>
	<div class="content">
	<div id="pic-div" class="pic-class"><b>Login Page</b></div>
		<form action="LoginController" method="post" id="login-form">	
		 <input type="hidden" name="action" value="login"> 
		
		 <div id="login-content" class="login-class">
			<table>
			<tr>
					<td><label class="user-class">Username</label></td>
					<td><input type="text" name="userName" id="userName" placeholder="eg- name@tcs.com"/></td>
					<td><span class="red-field" id="user-error"></span></td>					
			</tr>	
				<tr>
				
					<td><label class="pass-class">Password</label></td>
					<td><input type="password" name="password" id="password"/></td>
					<td><span class="red-field" id="pass-error"></span></td>	
			</tr>	
					
			<tr>
				<td><input type="submit" name="submit" value="Login as User" class="reset-button" onclick="return validate();"></td>
				
			</tr>	
			</table>
			<br/>
			
			</div>
		</form>
		
	</div> <!-- end content -->
	<div id="errordiv" style="color: red; font-size: 14px; margin-left: 35%;"><%if(request.getAttribute("error")!=null) {%><%=request.getAttribute("error").toString()%><%} %></div>
	<%if(request.getAttribute("message")!=null && request.getAttribute("message").toString()!=""){%>
		<label id="message" style="color: green; font-size: 14px; margin-left: 35%;" class="message-class"><%=request.getAttribute("message")%></label>
	<%} %>
	
	<div style="padding-bottom: 80px"></div>	
	
	<!-- FOOTER -->
	<div id="footer" class="footer-div">

		<p>For academic use only</label></p>		
	
	</div> <!-- end footer -->

</body>
</html>