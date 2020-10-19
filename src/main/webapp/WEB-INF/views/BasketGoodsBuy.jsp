<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
</style>
</head>
<!-- 주소지 radio -->
<script>
	// 기존 배송 정보
	function address(){

		if(${sessionScope.loginUser.userAddress.equals("정보 없음")}){
			alert("배송지 정보가 없습니다 배송지를 적어주세요");

			var output = "<div>";
			output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>";
			output += "<input type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
			output += "<input type='text' id='address' name='address' placeholder='주소'><br>";
			output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'>";
			output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>";
			output += "<input type='button' onclick='addressUpdate()' value='등록'>";
			output += "</div>";
			$("#addressChange").html(output);
		}else{
		
			var output = "<div>";
			output += "${sessionScope.loginUser.userAddress}";
			output += "<input type='hidden' id='addressCheck' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>";
			output += "</div>";
			$("#addressChange").html(output);
			$("#addressResult").hide();
			document.getElementById("addressCheckResult").value = 0;
			// 기본 배송지일 경우 : 0
		}
	}

	// 신규 배송 정보
	function newAddress(){
		var output = "<div>";
		output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>";
		output += "<input type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
		output += "<input type='text' id='address' name='address' placeholder='주소'><br>";
		output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'>";
		output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>";
		output += "<input type='button' onclick='addressUpdate()' value='등록'>";
		output += "</div>";
		$("#addressChange").html(output);
		$("#addressResult").show();
	}

	// 신규 주소 업데이트
	function addressUpdate(){

		var postcode = document.getElementById("postcode").value;
		var address = document.getElementById("address").value;
		var detailAddress = document.getElementById("detailAddress").value;
		var extraAddress = document.getElementById("extraAddress").value;

		var address = postcode + " " + address + " " + detailAddress + " " + extraAddress;

		$.ajax({
			type :"POST",
			url : "addressUpdate",
			data : {
				"postcode" : postcode,
				"address" : address,
				"detailAddress" : detailAddress,
				"extraAddress" : extraAddress
				},
			success : function(){
				document.getElementById("addressResult").innerHTML = address;
				$("#addressResult").show();
				document.getElementById("addressCheckResult").value = 1;
				// 신규 배송지일 경우 1
				}
			});
	}
</script>

