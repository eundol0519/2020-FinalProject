<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰내역</title>
<style>
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<h1>리뷰내역</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>리뷰 사진</th>
			<th>글 제목</th>
			<th>리뷰 종류</th>
			<th>리뷰 평점</th>
			<th>리뷰 게시 날짜</th>
			<th>좋아요수</th>
		</tr>
		
		<!-- 리뷰 - 리뷰 내역 출력하는 부분 -->
		<c:choose>
			<c:when test="${not empty reviewPagingList}">
				<c:forEach var="memberReviewList" items="${reviewPagingList}">
					<tr>
						<td>${memberReviewList.reviewNum}</td>
						<td>${memberReviewList.reviewImage}</td>
						<td>${memberReviewList.reviewTitle}</td>
						<td>${memberReviewList.reviewKind}</td>
						<td>${memberReviewList.reviewRating}</td>
						<td>
						<fmt:parseDate var="reviewDate" value="${memberReviewList.reviewDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
						<fmt:formatDate var="newFormatted" value="${reviewDate}" pattern="YYYY-mm-dd"/> 
						${newFormatted}
						</td>
						<td>${memberReviewList.reviewLike}</td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<td colspan="7">기록이 없습니다.</td>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 페이징 처리 -->
	<c:if test="${paging.page <= 1}">[이전]&nbsp;</c:if>
	<c:if test="${paging.page > 1}"><a href="reviewPagingList?page=${paging.page-1}">[이전]</a>&nbsp;</c:if>
	
	<c:if test="${paging.page >= paging.maxPage}">[다음]&nbsp;</c:if>
	<c:if test="${paging.page < paging.maxPage}"><a href="reviewPagingList?page=${paging.page+1}">[다음]</a>&nbsp;</c:if>
	<!-- 페이징 처리 -->
</body>
</html>