<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 폼</title>
</head>
<body>
	<table>
		<form action = "reviewWrite" name="review" method="POST" enctype="multipart/form-data">
			<c:if test="${not empty hotelView }">
				<tr>
					<th>리뷰 제목</th>
					<td>(리뷰)${hotleView.hotelName}</td>
					<input type="hidden" value="(리뷰)${hotleView.hotelName}" name="reviewTitle"/>
				</tr>
				<tr>
					<th>리뷰 종류</th>
					<td>호텔</td>
					<input type="hidden" value="호텔" name="reviewKind"/>
				</tr>
			</c:if>
			<c:if test="${not empty beautyView }">
				<tr>
					<th>리뷰 제목</th>
					<td>(리뷰)${beautyView.designerName}</td>
					<input type="hidden" value="(리뷰)${beautyView.designerName}" name="reviewTitle"/>
				</tr>
				<tr>
					<th>리뷰 종류</th>
					<td>미용</td>
					<input type="hidden" value="미용" name="reviewKind"/>
				</tr>
			</c:if>
			<c:if test="${not empty goodsView }">
				<tr>
					<th>리뷰 제목</th>
					<td>(리뷰)${goodsView.goodsName}</td>
					<input type="hidden" value="(리뷰)${goodsView.goodsName}" name="reviewTitle"/>
				</tr>
				<tr>
					<th>리뷰 종류</th>
					<td>용품</td>
					<input type="hidden" value="용품" name="reviewKind"/>
				</tr>
			</c:if>
			<c:if test="${not empty medicalView }">
				<tr>
					<th>리뷰 제목</th>
					<td>(리뷰)${medicalView.doctorName}</td>
					<input type="hidden" value="(리뷰)${medicalView.doctorName}" name="reviewTitle"/>
				</tr>
				<tr>
					<th>리뷰 종류</th>
					<td>병원</td>
					<input type="hidden" value="병원" name="reviewKind"/>
				</tr>
			</c:if>
			<tr>
				<th>리뷰 평점</th>
				<td>
					<table>
						<tr>
							<input type="radio" value="1" name="reviewRating"/>
							<input type="radio" value="2" name="reviewRating"/>
							<input type="radio" value="3" name="reviewRating"/>
							<input type="radio" value="4" name="reviewRating"/>
							<input type="radio" value="5" name="reviewRating"/>
						</tr>
						<tr>1 / 2 / 3 / 4 / 5</tr>
					</table>
					</td>
			</tr>
			<tr>
				<th>리뷰 사진</th>
				<td><input type="file" name="reviewImage"/></td>
			</tr>
			<tr>
				<th>리뷰 내용</th>
				<td><textarea name="reviewContents"></textarea></td>
			</tr>
			<input type="hidden" name="reviewUserId" value="${sessionScope.loginUser.userId }"/>
		</form>
			<tr>
				<td colspan="2"><button onclick="reviewSubmit()">작성</button><button onclick="reviewCancel()">취소</button></td>
			</tr>
	</table>
</body>
<script>
	function reviewSubmit(){
		review.submit();
	}
	function reviewCancel(){
		window.history.back();
	}
</script>
</html>