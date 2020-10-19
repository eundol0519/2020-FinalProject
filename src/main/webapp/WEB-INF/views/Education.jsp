<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>호텔<a href=""></a></li>
	<li>병원<a href=""></a></li>
	<li>미용<a href=""></a></li>
	<li>용품<a href=""></a></li>
	<li>리뷰<a href=""></a></li>
	<li>이벤트<a href=""></a></li>
	<li>개요<a href=""></a></li>
</ul>
<table>
	<c:forEach var="education" items="${educationList}">
	<tr>
		<td>
		<img src="resources/educationFile/${education.eduImage}" width="400px" height="250px"/><br><button onclick="location.href='educationView?eduNum=${education.eduNum}'">${education.eduTitle}</button>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>