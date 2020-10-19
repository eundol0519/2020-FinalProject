<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
<style>
	table{
		border-collapse: collapse;
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<!-- 결제내역 취소 -->
<script>
	function hotelPaymentDelete(hotelCode, page){

		var con = confirm("정말로 취소 하시겠습니까?");

		if(con == true){
			
			$.ajax({
				type : "POST",
				url : "hotelPaymentDelete",
				data : {"hotelCode" : hotelCode},

				// 성공 시
				success : function(data){
					if(data=="OK"){
						location.href="paymentPagingList?hotelPage"+page;
						alert("취소 되었습니다.");
					}
				}, 

				// 실패 시
				error : function(){
					alert("호텔 삭제 함수 통신 실패");
					}
				}); // end Ajax
		}
	}

	function medicalPaymentDelete(medicalReserveDate, page){
		
		var con = confirm("정말로 취소 하시겠습니까?");

		if(con == true){
			
			$.ajax({
				type : "POST",
				url : "medicalPaymentDelete",
				data : {"medicalReserveDate" : medicalReserveDate},

				// 성공 시
				success : function(data){
					if(data=="OK"){
						location.href="paymentPagingList?medicalPage"+page;
						alert("취소 되었습니다.");
					}
				}, 

				// 실패 시
				error : function(){
					alert("병원 삭제 함수 통신 실패");
					}
				}); // end Ajax
		}
	}

	function beautyPaymentDelete(beautyReserveDate, page){

		var con = confirm("정말로 취소 하시겠습니까?");

		if(con == true){
			
			$.ajax({
				type : "POST",
				url : "beautyPaymentDelete",
				data : {"beautyReserveDate" : beautyReserveDate},

				// 성공 시
				success : function(data){
					if(data=="OK"){
						location.href="paymentPagingList?beautyPage"+page;
						alert("취소 되었습니다.");
					}
				}, 

				// 실패 시
				error : function(){
					alert("미용 삭제 함수 통신 실패");
					}
				}); // end Ajax
		}
	}

	function goodsPaymentDelete(buyGoodsNum, page){
		
		var con = confirm("정말로 취소 하시겠습니까?");

		if(con == true){
			
			$.ajax({
				type : "POST",
				url : "goodsPaymentDelete",
				data : {"buyGoodsNum" : buyGoodsNum},

				// 성공 시
				success : function(data){
					if(data=="OK"){
						location.href="paymentPagingList?goodsPage"+page;
						alert("취소 되었습니다.");
					}
				}, 

				// 실패 시
				error : function(){
					alert("용품 삭제 함수 통신 실패");
					}
				}); // end Ajax
		}
	}
</script>
</head>
<body>
	<h1>결제내역</h1>
	
	<!-- 호텔 -->
	<div id="hotelForm">
	<fieldset>
		<legend>호텔</legend>
		<table border="1">
			<tr>
				<th>예약자</th>
				<th>전화번호</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>동물 종류</th>
				<th>특이사항</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>취소</th>
				<th>리뷰</th>
			</tr>
			
			<!-- 호텔 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty hotelPagingList}">
					<c:forEach var="hotelPaymentList" items="${hotelPagingList}">
						<tr>
							<td>${hotelPaymentList.hotelUserName}</td>
							<td>${hotelPaymentList.hotelUserPhone}</td>
							
							<fmt:parseDate var="parsedDateCheckIn" value="${hotelPaymentList.hotelCheckIn}" pattern="yyyy-MM-dd HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDateCheckIn" value="${parsedDateCheckIn}" pattern="yyyy-MM-dd HH:mm"/> 
							<td>${newFormattedDateCheckIn}</td>

							<fmt:parseDate var="parsedDateCheckOut" value="${hotelPaymentList.hotelCheckOut}" pattern="yyyy-MM-dd HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDateCheckOut" value="${parsedDateCheckOut}" pattern="yyyy-MM-dd HH:mm"/> 
							<td>${newFormattedDateCheckOut}</td>
							
							<td>${hotelPaymentList.hotelAnimalKind}</td>
							<td>${hotelPaymentList.hotelSpecialNote}</td>
							<td>${hotelPaymentList.hotelPayment}</td>
							<!-- 추가 -->
							<td>${hotelPaymentList.hotelReservePrice}</td>
							<td>${hotelPaymentList.hotelReservePrice / 0.05}</td>
							<fmt:formatNumber var="hotelPayment_point" value="${hotelPaymentList.hotelReservePrice * 0.05}"/> 	
							<td>${hotelPayment_point}</td>
							<td><button onclick="hotelPaymentDelete(${hotelPaymentList.hotelCode},${hotelPaging.page})">취소</button></td>
							<td><button onclick="reviewWriteForm?code=${hotelPaymentList.hotelCode}&userId=${hotelPaymentList.hotelUserId}">리뷰쓰기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="11">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${hotelPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${hotelPaging.page > 1}"><a href="paymentPagingList?hotelPage=${hotelPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		<c:if test="${hotelPaging.page >= hotelPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${hotelPaging.page < hotelPaging.maxPage}"><a href="paymentPagingList?hotelPage=${hotelPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 병원 -->
	<div id="medicalForm">
	<fieldset>
		<legend>병원</legend>
		<table border="1">
			<tr>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>동물 종류</th>
				<th>동물 나이</th>
				<th>특이사항</th>
				<th>진료의사</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>적립 포인트</th>
				<th>취소</th>
				<th>리뷰</th>
			</tr>
			
			<!-- 병원 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty medicalPagingList}">
					<c:forEach var="medicalPaymentList" items="${medicalPagingList}">
						<tr>
							<fmt:parseDate var="medicalReserveDate" value="${medicalPaymentList.medicalReserveDate}" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDate" value="${medicalReserveDate}" pattern="yyyy-MM-dd"/> 
							<td>${newFormattedDate}</td>
							
							<fmt:parseDate var="medicalReserveTime" value="${medicalPaymentList.medicalReserveTime}" pattern="HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedTime" value="${medicalReserveTime}" pattern="HH:mm"/> 							
							<td>${newFormattedTime}</td>
							
							<td>${medicalPaymentList.medicalReserveAnimalKind}</td>
							<td>${medicalPaymentList.medicalReserveAnimalAge}</td>
							<td>${medicalPaymentList.medicalReserveAnimalNote}</td>
							<td>${medicalPaymentList.medicalReserveDoctor}</td>
							<td>${medicalPaymentList.medicalReservePayment}</td>
							<td>${medicalPaymentList.medicalReservePrice}</td>
							<fmt:formatNumber var="medicalPayment_point" value="${medicalPaymentList.medicalReservePrice * 0.05}"/> 	
							<td>${medicalPayment_point}</td>
							<td><button onclick="medicalPaymentDelete(${medicalPaymentList.medicalReserveDate},${medicalPaging.page})">취소</button></td>
							<td><button onclick="reviewWriteForm?code=${medicalPaymentList.medicalReserveDoctor}&userId=${medicalPaymentList.medicalReserveUserId}">리뷰쓰기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="12">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>	
		
		<!-- 페이징 처리 -->
		<c:if test="${medicalPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${medicalPaging.page > 1}"><a href="paymentPagingList?medicalPage=${medicalPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		<c:if test="${medicalPaging.page >= medicalPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${medicalPaging.page < medicalPaging.maxPage}"><a href="paymentPagingList?medicalPage=${medicalPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 미용 -->
	<div id="beautyForm">
	<fieldset>
		<legend>미용</legend>
		<table border="1">
			<tr>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>동물 종류</th>
				<th>동물 나이</th>
				<th>특이사항</th>
				<th>예약 디자인</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>적립 포인트</th>
				<th>취소</th>
				<th>리뷰</th>
			</tr>
				
			<!-- 미용 - 결제내역 출력 할 부분 -->	
			<c:choose>
				<c:when test="${not empty beautyPagingList}">
					<c:forEach var="beautyPaymentList" items="${beautyPagingList}">
						<tr>
							<fmt:parseDate var="beautyReserveDate" value="${beautyPaymentList.beautyReserveDate}" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDate" value="${beautyReserveDate}" pattern="yyyy-MM-dd"/> 
							<td>${newFormattedDate}</td>
							
							<fmt:parseDate var="beautyReserveTime" value="${beautyPaymentList.beautyReserveTime}" pattern="HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedTime" value="${beautyReserveTime}" pattern="HH:mm"/> 			
							<td>${newFormattedTime}</td>
							
							<td>${beautyPaymentList.beautyReserveAnimalKind}</td>
							<td>${beautyPaymentList.beautyReserveAnimalAge}</td>
							<td>${beautyPaymentList.beautyReserveAnimalNote}</td>
							<td>${beautyPaymentList.beautyReserveSubject}</td>
							<td>${beautyPaymentList.beautyReservePayment}</td>
							<td>${beautyPaymentList.beautyReservePrice}</td>
							<fmt:formatNumber var="beautyPayment_point" value="${beautyPaymentList.beautyReservePrice * 0.05}"/> 	
							<td>${beautyPayment_point}</td>
							<td><button onclick="beayutyPaymentDelete(${beautyPaymentList.beautyReserveDate},${beautyPaging.page})">취소</button></td>
							<td><button onclick="reviewWriteForm?code=${beautyPaymentList.beautyReserveDesigner}&userId=${beautyPaymentList.beautyReserveUserName}">리뷰쓰기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="11">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${beautyPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${beautyPaging.page > 1}"><a href="paymentPagingList?beautyPage=${beautyPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		<c:if test="${beautyPaging.page >= beautyPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${beautyPaging.page < beautyPaging.maxPage}"><a href="paymentPagingList?beautyPage=${beautyPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 용품 -->
	<div id="goodsForm">
	<fieldset>
		<legend>용품</legend>
		<table border="1">
			<tr>
				<th>용품 코드</th>
				<th>용품 사진</th>
				<th>용품 이름</th>
				<th>용품 종류</th>
				<th>용품 갯수</th>
				<th>배송지</th>
				<th>배송현황</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>취소</th>
				<th>리뷰</th>
			</tr>
			
			<!-- 용품 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty goodsPagingList}">
					<c:forEach var="goodsPaymentList" items="${goodsPagingList}">
						<tr>
							<td>${goodsPaymentList.buyGoodsNum}</td>
							<td><a href="goodsView?goodsNum=${goodsPaymentList.buyGoodsNum}">${goodsPaymentList.goodsImage1}</a></td>
							<td>${goodsPaymentList.goodsName}</td>
							<td>${goodsPaymentList.goodsCategory}</td>
							<td>${goodsPaymentList.buyCount}</td>
							<td>${goodsPaymentList.buyAddress}</td>
							<td>${goodsPaymentList.buyDelevery}</td>
							<td>${goodsPaymentList.buyPayment}</td>
							<fmt:formatNumber var="buyPrice" value="${goodsPaymentList.buyPrice}"/> 	
							<td>${buyPrice}</td>
							<fmt:formatNumber var="goodsPayment_point" value="${goodsPaymentList.buyPrice * 0.05}"/> 	
							<td>${goodsPayment_point}</td>
							<td><button onclick="goodsPaymentDelete(${goodsPaymentList.buyGoodsNum},${goodsPaging.page})">취소</button></td>
							<td><button onclick="reviewWriteForm?num=${goodsPaymentList.buyGoodsNum}&userId=${goodsPaymentList.buyUserId}">리뷰쓰기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="12">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${goodsPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${goodsPaging.page > 1}"><a href="paymentPagingList?goodsPage=${goodsPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		<c:if test="${goodsPaging.page >= goodsPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${goodsPaging.page < goodsPaging.maxPage}"><a href="paymentPagingList?goodsPage=${goodsPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
</body>
</html>