<!-- 포인트, 쿠폰 사용 -->
<script>
	// 포인트 모두 사용
	function point_all(){

		var check = ${goodsPrice * basketGoodsCount} >= ${sessionScope.loginUser.userPoint};
		// 상품 금액이 현재 보유 중인 포인트 보다 큰지 체크

		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
		
		var point = original_point - use_point;
		// 기존 포인트 - 사용한 포인트
		
		var sum = ${basketGoodsCount * goodsPrice};
		// 합계 금액
	
		if(${sessionScope.loginUser.userPoint} >= 0 && check == true){

			var total_sum = sum - use_point;
			// 합계 금액  - 사용한 포인트
			document.getElementById("total_sum").value = total_sum;
			document.getElementById("total_sum").innerHTML = "총금액 : " + total_sum;
			
			document.getElementById('point').value = ${sessionScope.loginUser.userPoint};
			// input 태그에 point 전체 값 출력
			
			document.getElementById('original_point').value = "현재 포인트 : " + point;
			document.getElementById("original_point").innerHTML = "현재 포인트 : " + point;

			document.getElementById("payCheck").value = 2;
			document.getElementById("couponCheck").value = 0;
			
			var total_point = total_sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			
		}else{
			alert("포인트가 부족하여 사용 하실 수 없습니다.");
		}
	}

	// 포인트 선택 사용
	function point_use(){

		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
			
		var point = original_point - use_point;
		// 기존 포인트 - 사용한 포인트
				
		var use_pointCheck = use_point <= original_point;
		// 선택 사용 할 때 보유한 포인트 보다 크게 적지 못하게
		
		var check = ${goodsPrice * basketGoodsCount} >= use_point;
		// 입력한 포인트가 합계 금액보다 작으면
		
		var sum = ${basketGoodsCount * goodsPrice};
		// 합계 금액

		if(${sessionScope.loginUser.userPoint} >= 0 && check == true && use_pointCheck == true){

			var total_sum = sum - use_point;
			// 합계 금액  - 사용한 포인트
			document.getElementById("total_sum").value = total_sum;
			document.getElementById("total_sum").innerHTML = "총금액 : " + total_sum;

			document.getElementById('original_point').value = point;
			document.getElementById("original_point").innerHTML = "현재 포인트 : " + point;

			document.getElementById("payCheck").value = 2;
			document.getElementById("couponCheck").value = 0;
			
			var total_point = total_sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			
		}else{

			alert("포인트가 부족하거나, 금액 보다 많습니다.");
			
			document.getElementById('point').value = 0;
			document.getElementById('point').focus;

			// 가지고 있는 포인트 보다 많이 쓰면 기존 금액과 포인트를 출력한다.
			document.getElementById('total_sum').value = sum;
			document.getElementById('total_sum').innerHTML = "총금액 : " + sum;

			document.getElementById('original_point').value = original_point;
			document.getElementById('original_point').innerHTML = "현재 포인트 : " + original_point;
		}
	}

	// 쿠폰 사용 후 금액 차감
	function couponUse(couponCode){

		if(couponCode == undefined){
			document.getElementById("payCheck").value = 0;
			// 해당 없음 쿠폰을 선택 했을 경우 쿠폰 코드를 0으로 설정

			document.getElementById("couponCheck").value = 0;
		}

		// 쿠폰을 바꿀 때마다 포인트의 값이 초기화 되도록 설정
		document.getElementById('point').value = 0;
		document.getElementById('point').focus;

		if(couponCode > 0){
			var couponCode1 = document.getElementById("couponCode"+couponCode).value;
			// "couponCode"+couponCode로 한 이유는 c:forEach를 돌렸을 때 "couponCode".value로 하면 맨 처음에 출력된 value만 불러오기 때문에
			// P.K 컬럼의 값을 뒤에 붙여서 id를 정해준다.

			document.getElementById("couponCheck").value = couponCode;
		}else{
			var couponCode1 = document.getElementById("couponCode0").value;
		}

		if(couponCode1 > 0 && couponCode1 <= 100){ // 퍼센트(/) 할인

			var sum = ${goodsPrice * basketGoodsCount};
			// 금액 * 수량 = 합계 금액
			var total_sum = sum / couponCode1;
			// 합계 금액 / 할인률 = 총금액

			if(total_sum < 0){
				// 총금액이 -가 될 경우
				alert("금액 이상의 쿠폰은 사용 불가 합니다.");
				document.getElementById('total_sum').value = sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + sum;
			}else{
				// 총금액을 출력
				document.getElementById('total_sum').value = total_sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + total_sum;

				document.getElementById("payCheck").value = 1;
				
				var total_point = total_sum * 0.05;
				// 총합에 따른 포인트
				total_point = Math.round(total_point);
				// 반올림

				document.getElementById("total_point").value = total_point;
				document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			}
			
		}else if(couponCode1 >= 1000){ // 금액(-) 할인

			var sum = ${goodsPrice * basketGoodsCount};
			// 금액 * 수량 = 합계 금액
			var total_sum = sum - couponCode1;
			// 합계 금액 / 할인률 = 총금액

			if(total_sum < 0){
				// 총금액이 -가 될 경우
				alert("금액 이상의 쿠폰은 사용 불가 합니다.");
				document.getElementById('total_sum').value = sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + sum;
			}else{
				// 총금액을 출력
				document.getElementById('total_sum').value = total_sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + total_sum;

				document.getElementById("payCheck").value = 1;
				
				var total_point = total_sum * 0.05;
				// 총합에 따른 포인트
				total_point = Math.round(total_point);
				// 반올림

				document.getElementById("total_point").value = total_point;
				document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			}
		}else{

			var sum = ${goodsPrice * basketGoodsCount};
			// 금액 * 수량 = 합계 금액
			var total_sum = sum - couponCode;
			// 합계 금액 / 할인률 = 총금액
			
			document.getElementById('total_sum').value = sum;
			document.getElementById('total_sum').innerHTML = "총금액 : " + sum;

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;

			var total_point = sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = sum;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
		}
	}

	function point_ParseCheck(){
		var point = document.getElementById("point").value;
		if(point >= 0){
			point_use();
		}else{
			alert("포인트는 0 이상부터 가능합니다.")
			document.getElementById("point").value = 0;
		}
	}
</script>

