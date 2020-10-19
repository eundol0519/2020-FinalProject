<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 신고 폼</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=reportKind]").click(function(){
        if($("input[name=reportKind]:checked").val() == "기타"){
            $('#reportText').show();
        }else{
        	$('#reportText').hide();
        }
    });
});
</script>
<body>
	<table>
		<form id="report">
			<tr>
				<th>신고 할 리뷰</th>
				<td>
					<table border="1">
						<tr>
							<td rowspan="3"><img src="resources/reviewFile/${reviewView.reviewImage }" alt="리뷰 사진"/></td>
							<td>${reviewView.reviewTitle }</td></tr>
						<tr><td>${reviewView.reviewUserId }</td></tr>
						<tr><td>${reviewView.reviewContents }</td></tr>
						<input type="hidden" id="reportReviewNum" value="${reviewView.reviewNum }"/>
					</table>
				</td>
			</tr>
			<tr>
				<th>신고 분류</th>
				<td>
					<table style="text-align:center; width:350px;">
					<tr>
						<td><input type="radio" name="reportKind" id="reportKind1" value="욕설"/></td>
						<td><input type="radio" name="reportKind" id="reportKind2" value="허위사실"></td>
						<td><input type="radio" name="reportKind" id="reportKind3" value="악의적 비방"></td>
						<td><input type="radio" name="reportKind" id="reportKind4" value="기타"></td>
					</tr>
					<tr>
						<td>욕설</td>
						<td>허위사실</td>
						<td>악의적 비방</td>
						<td>기타</td>
					</tr>
					</table>
				</td>
			</tr>
			<!-- 기타 버튼을 누르면 작성 창이 나오게 -->
			<tr id="reportText" style="display: none;">
				<td></td>
				<td colspan="3">
						<textarea id="reportKindAnother"></textarea>
				</td>
			</tr>
				
			<input type="hidden" id="reportUserId" value="${sessionScope.loginUser.userId }"/>
		</form>
			<tr>
				<td colspan="2"><button id="reportSubmit">신고</button><button onclick="closeWindow()">취소</button></td>
			</tr>
	</table>
</body>
<script>
$(document).ready(function(){
	$("#reportSubmit").click(function(){
		var reportUserId = $("#reportUserId").val();
		var reportKind = "";
		if($("#reportKind1").prop('checked')){
			reportKind = '욕설';
	       }
	       else if($("#reportKind2").prop('checked')){
	    	   reportKind = '허위사실';
	       }
	       else if($("#reportKind3").prop('checked')){
	    	   reportKind = '악의적 비방';
	       } else{
	    	   reportKind=$("#reportKindAnother").val();
	       }
		var reportReviewNum = $("#reportReviewNum").val();
		
		$.ajax({
			type : "POST",
			url : "reviewReport",
			data : {"reportUserId" : reportUserId,
					"reportKind" : reportKind,
					"reportReviewNum" : reportReviewNum
 					},
			dataType : "json",
			success : function(result){
						if(result==1){
							alert("신고가 접수되었습니다.");
							window.close();
							}
						else {
							alert("이미 신고한 리뷰입니다.");
							window.close();
						}
					},
			error : function(){
						alert("신고 접수에 실패하였습니다. 작성 폼을 확인해주세요.");
					}
		});
	});
});
	
		

	function closeWindow(){
		window.close();
	}
</script>
</html>