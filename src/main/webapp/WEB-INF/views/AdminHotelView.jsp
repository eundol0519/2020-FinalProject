<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세 보기</title>
<style>
	.adminImage{
		width : 500px;
		height : 300px;
	}
</style>
</head>
<body>
<table>
	<tr>
		<th>방 크기</th>
		<td>${hotelView.hotelSize }</td>
	</tr>
	<tr>
		<th>호텔 방 코드</th>
		<td>${hotelView.hotelCode }</td>
	</tr>
	<tr>
		<th>호텔 방 이름</th>
		<td>${hotelView.hotelRoomName }</td>
	</tr>
	<tr>
		<th>호텔 방 가격</th>
		<td>${hotelView.hotelPrice }</td>
	</tr>
	<tr>
		<th>최대 수용 가능한 마리 수</th>
		<td>${hotelView.hotelMaxAnimal }</td>
	</tr>
	<tr>
		<th>방 상세 정보</th>
		<td>${hotelView.hotelContents }</td>
	</tr>
	<tr>
		<th>방 사진</th>
		<td><c:if test="${hotelView.hotelRoomImage1 ne null}"><img src="resources/hotelFile/${hotelView.hotelRoomImage1 }" alt="호텔 방 사진" class="adminImage"/></c:if>
			<c:if test="${hotelView.hotelRoomImage2 ne null}"><img src="resources/hotelFile/${hotelView.hotelRoomImage2 }" alt="호텔 방 사진" class="adminImage"/></c:if>
			<c:if test="${hotelView.hotelRoomImage3 ne null}"><img src="resources/hotelFile/${hotelView.hotelRoomImage3 }" alt="호텔 방 사진" class="adminImage"/></c:if>
			<c:if test="${hotelView.hotelRoomImage4 ne null}"><img src="resources/hotelFile/${hotelView.hotelRoomImage4 }" alt="호텔 방 사진" class="adminImage"/></c:if>
			<c:if test="${hotelView.hotelRoomImage5 ne null}"><img src="resources/hotelFile/${hotelView.hotelRoomImage5 }" alt="호텔 방 사진" class="adminImage"/></c:if></td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="location.href='hotelBoardModify?hotelCode=${hotelView.hotelCode}'">수정</button>
						<button onclick="location.href='hotelBoardDelete?hotelCode=${hotelView.hotelCode}'">삭제</button></td>
	</tr>
</table>
</body>
</html>