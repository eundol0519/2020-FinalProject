<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
<div style="width:100%;">
	<ul>
		<li><a href="hotelManagement">게시판 관리</a></li>
		<li><a href="reviewBoardList">리뷰 관리</a></li>
		<li><a href="adminMemberList">회원 관리</a></li>
		<li><a href="hotelReserveList">예약 및 결제 관리</a></li>
	</ul>
</div>
<div style="width:100%; ">
<!-- 왼쪽 -->
	<div style="width:20%; background-color:pink; float:left;">
	<table>
		<tr><th><a href="reviewBoardList?kind=호텔">호텔</a></th></tr>
		<tr><th><a href="reviewBoardList?kind=미용">미용</a></th></tr>
		<tr><th><a href="reviewBoardList?kind=병원">병원</a></th></tr>
		<tr><th><a href="reviewBoardList?kind=용품">용품</a></th></tr>
	</table>
	</div>
<!-- 오른쪽 -->
	<div style="width:50%; background-color:green; float:right;">
		<c:forEach var="review" items="${reviewList }" varStatus="status">
			<div id="report${status.index +1}"><!-- a.jax 구간 -->
			<table border="1" style="width :590px; height : 100%;">
						<tr>
				 			<td rowspan="4" width="30%"><img src="resources/reviewFile/${review.reviewImage }"/></td>
				 			<th colspan="3" width="60%" height="20px">${review.reviewTitle }</th>
				 			<td rowspan="4" width="10%">
				 				<!-- 블라인드 버튼 -->
				 				<c:if test="${review.reviewBlind ne 'BLIND' }">
					 				<button onclick="reviewBlind(${review.reviewNum},${status.index +1})">BLIND</button>
				 				</c:if>
				 				<c:if test="${review.reviewBlind eq 'BLIND' }">
				 				 	이미 블라인드 처리된 리뷰입니다.
				 				</c:if>
				 			</td>
						</tr>
						<tr>
							<td width="" colspan="2" height="15px">${review.reviewRating }</td>
						</tr>
						<tr>
							<td>${review.reviewDate }</td>
							<td width="20%"  height="20px">${review.reviewUserId }</td>
						</tr>
						<tr>
							<td colspan="2">${review.reviewContents }</td>
						</tr>
					</table>
		</div>
		<script>
			function reviewBlind(reviewNum,index){
				$.ajax({
				type : "GET",
				url : "reviewBlind",
				data : {"reviewNum" : reviewNum},
				dataType : "json",
				success : function(result){
							if(result==0){
								alert("이미 블라인드 처리 된 리뷰입니다.");
							}else{
								alert("블라인드 처리가 완료되었습니다.");
								report.HTML.hide();
								$("'#report"+index+"'").hide();
							}
						},
				error : function(){
						alert("블라인드 처리에 실패했습니다.");
						}
				});
			}
		</script>
		</c:forEach>
		<div>
			<!-- 페이징 구간 -->
			<c:if test="${not empty reviewList}">
				<!-- 호텔 리뷰 페이징 -->
				<c:if test="${reviewList.get(0).reviewKind eq '호텔'}">
					<div id="paging" style="text-align : center;">
						<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
						<c:if test="${paging.page>1 }">
							<a href="reviewBoardList?kind=호텔&page=${paging.page-1}">[이전]</a>&nbsp;
						</c:if> 
						<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
							<c:choose>
								<c:when test="${i eq paging.page }">	
									[${i}]								
								</c:when>
								<c:otherwise>
									<a href="reviewBoardList?kind=호텔&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
						<c:if test="${paging.page<paging.maxPage}">
							&nbsp;<a href="reviewBoardList?kind=호텔&page=${paging.page+1}">[다음]</a>
						</c:if>
					</div>
				</c:if>
				<!-- 미용 리뷰 페이징 -->
				<c:if test="${reviewList.get(0).reviewKind eq '미용'}">
					<div id="paging" style="text-align : center;">
						<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
						<c:if test="${paging.page>1 }">
							<a href="reviewBoardList?kind=미용&page=${paging.page-1}">[이전]</a>&nbsp;
						</c:if> 
						<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
							<c:choose>
								<c:when test="${i eq paging.page }">	
									[${i}]								
								</c:when>
								<c:otherwise>
									<a href="reviewBoardList?kind=미용&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
						<c:if test="${paging.page<paging.maxPage}">
							&nbsp;<a href="reviewBoardList?kind=미용&page=${paging.page+1}">[다음]</a>
						</c:if>
					</div>
				</c:if>
				<!-- 병원 리뷰 페이징 -->
				<c:if test="${reviewList.get(0).reviewKind eq '병원'}">
					<div id="paging" style="text-align : center;">
						<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
						<c:if test="${paging.page>1 }">
							<a href="reviewBoardList?kind=병원&page=${paging.page-1}">[이전]</a>&nbsp;
						</c:if> 
						<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
							<c:choose>
								<c:when test="${i eq paging.page }">	
									[${i}]								
								</c:when>
								<c:otherwise>
									<a href="reviewBoardList?kind=병원&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
						<c:if test="${paging.page<paging.maxPage}">
							&nbsp;<a href="reviewBoardList?kind=병원&page=${paging.page+1}">[다음]</a>
						</c:if>
					</div>
				</c:if>
				<!-- 용품 리뷰 페이징 -->
				<c:if test="${reviewList.get(0).reviewKind eq '용품'}">
					<div id="paging" style="text-align : center;">
						<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
						<c:if test="${paging.page>1 }">
							<a href="reviewBoardList?kind=용품&page=${paging.page-1}">[이전]</a>&nbsp;
						</c:if> 
						<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
							<c:choose>
								<c:when test="${i eq paging.page }">
									[${i}]								
								</c:when>
								<c:otherwise>
									<a href="reviewBoardList?kind=용품&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
						<c:if test="${paging.page<paging.maxPage}">
							&nbsp;<a href="reviewBoardList?kind=용품&page=${paging.page+1}">[다음]</a>
						</c:if>
					</div>
				</c:if>
			</c:if>
		<!-- 페이징 구간 끝 -->
		</div>
	</div>
</div>

</body>
</html>