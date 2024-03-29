<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	table{
		border-collapse: collapse;
	}
	
	.logout{
		margin-right: 1%;
		margin-top: 0.8%;
		border: none;
		border-radius: 12px;
		font-size: 13px;
	}
	
	html{
		position: fixed; 
		overflow-y: scroll;
		width: 100%;
	}
	
	.logo{
		margin-left: 0.5%
	}
	
	.img {
	    width: 700px;
	    height:700px;
	    border-radius: 350px; /* 이미지 반크기만큼 반경을 잡기*/
	} 
	
	.radius-box {
    	width: 700px;
    	height: 700px;
    	background-image:url("배경이미지경로");
    	border-radius: 450px; /* 레이어 반크기만큼 반경을 잡기*/    
    	display: table-cell;
    	vertical-align: middle;
    	color: #ffffff;
    	font-weight: bold;
    	text-align: center;
	}
		
	.image{
		float: left;
		margin-left: 1%;
		border-radius: 7px;
	}
	
	.info{
		float: right;
		border: 1px solid #f3d4ff;
		border-width: thick;
		width: 750px;
		height: 450px; 
		margin-right: 10%;
		font-size: 25px;
		padding-left: 2%;
	}
	
	.popupBtn{
		float: right;
		width: 150px;
		height: 40px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn{
		font-size: 15px;
		width: 150px;
		height: 40px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<!-- 수정 페이지 비밀번호 확인 start -->
<script>
	function modifyPwCheck(){
		var passConfirm = prompt('비밀번호를 입력하세요');

		$.ajax({
			type : "POST",
			url : "modifyPwCheck",
			data : {"passConfirm" : passConfirm},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					location.href="memberModifyForm";
				}else{
					alert('비밀번호가 일치하지 않습니다.');
				}
			},

			// 실패 시
			error : function(){
				alert('modifyPwCheck 함수 통신 실패');
				}
		});
	} 
</script>
<!-- 수정 페이지 비밀번호 확인 end -->

<!-- 탈퇴 페이지 비밀번호 확인 start -->
<script>
	function deletePwCheck(){
		var passConfirm = prompt('비밀번호를 입력하세요');

		$.ajax({
			type : "POST",
			url : "deletePwCheck",
			data : {"passConfirm" : passConfirm},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					alert('탈퇴 되었습니다.');
					location.href="memberDelete";
				}else{
					alert('비밀번호가 일치하지 않습니다.');
				}
			},

			// 실패 시
			error : function(){
				alert('deletePwCheck 함수 통신 실패');
				}
		});
	} 
</script>
<!-- 탈퇴 페이지 비밀번호 확인 end -->
</head>
<header class="all2" style=" height:40%; margin-top: 1%">
	<div class="middle-menu center-text" style=" height:77%;">
		<div style="margin:0 auto;">
			<a href="memberLogout"><img class="logout" src="resources/svg/lock-open.svg" style="width: 30px; height: 30px; float: right"></a>
			<a class="logo" href="./" class="logo" style=" height: 100%; padding:0;">
				<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 100px;">
			</a>
		</div>	
	</div>
</header>
<body>
	<div class="all" style="margin-top: 1%">
		
		<div class="radius-box" style="position: relative;">
			<!-- 프로필 -->
			<img class="img" style="margin-left: 15%" src="resources/memberFile/${sessionScope.loginUser.userImage}"/><br>
			<!-- 이미지 태그를 사용해서 src에 파일 경로를 설정하고 이름을 설정하면 뜸. -->
		</div>
			
			<!-- 수정 -->
			<button class="btn" style="margin-left: 15%; margin-top: 0.5%;" onclick="modifyPwCheck()">수정</button>&nbsp;
			<!-- 탈퇴 -->
			<button class="btn" onclick="deletePwCheck()">탈퇴</button>
		
		<div class="info" style="position: relative; left:2%; bottom: 670px; padding-top: 10%; background-color: #f7f2ff">
			<!-- 회원 정보 띄우기 -->
			아이디 : ${sessionScope.loginUser.userId}<br>
			이름 : ${sessionScope.loginUser.userName}<br>
			<fmt:parseDate var="parsedDate" value="${sessionScope.loginUser.userBirth}" pattern="yyyy-MM-dd"></fmt:parseDate>
			<fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd"/> 
			생년월일 : ${newFormattedDateString}<br>
			성별 : ${sessionScope.loginUser.userGender}<br>
			주소 : ${sessionScope.loginUser.userAddress}<br>
			이메일 : ${sessionScope.loginUser.userEmail}<br>
			전화번호 : ${sessionScope.loginUser.userPhone}<br>
			<fmt:formatNumber var="userPoint" value="${sessionScope.loginUser.userPoint}"/> 	
			포인트 : ${userPoint}<br>
			<a id="popUpBtnCoupon">쿠폰함</a>(${sessionScope.couponCount})<br><br>
		</div>
		
			<!-- 결제내역 -->
		<div style="position: relative; left: 750px; bottom: 40px">
			<button style="margin-left: 1%" class="popupBtn" id="popUpBtnPayment">결제내역</button>&nbsp;
			<!-- 문의내역 -->
			<button style="margin-left: 1%" class="popupBtn" id="popUpBtnAsk">문의내역</button>&nbsp;
			<!-- 장바구니 -->
			<button style="margin-left: 1%" class="popupBtn" id="popUpBtnBasket">장바구니</button>&nbsp;
			<!-- 리뷰내역 -->
			<button style="margin-left: 1%" class="popupBtn" id="popUpBtnReview">리뷰내역</button>&nbsp;<br>
		</div>
	</div>
</body>
<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnPayment = document.getElementById("popUpBtnPayment");
	var mywindowPayment;

	var paymentX = (window.screen.width / 2) - (1300 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var paymentY= (window.screen.height /2) - (700 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 결제내역
	popUpBtnPayment.addEventListener("click", function(){
		mywindowPayment = window.open("memberPaymentList", "mywindowPayment", "width=1300, height=700, left=" + paymentX + ", top=" + paymentY);
	});
</script>

<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnAsk = document.getElementById("popUpBtnAsk");
	var mywindowAsk;

	var askX = (window.screen.width / 2) - (800 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var askY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 문의내역
	popUpBtnAsk.addEventListener("click", function(){
		mywindowAsk = window.open("memberAskList", "mywindowAsk", "width=800, height=600, left=" + askX + ", top=" + askY);
	});
</script>

<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnBasket = document.getElementById("popUpBtnBasket");
	var mywindowBasket;

	var basketX = (window.screen.width / 2) - (900 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var basketY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 장바구니
	popUpBtnBasket.addEventListener("click", function(){
		mywindowBasket = window.open("memberBasketList", "mywindowBasket", "width=900, height=600, left=" + basketX + ", top=" + basketY);
	});
</script>

<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnReview = document.getElementById("popUpBtnReview");
	var myWindowReview;

	var reviewX = (window.screen.width / 2) - (900 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var reviewY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 리뷰내역
	popUpBtnReview.addEventListener("click", function(){
		myWindowReview = window.open("memberReviewList", "myWindowReview", "width=900, height=600, left=" + reviewX + ", top=" + reviewY);
	});
</script>

<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnCoupon = document.getElementById("popUpBtnCoupon");
	var mywindowCoupon;

	var couponX = (window.screen.width / 2) - (800 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var couponY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 쿠폰내역
	popUpBtnCoupon.addEventListener("click", function(){
		mywindowCoupon = window.open("memberCouponList", "mywindowCoupon", "width=800, height=600, left=" + couponX + ", top=" + couponY);
	});
</script>
<!-- 팝업창 띄우기 end -->
</html>