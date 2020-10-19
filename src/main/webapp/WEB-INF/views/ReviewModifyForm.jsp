<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정 폼</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<table>
		<form action = "reviewModifyProcess" id="review" method="POST" enctype="multipart/form-data">
			<tr>
				<th>리뷰 제목</th>
				<td>${reviewView.reviewTitle }</td>
			</tr>
			<tr>
				<th>리뷰 평점</th>
				<td>
					<table>
						<tr>
							<td>
								<input type="radio" value="1" name="reviewRating"/>
								<input type="radio" value="2" name="reviewRating"/>
								<input type="radio" value="3" name="reviewRating"/>
								<input type="radio" value="4" name="reviewRating"/>
								<input type="radio" value="5" name="reviewRating"/>
							</td>
						</tr>
						<tr><td>1 / 2 / 3 / 4 / 5</td></tr>
						<!-- checked -->
						<c:if test="${reviewView.reviewRating eq 1 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='1']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 2 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='2']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 3 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='3']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 4 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='4']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 5 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='5']").prop('checked', true);
							</script>
						</c:if>
					</table>
					</td>
			</tr>
			<tr>
				<th>리뷰 사진</th>
				<td><img src="resources/reviewFile/${reviewView.reviewImage }" alt="리뷰 사진"/>
					<input type="file" name="reviewImageFile"/></td>
			</tr>
			<tr>
				<th>리뷰 내용</th>
				<td><textarea name="reviewContents">${reviewView.reviewContents}</textarea></td>
			</tr>
			<input type="hidden" value="${reviewView.reviewNum }" name="reviewNum"/>
		</form>
			<tr>
				<td colspan="2"><button onclick="reviewSubmit()">수정</button><button onclick="reviewCancel()">취소</button></td>
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