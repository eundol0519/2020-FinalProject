<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 작성 폼</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
$(document).ready(function(){
	$('#readCoupon').click(function(){
		$.ajax({
			type : "GET",
			url : "eventCouponList",
			dataType : "json",
			success : function(result){
							couponList(result);
						},
			error : function(){
							alert("쿠폰 목록 불러오기 실패");
						}
		});
	});
});

	
	function couponList(result){
		var output ="";
		output += "<table><tr><td colspan='4'><input type='radio' value='' name='eventCouponCode'/> 쿠폰 사용 안함 </td></tr>";
		output += "<tr><th></th><th>쿠폰 이름</th><th>쿠폰 코드</th><th>쿠폰 유효기간</th><th>쿠폰 할인률</th></tr>";
		for(var i in result){
			output+="<tr><td><input type='radio' value='"+result[i].couponCode+"' name='eventCouponCode'/></td><td>"+result[i].couponName+"</td><td>"+result[i].couponCode+"</td><td>"+result[i].couponDate+"까지</td><td>"+result[i].couponSale+"%</td></tr>"	
		}		
		output+="</table>";
		$("#couponArea").html(output);
	}
</script>
</head>
<body>
<form action="eventBoardWrite" name="WriteForm" method="POST" enctype="multipart/form-data">
<table>
	<tr>
		<th>이벤트 썸네일</th>
		<td><input type="file" name="eventTitleImageFile"/></td>
	</tr>
	<tr>
		<th>이벤트 사진</th>
		<td><input type="file" name="eventImageFile"/></td>
	</tr>
	<tr>
		<th>이벤트 내용</th>
		<td><textarea name="eventContents"></textarea></td>
	</tr>
	<tr>
		<th>사용할 쿠폰</th>
		<td>
			<div id="couponArea">
			<a id="readCoupon">쿠폰 불러오기</a>
			</div>	<!-- 쿠폰 불러오기를 누르면 쿠폰이 불러와지는 영역 -->
		</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="WriteForm.submit()">작성</button></td>
	</tr>
</table>
</form>
</body>
</html>