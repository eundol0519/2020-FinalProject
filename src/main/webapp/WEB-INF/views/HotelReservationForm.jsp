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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>호텔예약</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("input:radio[name=hotelPayment]").click(function() {

			if ($("input[name=hotelPayment]:checked").val() == "온라인결제") {
				$('#cashiPayment').hide();
				$('#cardPayment').show();
			} else {
				$('#cardPayment').hide();
				$('#cashiPayment').show();
			}
		});
	});
</script>
<style>
.main-menu-li:hover {
	font-color: #DDC3F7;
}
/* .track {
	width: 100%;
	height: 30vh;
	overflow: hidden;
	background: linear-gradient(to top, #209cff 0%, #68e0cf 100%) no-repeat ;
	display: flex;
	justify-content: center;
	align-items: center;
} */
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">

<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/common-css/layerslider.css" rel="stylesheet">
<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">
<script src="resources/common-js/jquery-3.1.1.min.js"></script>

<script src="resources/common-js/tether.min.js"></script>

<script src="resources/common-js/bootstrap.js"></script>

<script src="resources/common-js/layerslider.js"></script>

<script src="resources/common-js/scripts.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	<!-- /////////////////////////////////////////////////////////////////////////// -->

	<div>
		<div class="main-slider">
			<div id="slider">
				<div class="ls-slide"
					data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
					<img src="resources/hotelFile/${hotel.hotelRoomImage1}"
						class="ls-bg" alt="호텔 정보 사진" />
				</div>
				<!-- ls-slide -->
				<div class="ls-slide"
					data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
					<img src="resources/hotelFile/${hotel.hotelRoomImage2}"
						class="ls-bg" alt="" />
				</div>
				<div class="ls-slide"
					data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
					<img src="resources/hotelFile/${hotel.hotelRoomImage3}"
						class="ls-bg" alt="" />
				</div>
				<div class="ls-slide"
					data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
					<img src="resources/hotelFile/${hotel.hotelRoomImage4}"
						class="ls-bg" alt="" />
				</div>
				<div class="ls-slide"
					data-ls="bgsize:cover; bgposition:50% 50%; duration:3000; transition2d:104; kenburnsscale:1.00;">
					<img src="resources/hotelFile/${hotel.hotelRoomImage5}"
						class="ls-bg" alt="" />
				</div>
				<!-- ls-slide -->

			</div>
			<!-- slider -->
		</div>
		<!-- main-slider -->
	</div>
	<div>
		온라인결제 : <input type="radio" name="hotelPayment" value="온라인결제">
		현장결제 : <input type="radio" name="hotelPayment" value="현장결제">
	</div>
	<!-- 온라인 결제 선택시 표출 -->
	<div id="cardPayment" style="display: none;">
		<form action="kakaopay" method="POST" name="kakaopay">
			<div style="width: 30%; float: left;">
				입실날짜 : <input type="text" id="startDatepicker" name="hotelCheckIn"> 
				퇴실날짜 : <input type="text" id="lastDatepicker" name="hotelCheckOut"> 
			</div>
			<div style="width: 30%; float: left;">
				<table>
					<tr>
						<td><input type="hidden" name="hotelCode"
							value="${hotel.hotelCode}"></td>
						<td><input type="hidden" name="hotelUserName"
							value="${sessionScope.loginUser.userName}"></td>
						<td><input type="hidden" name="hotelUserPhone"
							value="${sessionScope.loginUser.userPhone}"></td>
						<td><input type="hidden" name="hotelUserId"
							value="${sessionScope.loginUser.userId}"></td>
						<td><input type="hidden" name="hotelPrice"
							value="${hotel.hotelPrice}"></td>
						<td><input type="hidden" name="hotelPayment" value="온라인결제"></td>
						<td><input type="hidden" name="hotelRoomName"
							value="${hotel.hotelRoomName}"></td>
					</tr>
					<tr>
						<td>방 이름</td>
						<td>${hotel.hotelRoomName}</td>
					</tr>
					<tr>
						<td>방크기</td>
						<td>${hotel.hotelSize}</td>
					</tr>

					<tr>
						<td>가격</td>
						<td>${hotel.hotelPrice}</td>
					</tr>
					<tr>
						<td>애완동물 종류</td>
						<td><input type="text" name="hotelAnimalKind"
							placeholder="애완동물 종류"></td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td><textarea name="hotelSpecialNote" rows="0" cols="10"></textarea></td>
					</tr>
				</table>
			</div>
			<div style="width: 50%; float: right;">방의 상세정보 :
				${hotel.hotelContents}</div>
			<div style="width: 80%;">
				<input type="submit" value="결제하기">
			</div>
		</form>
	</div>

	<!-- 현장결제 선택시 표출 -->
	<div id="cashiPayment" style="display: none;">
		<form action="cashiPayment" method="POST" name="cardPayment">
			<div style="width: 30%; float: left;">
				입실날짜 : <input type="text" id="ofDatepicker" name="hotelCheckIn"> 
				퇴실날짜 : <input type="text" id="ifDatepicker" name="hotelCheckOut"> 
			</div>
			<div style="width: 30%; float: left;">
				<table>
					<tr>
						<td><input type="hidden" name="hotelCode"
							value="${hotel.hotelCode}"></td>
						<td><input type="hidden" name="hotelUserName"
							value="${sessionScope.loginUser.userName}"></td>
						<td><input type="hidden" name="hotelUserPhone"
							value="${sessionScope.loginUser.userPhone}"></td>
						<td><input type="hidden" name="hotelUserId"
							value="${sessionScope.loginUser.userId}"></td>
						<td><input type="hidden" name="hotelPrice"
							value="${hotel.hotelPrice}"></td>
						<td><input type="hidden" name="hotelPayment" value="현장결제"></td>
						<td><input type="hidden" name="hotelRoomName"
							value="${hotel.hotelRoomName}"></td>
					</tr>
					<tr>
						<td>방 이름</td>
						<td>${hotel.hotelRoomName}</td>
					</tr>
					<tr>
						<td>방크기</td>
						<td>${hotel.hotelSize}</td>
					</tr>

					<tr>
						<td>가격</td>
						<td>${hotel.hotelPrice}</td>
					</tr>
					<tr>
						<td>애완동물 종류</td>
						<td><input type="text" name="hotelAnimalKind"
							placeholder="애완동물 종류"></td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td><textarea name="hotelSpecialNote" rows="0" cols="10"></textarea></td>
					</tr>
				</table>
			</div>
			<div style="width: 50%; float: right;">방의 상세정보 :
				${hotel.hotelContents}</div>
			<div style="width: 80%;">
				<input type="submit" value="결제하기">
			</div>
		</form>
	</div>
	<!-- //////////////////////////////////////////////////////////////////////////////// -->
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
	<script>
	$(function() {
	        //모든 datepicker에 대한 공통 옵션 설정
	        var thisDate = new Date();
	        var thisYear = thisDate.getFullYear();        //해당 연
	        var thisMonth = thisDate.getMonth() + 1;    //해당 월
	 
	        $.datepicker.setDefaults({
	            dateFormat: 'yy-mm-dd'         //Input Display Format 변경
	            ,showOtherMonths: true         //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true     //년도 먼저 나오고, 뒤에 월 표시
	            ,changeYear: true             //콤보박스에서 년 선택 가능
	            ,changeMonth: true             //콤보박스에서 월 선택 가능         
	            ,yearSuffix: "년"             //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']                     //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토']                                         //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']                 //달력의 요일 부분 Tooltip 텍스트
	        });                    

	        // 온라인 결제 달력
	        //시작일의 초기값을 설정
	        $('#startDatepicker').datepicker({
		        minDate : 0,
	            onClose: function( selectedDate ) {    
	                $("#lastDatepicker").datepicker( "option", "minDate", selectedDate );
	                // 시작일(sDatepicker) datepicker가 닫힐때
	                // 종료일(eDatepicker)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	            }                
	        });
	        $('#startDatepicker').datepicker('setDate', thisYear+'-'+thisMonth+'-01');    //시작일 초기값 셋팅
	        
	        //종료일의 초기값을 내일로 설정
	        $('#lastDatepicker').datepicker({
	            onClose: function( selectedDate ) {
	                $("#startDatepicker").datepicker( "option", "maxDate", selectedDate );
	                // 종료일(eDatepicker) datepicker가 닫힐때
	                // 시작일(eDatepicker)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	            }
	        });
	        $('#lastDatepicker').datepicker('setDate', 'today');                        //끝일 초기값 셋팅


			// 현장결제 달력
	        //시작일의 초기값을 설정
	        $('#ofDatepicker').datepicker({
		        minDate : 0,
	            onClose: function( selectedDate ) {    
	                $("#ifDatepicker").datepicker( "option", "minDate", selectedDate );
	                // 시작일(sDatepicker) datepicker가 닫힐때
	                // 종료일(eDatepicker)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	            }                
	        });
	        $('#ofDatepicker').datepicker('setDate', thisYear+'-'+thisMonth+'-01');    //시작일 초기값 셋팅


	        
	        //종료일의 초기값을 내일로 설정
	        $('#ifDatepicker').datepicker({
	            onClose: function( selectedDate ) {
	                $("#ofDatepicker").datepicker( "option", "maxDate", selectedDate );
	                // 종료일(eDatepicker) datepicker가 닫힐때
	                // 시작일(eDatepicker)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	            }
	        });
	        $('#ifDatepicker').datepicker('setDate', 'today');   //끝일 초기값 셋팅
	    });
	</script>
</body>
</html>