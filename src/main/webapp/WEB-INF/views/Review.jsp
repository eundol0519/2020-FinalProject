
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
<style>
	.box{
		width :590px; 
		height : 170px; 
		margin : 20px 0 20px 0 ;
	}
	#top-div{
		margin : 0 auto;
		width : 590px;
		height : 170px;
		background-color : pink;
	}
	#all-div{
		width : 590px;
		margin: 0 auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "reviewLikeCheck",
		dataType : "json",
		success : function(result){
				likeCheck(result);
			},
		error : function(){
			console.log('좋아요 한 것 없음');
			}
	});
});

function likeCheck(result){
	for(var i in result){
		document.getElementById('like'+result[i].likeReviewNum).innerHTML = '<a onclick="unLikeBtn('+result[i].likeReviewNum+')"><img src="resources/svg/favourite-color.svg" width="30px" height="30px"/></a>';
	}
}
</script>
</head>
<body>
<div id="all-div">
	<!-- 상단 메뉴 -->
	<div id="top-div">
		<form action = "reviewList" name="search">
		<table style="width:100%;">
			<tr>
				<td width="100%" style="text-align:center;">
					<input type="text" name="searchData" value="${searchData }" style="text-align:center; width:80%; height:30px;" placeholder="검색어를 입력하세요."/>
					<a onclick="inputSubmit()"><img src="resources/svg/search.svg" width="30px" height="30px"/></a>
				</td>
			</tr>
			<tr>
				<td>
					<table style="border : solid 1px; text-align : center; width:88%; margin : 0 auto;">
					<tr>
						<td><input type="radio" name="reviewKind" value="" checked/></td>
						<td><input type="radio" name="reviewKind" value="호텔"/></td>
						<td><input type="radio" name="reviewKind" value="병원"/></td>
						<td><input type="radio" name="reviewKind" value="미용"/></td>
						<td><input type="radio" name="reviewKind" value="용품"/></td>
						<c:if test="${empty menu}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '호텔'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='호텔']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '병원'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='병원']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '미용'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='미용']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '용품'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='용품']").prop('checked', true);
							</script>
						</c:if>
					</tr>
					<tr>
						<td>전체</td>
						<td>호텔</td>
						<td>병원</td>
						<td>미용</td>
						<td>용품</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<select name="lineUp" id="lineUp">
						<option value="최신순" selected>최신순</option>
						<option value="오래된순">오래된순</option>
						<option value="좋아요순">좋아요순</option>
					</select>
					<script> $('#lineUp').val("${lineUp}").change();</script>
				</td>
			</tr>
			
			<tr>
				<td>
					<select name="count" id="count">
						<option value="4">4개로 보기</option>
						<option value="8">8개로 보기</option>
						<option value="12">12개로 보기</option>
					</select>
					<script> $('#count').val("${count}").change();</script>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<!-- 상단 메뉴 끝 -->
	<!-- 리뷰 컨테이너 -->
	<div id="container" style="width : 590px; height : 100%; margin : 0 auto;" >
		<c:forEach var="review" items="${reviewList }" varStatus="status">
			<div class="box">
				<table border="1" style="width :590px; height : 100%;">
					<tr>
			 			<td rowspan="4" width="30%"><img src="resources/reviewFile/${review.reviewImage }"/></td>
			 			<th colspan="3" width="60%" height="20px">${review.reviewTitle }</th>
			 			<td rowspan="4" width="10%">
				 			<c:if test="${not empty sessionScope.loginUser }">
				 				<div id="like${review.reviewNum}"><!-- a.jax 구간 -->
					 				<a onclick="likeBtn(${review.reviewNum})"><img src="resources/svg/favourite.svg" width="30px" height="30px"/></a>
					 				<script>
										//라이크 버튼 눌렀을 때 실행
										function likeBtn(reviewNum){
											$.ajax({
												type : "POST",
												url : "reviewLike",
												data : {"reviewNum" : reviewNum},
												dataType : "json",
												success : function(result){
															if(result==1){
																likeResult(result, reviewNum);
															} else {
																alert("좋아요 안돼");
															}
														},
												error : function(){
													alert("좋아요 실패");
													}
											});
										}
										
										//라이크 처리가 되면 실행
										function likeResult(result, reviewNum){
											var output="";
											output="<a onclick='unLikeBtn("+reviewNum+
													")'><img src='resources/svg/favourite-color.svg' width='30px' height='30px'/></a>";
													
											document.getElementById("like"+reviewNum).innerHTML = output;
										}
										
										//언라이크 버튼 눌렀을 때 실행
										function unLikeBtn(reviewNum){
											$.ajax({
												type : "POST",
												url : "reviewUnLike",
												data : {"reviewNum" : reviewNum},
												dataType : "json",
												success : function(result){
															if(result==1){
																unLikeResult(result, reviewNum);
															} else {
																alert("좋아요 취소 안돼");
															}
														},
												error : function(){
													alert("좋아요 취소 실패");
													}
											});
										}
										
										//언라이크 처리가 되면 실행
										function unLikeResult(result, reviewNum){
											var output="";
											output="<a onclick='likeBtn("+reviewNum+
													")'><img src='resources/svg/favourite.svg' width='30px' height='30px'/></a>";
											document.getElementById("like"+reviewNum).innerHTML = output;
										}
										</script>
					 				<!-- 좋아요 버튼 끝 -->
				 				</div>
				 				<!-- 신고 -->
				 				<c:if test="${sessionScope.loginUser.userId ne review.reviewUserId }">
				 					<a onclick="reportBtn(${review.reviewNum})"><img src="resources/svg/horn.svg" width="30px" height="30px"/></a>
				 					<script>
										function reportBtn(reviewNum){
											window.open("reviewReportForm?reviewNum="+reviewNum,"reviewReport", "width=500, height=500");
										}
									</script>
				 				</c:if>
				 				<!-- 신고 끝 -->
				 				<!-- 수정 -->
				 				<c:if test="${sessionScope.loginUser.userId eq review.reviewUserId }">
				 					<a href="reviewModifyForm?reviewNum=${review.reviewNum }"><img src="resources/svg/new.svg" width="40%" /></a>
				 				</c:if>
				 				<!-- 삭제 -->
				 				<c:if test="${sessionScope.loginUser.userId eq review.reviewUserId }">
				 					<a href="reviewDelete?reviewNum=${review.reviewNum }"><img src="resources/svg/delete.svg" width="40%" /></a>
				 				</c:if>
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
		</c:forEach>
	</div>
	<!-- 리뷰 컨테이너 끝 -->
	<!-- 페이징 구간 -->
	<div id="paging" style="text-align : center;">
		<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
		<c:if test="${paging.page>1 }">
			<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page-1}">[이전]</a>&nbsp;
		</c:if> 
		<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page }">	
					[${i}]								
				</c:when>
				<c:otherwise>
					<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
		<c:if test="${paging.page<paging.maxPage}">
			&nbsp;<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page+1}">[다음]</a>
		</c:if>
	</div>
	<!-- 페이징 구간 끝 -->
</div>
</body>
<script>
	function inputSubmit(){
		search.submit();
	}
</script>

</html>