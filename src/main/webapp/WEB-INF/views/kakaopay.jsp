<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>온라인 결제</title>
</head>
<body>
	<div>
		<table>
			<caption>결제창</caption>
			<tr>
				<td>상품금액</td>
				<td>: ${sum}</td>
			</tr>
			<tr>

				<td>현재 포인트</td>
				<td>: ${sessionScope.loginUser.userPoint}</td>
			</tr>
			<tr>
				<td>사용할 포인트</td>
				<td><input type="text" id="point" name="point"></td>
				<td><button id="point_use">포인트 사용하기</button></td>
			</tr>
			<tr>
				<td colspan="5"><small id="msg"></small>
					<div id="couponBoxShow">
						<button onclick="couponBoxShow()">쿠폰함 SHOW</button>
					</div>
					<div id="couponBoxHide">
						<button onclick="pointBoxHide()">쿠폰함 HIDE</button>
						<table border="1">
							<tr>
								<td>R&P</td>
								<td>쿠폰 이름</td>
								<td>쿠폰 코드</td>
								<td>쿠폰 유효기간</td>
								<td>쿠폰 내용<input type="hidden" id="couponCheck" value="0">
									<!-- 쿠폰 번호 저장  -->
								</td>
							</tr>
							<c:choose>
								<c:when test="${not empty couponList}">
									<tr>
										<td><input type="radio" id="couponCode0" name="coupon"
											value =""></td>
										<td>해당없음</td>
										<td>해당없음</td>
										<td>해당없음</td>
										<td>해당없음</td>
									</tr>
									<c:forEach var="couponList" items="${couponList}">
										<tr>
											<td><input type="radio"
												id="couponCode" name="coupon"
												value="${couponList.couponSale},${couponList.couponCode}"></td>
											<td>${couponList.couponName}</td>
											<td>${couponList.couponCode}</td>
											<fmt:parseDate var="couponDate"
												value="${couponList.couponDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
											<fmt:formatDate var="newFormatted" value="${couponDate}"
												pattern="YYYY-mm-dd" />
											<td>${newFormatted}</td>
											<td>${couponList.couponContents}<input type="hidden"
												name="couponSale" value="${couponList.couponSale}"> <!-- 쿠폰 세일 내용 -->
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">쿠폰이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
			<tr>
				<td>총 결제금액</td>
				<td><div id="total_sum">${sum}</div></td>
				<td>잔여 포인트</td>
				<td><div id="original_point"></div></td>
			</tr>
		</table>
	</div>
	<button id="online">온라인 결제</button>
	<input type="hidden" name="hotelPrice" value="hotelPrice">
