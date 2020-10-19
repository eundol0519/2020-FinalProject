<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>DOG</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shorcut icon" href="resources/favicon.ico">
<meta charset="UTF-8">
<style>
.main-menu-li:hover {
	font-color: #DDC3F7;
}
</style>


<!-- Font -->

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">


<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/common-css/layerslider.css" rel="stylesheet">
<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">

</head>
<body>

	<header style="height: 40%;">

		<div class="middle-menu center-text" style="height: 77%;">
			<div style="width: 20%; height: 25px; float: right;">
				<c:if test="${empty sessionScope.loginUser }">
					<a href="memberJoinForm"><img src="resources/svg/add.svg"
						alt="Join Image" style="width: 25px; height: 25px; float: right;"></a>
					<a href="memberLoginForm"><img src="resources/svg/lock.svg"
						alt="Login Image" style="width: 25px; height: 25px; float: right;"></a>
					<a href="reviewList">리뷰 리스트</a>
				</c:if>
				<c:if test="${not empty sessionScope.loginUser }">
					<a href=""><img src="resources/svg/cart.svg" alt="Cart Image"
						style="width: 25px; height: 25px; float: right;"></a>
					<a href="myPage"><img src="resources/svg/user.svg"
						alt="MyPage Image"
						style="width: 25px; height: 25px; float: right;"></a>
					<a href="memberLogout"><img src="resources/svg/lock-open.svg"
						alt="Logout Image"
						style="width: 25px; height: 25px; float: right;"></a>
					<a href="hotelManagement">어드민 관리 페이지</a>
				</c:if>
			</div>
			<div style="height: 100%; width: 39%; margin: 0 auto;">
				<a href="./" class="logo" style="height: 100%; padding: 0;"> <img
					src="resources/images/logo.png" alt="Logo Image"
					style="float: center; height: 100%;">
				</a>
			</div>
		</div>


		<div class="bottom-area">

			<div class="menu-nav-icon" data-nav-menu="#main-menu">
				<i class="ion-navicon"></i>
			</div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li class="main-menu-li"><a href="hotelList">HOTEL</a></li>
				<li class="main-menu-li"><a href="medicalList">MEDICAL</a></li>
				<li class="main-menu-li"><a href="beautyList">BEAUTY</a></li>
				<li class="main-menu-li"><a href="goodsList">GOODS</a></li>
				<li class="main-menu-li"><a href="educationList">EDUCATION</a></li>
				<li class="main-menu-li"><a href="reviewlist">REVIEW</a></li>
				<li class="main-menu-li"><a href="eventList">EVENT</a></li>
				<li class="main-menu-li"><a href="noticeList">NOTICE</a></li>
			</ul>
			<!-- main-menu -->

		</div>
		<!-- conatiner -->
	</header>






	<!--/////////////////////////////////////// 값이 바뀔 구간 /////////////////////////////////////////////////-->
	<div id="content">
		<div>
			<ul class="" id="main-menu">
				<li class=""><button id="HOTEL" onclick="HOTEL()">기본사항</button></li>
				<li class=""><button id="MEDICAL" onclick="MEDICAL()">주의사항</button></li>
				<li class=""><button id="BEAUTY" onclick="BEAUTY()">예방접종</button></li>
				<li class=""><button id="GOODS" onclick="GOODS()">기본용품</button></li>
			</ul>
		</div>
		<div>
		<ul class="" id="main-menu">
				<li class=""><button  onclick="location.href='noticeList'">제휴사</button></li>
				<li class=""><button  onclick="location.href='DOG'">강아지</button></li>
				<li class=""><button  onclick="location.href='CAT'">고양이</button></li>
			</ul>
		</div>
		<div><p class="HOTEL"><img src="resources/images/병원사진1.jpg" alt="동물병원" width="60%" height="500px">안녕하세요 호텔입니다.</p></div>
		<div><p class="MEDICAL"><img src="resources/images/병원사진2.jpg" alt="동물병원" width="60%" height="500px">안녕하세요 건국본동물병원입니다~! 저희 병원에서는 10년이상 경력의 원장님들이
			24시간진료를 하고 있습니다 . 각 과별 전문진료 및 매년 1000여건의 수술을 실시하는 인천 최대의 전문병원, 건국 본
			동물병원입니다!</p></div>
		<div><p class="BEAUTY"><img src="resources/images/병원사진3.jpg" alt="동물병원" width="60%" height="500px">안녕하세요 미용실</p></div>
		<div><p class="GOODS"><img src="resources/images/병원사진4.jpg" alt="동물병원" width="60%" height="500px">안녕하세요 용품점</p></div>
	</div>
	<!--/////////////////////////////////////// 값이 바뀔 구간 끝 /////////////////////////////////////////////////-->

	<!-- 여기부터 하단 내용 -->
	<section class="footer-instagram-area">

		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h5 class="title">
						<b class="light-color">Follow me &copy; instagram</b>
					</h5>
				</div>
				<!-- col-lg-4 -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->

		<ul class="instagram">
			<li><a href="#"><img src="images/instragram-1-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-2-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-3-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-4-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-5-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-6-300x400.jpg"
					alt="Instagram Image"></a></li>
			<li><a href="#"><img src="images/instragram-7-300x400.jpg"
					alt="Instagram Image"></a></li>
		</ul>
	</section>
	<!-- section -->


	<footer>
		<div class="container">
			<div class="row">

				<div class="col-sm-6">
					<div class="footer-section">
						<p class="copyright">
							Juli &copy; 2018. All rights reserved | Made with <i
								class="ion-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> &amp;
							distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
						</p>
					</div>
					<!-- footer-section -->
				</div>
				<!-- col-lg-4 col-md-6 -->

				<div class="col-sm-6">
					<div class="footer-section">
						<ul class="social-icons">
							<li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
						</ul>
					</div>
					<!-- footer-section -->
				</div>
				<!-- col-lg-4 col-md-6 -->

			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</footer>


	<!-- SCIPTS -->

	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef7896fb022af286c2893272a2bfe30e"></script>
<script>
	// 페이지 시작시 실행 펑션
	$(document).ready(function() {
		$(".HOTEL").show();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").hide();

		
	});

	// 호텔 지도
	function HOTEL() {
		$(".HOTEL").show();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").hide();
		
	};

	// 병원지도
	function MEDICAL() {
		$(".HOTEL").hide();
		$(".MEDICAL").show();
		$(".BEAUTY").hide();
		$(".GOODS").hide();
		
	};

	// 미용실 지도
	function BEAUTY() {
		$(".HOTEL").hide();
		$(".MEDICAL").hide();
		$(".BEAUTY").show();
		$(".GOODS").hide();
		

	};

	// 상품 지도
	function GOODS() {
		$(".HOTEL").hide();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").show();
		
	};
</script>
</html>
