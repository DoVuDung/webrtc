<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CustomizeInterestHomePage</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideDown("FAST");
  });
  $("#flip1").click(function(){
	    $("#panel1").slideToggle("FAST");
	  });
  $("#flip2").click(function(){
	    $("#panel2").slideToggle("FAST");
	  });
});
$(document).ready(function(){
	$("#frmflip").click(function(){
		  $("#frmpanel").slideToggle("FAST");
	});
	});
</script>

<style type="text/css"> 



#panel,#flip,#panel1,#panel2,#flip1,#flip2
{
width:150px;
padding:16px;
text-align:center;color:#330000;
background-color:#1E90FF;
border:solid 1px #c3c3c3;

}
#panel,#panel1,#panel2
{
width:700px;
background-color:#CCEEFF;
padding:25px;
display:none;
}
marquee {

height:10px;
padding:5px;
background-color:#1E90FF;
}

</style>
   	       
</head>
<body>

<form:form action="savecustomizeinterest.html" method="POST">

<h2><img src="resources/image/Untitled.png" height="50" width="150" title="CustomizeInterest"><font color=#6599FF>  INTERESTS </font></h2>
 <marquee behavior="ALTERNATE" direction="RIGHT"   ><FONT COLOR=blue>SELECT YOUR INTEREST</FONT></marquee>
 
   <table  border="0" >

<tr>
<td>
<%-- <form:hidden path="sipuri" /> --%>
<script>
</script>
			<tr>
				<th id="flip">ACCESSORIES</th>
				<c:forEach items="${advertiseinterests}" var="advertiseinterest">
					<c:set var="accessorieslist"
						value="${fn:split(advertiseinterest.accessories, ',')}" />
					<td>

						<div id="panel">
							<c:forEach var="accessories" items="${accessorieslist}">
								<form:checkbox path="accessories" value="${accessories}" />
								<c:out value="${accessories}" />
								<img src="AdvertiseImages/${accessories}.png" width=120
									height=75 />
							</c:forEach>
						</div>

					</td>
				</c:forEach>
			</tr>

			<tr>
				<th id="flip1">AUTOMOBILE</th>
				<c:forEach items="${advertiseinterests}" var="advertiseinterest">
					<c:set var="automobilelist"
						value="${fn:split(advertiseinterest.automobile, ',')}" />
					<td>

						<div id="panel1">
							<c:forEach var="automobile" items="${automobilelist}">
								<form:checkbox path="automobile" value="${automobile}" />
								<c:out value="${automobile}" />
								<img src="AdvertiseImages/${automobile}.png" width=120 height=75 />
							</c:forEach>
						</div>
					</td>
				</c:forEach>
			</tr>


			<tr>
				<th id="flip2">FOOD AND ENTERTAINMENT</th>
				<c:forEach items="${advertiseinterests}" var="advertiseinterest">
					<c:set var="foodlist"
						value="${fn:split(advertiseinterest.food, ',')}" />
					<td>

						<div id="panel2">
							<c:forEach var="food" items="${foodlist}">
								<form:checkbox path="food" value="${food}" />
								<c:out value="${food}" />
								<img src="AdvertiseImages/${food}.png" width=120 height=75 />
							</c:forEach>
						</div>

					</td>
				</c:forEach>
			</tr>


			<tr><td><input TYPE="reset" VALUE ="RESET"/><input type="submit" value="SUBMIT" /></td></tr>	
		</table>
 	
   </form:form>



</body>
</html>