</body>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;
</script>
<script>
$(document).ready(function () {
	document.getElementById("total_sum").value = ${sum};
	document.getElementById("total_sum").innerHTML =  ${sum};
});	
	$('#online').click(function(){
		var total_sum = document.getElementById('total_sum').value;	 


		
		alert('sum : '+total_sum);



		
		if(total_sum>0){
	    IMP.request_pay({
	        pg : 'inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : "${hotel.hotelRoomName}", // 상품이름
	        amount : ${sum},//가격
	        buyer_name : "${hotel.hotelUserName}",//이름 
	        buyer_tel : "${hotel.hotelUserPhone}"//전화번호 
			}, function(rsp){
				if(rsp.success){
						DBinsert();
			} else {
					msg = '결제가 실패하였습니다.';
					msg += '에러내용 :' + rsp.error_msg;
					location.href="<%=request.getContextPath()%>/order/payFail";
				alert(msg);
			}
		});
	} else {
		DBinsert();
		}
	});
	
	function DBinsert() {
		var hotelUserName = "${sessionScope.loginUser.userName}";
		var hotelUserPhone = "${sessionScope.loginUser.userPhone}";
		var hotelCheckIn = "${hotel.hotelCheckIn}";
		var hotelCheckOut = "${hotel.hotelCheckOut}";
		var hotelAnimalKind = "${hotel.hotelAnimalKind}";
		var hotelSpecialNote = "${hotel.hotelSpecialNote}";
		var hotelRoomName = "${hotel.hotelRoomName}";
		var hotelPrice = "${hotel.hotelPrice}";
		var hotelPayment = "${hotel.hotelPayment}";
		var hotelUserId = "${sessionScope.loginUser.userId}";
		var hotelCode = "${hotel.hotelCode}";
		var hotelReservPrice = document.getElementById("total_sum").value;
		var use_point = document.getElementById("point").value;
		var hotelReservPoint = hotelReservPrice * 0.05;
		var string = '';
		var coupon = '';
		if($('input:radio[name="coupon"]:checked').val() == null  || $('input:radio[name="coupon"]:checked').val()==''){
			$.ajax({
				type : "GET",
				url : "kakao/cardPament",
				dataType : "json",
				data : {
					"hotelCode" : hotelCode,
					"hotelUserName" : hotelUserName,
					"hotelUserPhone" : hotelUserPhone,
					"hotelCheckIn" : hotelCheckIn,
					"hotelCheckOut" : hotelCheckOut,
					"hotelAnimalKind" : hotelAnimalKind,
					"hotelSpecialNote" : hotelSpecialNote,
					"hotelPayment" : hotelPayment,
					"hotelUserId" : hotelUserId,
					"hotelRoomName" : hotelRoomName,
					"hotelPrice" : hotelPrice,
					"use_point" : use_point,
					"hotelReservPrice" : hotelReservPrice,
					"hotelReservPoint" : hotelReservPoint
				},
				success : function(result) {
					alert('dd');
					location.href = "memberMyPage";
				}
			});
		} else {
			string = $('input:radio[name="coupon"]:checked').val();
			coupon = string.split(',')[1];
			$.ajax({
				type : "POST",
				url : "kakao/cardPament",
				dataType : "json",
				data : {
					"hotelCode" : hotelCode,
					"hotelUserName" : hotelUserName,
					"hotelUserPhone" : hotelUserPhone,
					"hotelCheckIn" : hotelCheckIn,
					"hotelCheckOut" : hotelCheckOut,
					"hotelAnimalKind" : hotelAnimalKind,
					"hotelSpecialNote" : hotelSpecialNote,
					"hotelPayment" : hotelPayment,
					"hotelUserId" : hotelUserId,
					"hotelRoomName" : hotelRoomName,
					"hotelPrice" : hotelPrice,
					"couponCode" : coupon,
					"hotelReservPrice" : hotelReservPrice,
					"hotelReservPoint" : hotelReservPoint
				},
				success : function() {
					location.href = "Hotel";
				}
			});
		}
	};
</script>

<script>
		// 선택포인트 사용
		document.querySelector('#point_use').addEventListener('click',function(){
			var use_point = document.getElementById("point").value;
			var check = ${sum} >= use_point;
			var total_sum = ${sum} - use_point;
			var original_point = ${sessionScope.loginUser.userPoint} - use_point;

			if(${sessionScope.loginUser.userPoint} >= 0 && check == true && use_point > 0){
	         // 합계 금액 
	          document.getElementById("total_sum").value = total_sum;
	          document.getElementById("total_sum").innerHTML =  total_sum;       
	          // 잔여포인트
	          document.getElementById('original_point').value =  original_point;
	          document.getElementById("original_point").innerHTML = original_point;       
	       } else if (use_point > total_sum){
	          alert("금액 이상의 포인트는 사용할 수 없습니다.");
	       } else {
			   alert("포인트가 부족하여 사용 하실 수 없습니다.");
				}
		});
</script>
<script>
//쿠폰 사용 후 금액 차감
		 $('input[name=coupon]:radio').change(function() {	
		var string = $('input:radio[name="coupon"]:checked').val();
		var coupon = string.split(',')[0];
		var sum = ${sum};
		if (coupon > 100){
		 var total_sum = sum - coupon;
		 document.getElementById("total_sum").value = total_sum;
         document.getElementById("total_sum").innerHTML =  total_sum;      
		} else {
		 var total_sum = sum * (100-coupon)/100;
		 document.getElementById("total_sum").value = total_sum;
         document.getElementById("total_sum").innerHTML =  total_sum;      
			}
		 });
</script>

<!-- 쿠폰함 Show, Hide -->
<script>
$(document).ready(function () {
	document.getElementById("msg").innerHTML = "쿠폰함(만원 이상만 사용 가능)";
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
});
function couponBoxShow() {
	$("#couponBoxShow").hide();
	$("#couponBoxHide").show();
	$("#pointBoxShow").hide();
	$("#pointBoxHide").hide();
}
function couponBoxHide() {
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
}
function pointBoxShow() {
	$("#couponBoxShow").hide();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").hide();
	$("#pointBoxHide").show();
}
function pointBoxHide() {
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
}
</script>
</html>