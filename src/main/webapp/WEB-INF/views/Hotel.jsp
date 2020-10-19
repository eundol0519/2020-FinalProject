<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shorcut icon" href="resources/favicon.ico">
<title>HOTEL</title>
<style>
.main-menu-li:hover {
	font-color: #DDC3F7;
}

.track {
	width: 100%;
	height: 300px;
	overflow: hidden;
	background: linear-gradient(to top, #209cff 0%, #68e0cf 100%) no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
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

	<!-- //////////////////////////////////////////////////////////////////////////////// -->
	<!-- 바디 -->
	<!-- 소 -->
		<div id="slider">
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel1.hotelRoomImage1}"
					class="ls-bg" alt="호텔 정보 사진" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<c:if test="${not empty sessionScope.loginUser}">
					<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}">예약하기</a></c:if>
					<c:if test="${empty sessionScope.loginUser}"><a class="btn" onclick="goLoginForm()">예약하기</a></c:if>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel1.hotelRoomImage2}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel1.hotelRoomImage3}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel1.hotelRoomImage4}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel1.hotelRoomImage5}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
		</div>
		<!-- slider -->
		
		<!-- 중 -->
		<div id="slider">
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel2.hotelRoomImage1}"
					class="ls-bg" alt="호텔 정보 사진" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel2.hotelRoomImage2}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel2.hotelRoomImage3}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel2.hotelRoomImage4}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel2.hotelRoomImage5}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
		</div>
		<!-- slider -->
		
		<!-- 대 -->
		<div id="slider">
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel3.hotelRoomImage1}"
					class="ls-bg" alt="호텔 정보 사진" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel3.hotelRoomImage2}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel3.hotelRoomImage3}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel3.hotelRoomImage4}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<div class="ls-slide"
				data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/hotelFile/${hotel3.hotelRoomImage5}"
					class="ls-bg" alt="" />
				<div class="slider-content ls-l" style="top: 60%; left: 30%;"
					data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
					<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}">예약하기</a>
					<h3 class="title">
						<b>Love, Happy, Hotel</b>
					</h3>
					<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
				</div>
			</div>
			<!-- ls-slide -->
		</div>
		<!-- slider -->
	
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
	<!-- 푸터 -->
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
	<script>
	function goLoginForm(){
		alert('로그인후 이용가능합니다.');
		location.href="memberLoginForm";
	}
	</script>
	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>

</body>
</html>