<!-- 쿠폰함 Show, Hide -->
<script>
	$(document).ready(function(){
		
		document.getElementById("msg").innerHTML = "포인트 or 쿠폰함(만원 이상만 사용 가능)";

		var total_point = ${(basketGoodsCount * goodsPrice) * 0.05};
		// 포인트
		total_point = Math.round(total_point);
		// 반올림

		// 지급 포인트 반올림
		document.getElementById("total_point").value = total_point;
		document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
		
		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	});

	function couponBoxShow(){
		
		$("#couponBoxShow").hide();
		$("#couponBoxHide").show();
		$("#pointBoxShow").hide();
		$("#pointBoxHide").hide();
	}

	function couponBoxHide(){
		
		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	}

	function pointBoxShow(){

		$("#couponBoxShow").hide();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").hide();
		$("#pointBoxHide").show();
	}

	function pointBoxHide(){

		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	}
</script>
<body>
	<table border="1">
		<tr>
			<td colspan="5">정보 입력</td>
		</tr>
		
		<!-- 상품 정보 -->
		<tr>
			<td>상품 번호</td>
			<td>상품 갯수</td>
			<td>상품 금액</td>
			<td>상품 합계</td>
			<td>지급 포인트</td>
		</tr>
		
		<tr>
			<td>${goodsNum}</td>
			<td>${basketGoodsCount}</td>
			<fmt:formatNumber var="goodsPrice1" value="${goodsPrice}"/> 	
			<td>${goodsPrice1}</td>
			<fmt:formatNumber var="goodsSum" value="${basketGoodsCount * goodsPrice}"/> 	
			<td>${goodsSum}</td>
			<fmt:formatNumber var="basket_point" value="${(basketGoodsCount * goodsPrice) * 0.05}"/> 	
			<td>${basket_point}
				<input type="hidden" name="userPoint" value="${basket_point}">
			</td>
		</tr>
		
		<!-- 이름 -->
		<tr>
			<td colspan="5">이름 : ${sessionScope.loginUser.userName}</td>
		</tr>
		
		<!-- 주소지 -->
		<tr>
			<td colspan="5">
			<input type="radio" name="address" onclick="address()">기존 배송지로 설정
			<input type="radio" name="address" onclick="newAddress()">새로운 배송지로 설정
			<input type="hidden" id="addressCheckResult" value=0> <!-- 배송지 어떤 걸로 선택 했는 지 -->
			
			<div id="addressChange">
				${sessionScope.loginUser.userAddress}
				<input type='hidden' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>
			</div><br>
			<span id="addressResult"></span>
			</td>
		</tr>
		
		<!-- 쿠폰 -->
		<tr>
			<td colspan="5">
				<small id="msg"></small>
				
				<div id="couponBoxShow">
					<button onclick="couponBoxShow()">쿠폰함 닫기</button>
				</div>
				
				<div id="pointBoxShow">
					<button onclick="pointBoxShow()">포인트 열기</button>
				</div>
				
				<div id="couponBoxHide">
					<button onclick="pointBoxHide()">쿠폰함 닫기</button>
				
					<table border="1">
						<tr>
							<td>R&P</td>
							<td>쿠폰 코드</td>
							<td>쿠폰 이름</td>
							<td>쿠폰 유효기간</td>
							<td>쿠폰 내용<input type="hidden" id="couponCheck" value="0"> <!-- 쿠폰 번호 저장  --></td>
						</tr>	
						
						<c:choose>
						<c:when test="${not empty userCoupon}">
							<tr>
								<td><input type="radio" id="couponCode0" name="coupon" onclick="couponUse()">
								</td>
								<td>해당없음</td>
								<td>해당없음</td>
								<td>해당없음</td>
								<td>해당없음</td>
							</tr>
							
							
							<c:forEach var="couponList" items="${userCoupon}">
							<tr>
									<td><input type="radio" id="couponCode${couponList.couponCode}" name="coupon" onclick="couponUse(${couponList.couponCode})" 
									value="${couponList.couponSale}"></td>
									<td>${couponList.couponCode}</td>
									<td>${couponList.couponName}</td>
									<fmt:parseDate var="couponDate" value="${couponList.couponDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
									<fmt:formatDate var="newFormatted" value="${couponDate}" pattern="YYYY-mm-dd"/> 
									<td>${newFormatted}</td>
									<td>${couponList.couponContents}
									<input type="hidden" id="couponSale" value="${couponList.couponSale}"> <!-- 쿠폰 세일 내용 -->
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
				
				<div id="pointBoxHide">
					<button onclick="pointBoxHide()">포인트 닫기</button><br>
					<input type="hidden" name="userPoint" value="${(basketGoodsCount * goodsPrice) * 0.05}">
					<p id="original_point">현재 포인트 : ${sessionScope.loginUser.userPoint}</p><br>
					<input type="text" id="point" onblur="point_ParseCheck()" placeholder="포인트 사용" value=0>
					<button onclick="point_all()">모두 사용</button><br>
				</div>
			</td>
		</tr>
		
		<!-- 총금액 -->
		<tr>
			<td colspan="5">
				<p id="total_point">지급 포인트 : ${(basketGoodsCount * goodsPrice) * 0.05}</p>
				<p id="total_sum">총금액  : ${basketGoodsCount * goodsPrice}</p>
				<input type="hidden" id="payCheck"><!-- 할인 방식 체크 -->
			</td>
		</tr>
		
		<tr>
			<td colspan="5"><button id="card">온라인 결제</button>
		
				<!-- DBinsert에서 사용할 정보 -->
				<input type="hidden" id="goodsName" value="${goodsInfo.goodsName}">
				<input type="hidden" id="goodsImage" value="${goodsInfo.goodsImage1}">
				<input type="hidden" id="kind" value="${goodsInfo.kind}<br>">
			</td>
		</tr>
	</table>
