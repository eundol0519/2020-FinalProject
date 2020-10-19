<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트목록</title>
</head>
<body>
<table>
	<c:choose>
		<c:when test="${empty sessionScope.loginUser.userId}">
		    <tr><td><button onclick="LoginForm()">이벤트게임ㄱㄱ</button></td></tr>	
		</c:when>
		<c:otherwise>
			<tr><td><button id="eventGame">이벤트게임ㄱㄱ</button></td></tr>		
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="event" items="${eventList}">
		<tr><td><button onclick="location.href='eventView?eventNum=${event.eventNum}&eventHit=${event.eventHit}'">
		    ${event.eventNum}<img src="resources/썸네일 + 상세내용/${event.eventTitleImage}"></button></td></tr>
	</c:forEach>
</table>
<!-- 메인으로  -->
<button onclick="location.href='indexForm'">메인</button>
</body>
<script>
	//이벤트게임 팝업창으로
	var eventGame = document.getElementById("eventGame");
	var mywindow;
	var popupX = (window.screen.width / 2) - (750 / 2);
	   // &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
    var popupY= (window.screen.height /2) - (1000 / 2);
	   // &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	 eventGame.addEventListener("click", function(){
     	 mywindow = window.open("eventGame", "mywindow", "width=700, height=500, left=" + popupX + ", top=" + popupY);
   	});

	//로그인 폼
	function LoginForm(){
		var con = confirm("로그인 후 이용해주세요.");
		if(con==true){
			location.href='memberLoginForm';
		}
	}
		
</script>
</html>