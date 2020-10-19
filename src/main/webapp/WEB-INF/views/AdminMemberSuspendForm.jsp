<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정지 선택</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function suspendSubmit(reviewUserId, reviewNum, reportUserId){
	var suspendDeadLine = $('#suspendDeadLine').val();
	
	$.ajax({
		type:"POST",
		url:"adminMemberSuspend",
		data:{
				"reviewUserId" : reviewUserId,
				"reviewNum" : reviewNum,
				"suspendDeadLine" : suspendDeadLine,
				"reportUserId" : reportUserId
				},
		dataType:"json",
		success : function(result){
					if(result>=1){
						alert('회원이 정지 되었습니다.');
						window.close();
					} else {
						alert('이미 정지된 회원입니다.');
						window.close();
					}
				},
		error : function(){
					alert('회원 정지에 실패하였습니다.');
				}
	});
};
</script>
<body>
	<table>
		<tr>
			<td>${report.reviewUserId}</td><td>${report.reportKind }</td>
		</tr>
		<tr>
			<td>${report.reportUserId}</td>
		</tr>
		<tr>
			<td colspan="2">
				<select id="suspendDeadLine">
					<option value="1">1일</option>
					<option value="3">3일</option>
					<option value="5">5일</option>
					<option value="7">7일</option>
					<option value="10">10일</option>
					<option value="15">15일</option>
					<option value="30">30일</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button onclick="suspendSubmit('${report.reviewUserId}',${report.reviewNum },'${report.reportUserId}')">정지</button></td>
		</tr>
	</table>
</body>
</html>