</body>

<!-- 우편주소 API script start -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 우편주소 API script end -->
<!-- 카카오페이 결제 -->
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;
</script>
<script>
	$('#card').click(function(){	    

		var total_pay = document.getElementById("total_sum").value;

		if(total_pay == undefined){
			var total_pay = ${basketGoodsCount * goodsPrice};
		}
		
		if(total_pay > 0){

	    IMP.request_pay({
	        pg : 'inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '레어펫', // 상품이름
	        amount : total_pay,//가격
	        buyer_name : '${sessionScope.loginUser.userId}',//이름 
	        buyer_tel : '${sessionScope.loginUser.userPhone}'//전화번호 
			}, function(rsp){
				if(rsp.success){
					DBinsert();
				} else {
					msg = '결제가 실패하였습니다.';

					alert(msg);
					location.href="memberBasketList";
				}
			});
		}else{
			DBinsert();
			// 총합이 0원이면 결제가 쿠폰이나 포인트를 써서 다 끝난거기 때문에 DB로 보낸다.
		}
	});

	// 결제 성공 후 DB에 결제내역 insert, 장바구니 내역 delete
	function DBinsert(){

		var total_pay = document.getElementById("total_sum").value;

		if(total_pay == undefined){
			var total_pay = ${basketGoodsCount * goodsPrice};
		}
		// 결제금액

		var goodsNum = ${goodsNum};
		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
		
		var payCheck = document.getElementById("payCheck").value;
		// 할인을 쿠폰으로 했는 지 포인트로 했는 지 체크 
		
		var point = original_point - use_point;
		// 기존 포인트에서 사용한 포인트 차감
		
		var couponCode = document.getElementById("couponCheck").value;
		// 사용한 쿠폰 코드
		
		var payCheck2 = 0; // 할인 수단 체크

		var addressCheck = document.getElementById("addressCheckResult").value;
		// 기존 주소인지 새로운 주소인지 체크
		
		if(payCheck == 0 && use_point == 0){ // 아무것도 사용 안함.
			payCheck2 = 0; // 선택 X
		}else if(payCheck == 1){ // 쿠폰 사용함
			payCheck2 = 1; // 쿠폰 O
		}else if(use_point > 0){ // 포인트 사용함
			payCheck2= 2; // 포인트 O
		}

		$.ajax({
			type :"GET",
			url : "buyInfoUpdate",
			data : {
				"goodsNum" : goodsNum,
			    "point" : point,
			    "couponCode" : couponCode,
			    "payCheck" : payCheck2,
			    "total_pay" : total_pay,
			    "addressCheck" : addressCheck
				},
			success : function(){
				if(resultMsg = "OK"){
					paySuccess();
				}
			}
		});
	}

	// DBinsert 성공 후
	function paySuccess(){
		location.href="paySuccess";
	}
</script>
</html>