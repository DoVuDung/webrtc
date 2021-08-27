<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
advertisment : <c:out value="${interestPlay}" />
<embed id="vid1" src="<c:url value="AdvertiseVideo/${interestPlay}.mp4"/>" width="700" height="450" ></embed>
</body>
</html>