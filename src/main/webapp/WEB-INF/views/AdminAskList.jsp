<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 목록</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function reviewReportList(result) {
	var output = "";
	//리뷰 신고 구간
	for ( var i in result.askList) {
		output += '<table style="border: 1px solid #444444; width:100%;"><tr><td rowspan="3"><table border="1" style="width: 590px; height: 100%;">'
				+ '<tr><td rowspan="3" width="30%"><img src="resources/goodsFile/';
		output += result.askList[i].goodsImage1;
		output +='"/></td> <th colspan="3" width="60%" height="20px">';
		output += result.askList[i].goodsName;
		output += '</th></tr><tr><td width="" colspan="2" height="15px"> 문의자 : ';
		output += result.askList[i].askUserId;
		output += '</td></tr><tr><td colspan="2">';
		output += result.askList[i].askContents;
		output += '</td></tr></table></td><td rowspan="3">';
		
		//답변 버튼
		output += '<a onclick="answer('+ result.askList[i].askNum+','+"'"+result.askList[i].askUserId +"'"+ ');">답변하기</a></td></tr></table>';
	}
	//페이징 구간
	output += '<div style="text-align: center;">';
	if (result.paging.page <= 1) {
		output += '[이전] ';
	} else {
		output += '<a onclick="askListPaging('+ (result.paging.page - 1) + ')">[이전]</a> ';
	}
	for (var i = result.paging.startPage; i <= result.paging.endPage; i++) {
		if (i == result.paging.page) {
			output += '[' + i + ']';
		} else {
			output += '<a onclick="askListPaging(' + i + ')">' + i
					+ '</a>';
		}
	}
	if (result.paging.page >= result.paging.maxPage) {
		output += ' [다음]';
	} else {
		output += ' <a onclick="askListPaging('
				+ (result.paging.page + 1) + ')">[다음]</a>';
	}
	output += '</div>';
	//페이징 구간 끝 

	$('#askArea').html(output);
}

$(document).ready(function() {
	$.ajax({
		type : "GET",
		url : "adminAskList",
		dataType : "json",
		success : function(result) {
			reviewReportList(result);
		},
		error : function() {
			alert('답변을 기다리는 문의글이 없습니다.');
		}
	});
});
// 페이징 처리해서 다시 불러오기
function askListPaging(page){
	$.ajax({
		type : "GET",
		url : "adminAskList",
		data : {"page" : page},
		dataType : "json",
		success : function(result) {
			reviewReportList(result);
		},
		error : function() {
			alert('답변을 기다리는 문의글이 없습니다.');
		}
	});
}

// 답변 작성 폼 window.open
function answer(askNum, askUserId){
	var form=document.createElement("form");
	form.setAttribute("method", "POST");
	form.setAttribute("action", "adminAnswerForm");
	form.setAttribute("target", "answerForm");
	
	
	var askNumInput = document.createElement('input');
	askNumInput.type="hidden";
	askNumInput.name="askNum";
	askNumInput.value= askNum;
	form.appendChild(askNumInput);
	
	var askUserIdInput = document.createElement('input');
	askUserIdInput.type="hidden";
	askUserIdInput.name="askUserId";
	askUserIdInput.value= askUserId;
	form.appendChild(askUserIdInput);
	
	document.body.appendChild(form);
	window.open("adminAnswerForm", "answerForm", "width=600, height=400");

	 form.submit();
}
</script>
<body>
<!-- 상단 메뉴 바 -->
	<div>
		<ul>
			<li><a href="hotelManagement">게시판 관리</a></li>
			<li><a href="reviewBoardList">리뷰 관리</a></li>
			<li><a href="adminMemberList">회원 관리</a></li>
			<li><a href="hotelReserveList">예약 및 결제 관리</a></li>
		</ul>
	</div>
	<div>
		<!-- 왼쪽 메뉴 바 -->
		<div style="width: 30%; float: left;">
			<table>
				<tr>
					<th><a href="adminMemberList">회원 목록</a></th>
				</tr>
				<tr>
					<th><a href="goAdminMemberReport">신고 내역</a></th>
				</tr>
				<tr>
					<th><a href="adminMemberSuspendList">정지 회원 목록</a></th>
				</tr>
				<tr>
					<th><a href="goAdminAskList">문의 내역</a></th>
				</tr>
			</table>
		</div>
		<!-- 오늘쪽 메인 화면 -->
		<div style="float: right;" id="askArea"></div>
	</div>
</body>
</html>