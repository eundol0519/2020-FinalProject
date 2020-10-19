<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>
</head>
<body>
<table>
	<tr>
		<th>이벤트 썸네일</th>
		<td><img src="resources/eventFile/${eventView.eventTitleImage }" alt="이벤트 썸네일"/></td>
	</tr>
	<tr>
		<th>이벤트 사진</th>
		<td><img src="resources/evnetFile/${eventView.eventImage }" alt="이벤트 사진"/></td>
	</tr>
	<tr>
		<th>이벤트 내용</th>
		<td>${eventView.eventContents}</td>
	</tr>
	<tr>
		<th>이벤트 쿠폰</th>
		<td>
		
			<fieldset>
				<legend style="text-align:center;">쿠폰 정보</legend>
					<c:if test="${not empty couponView }">
						<label><h2>${couponView.couponName}</h2></label>
						<label>${couponView.couponCode}</label><br/>
						<label>${couponView.couponDate }</label><br/>
						<label>${couponView.couponSale }</label>
					</c:if>
					<c:if test="${empty couponView }">
						<h2 style="text-align:center;">만료된 쿠폰입니다.</h2>
					</c:if>
			</fieldset>
		
		</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="location.href='eventBoardModify?eventNum=${eventView.eventNum }'">수정</button>
						<button onclick="location.href='eventBoardDelete?eventNum=${eventView.eventNum }'">삭제</button></td>
	</tr>
</table>
</body>
</html>