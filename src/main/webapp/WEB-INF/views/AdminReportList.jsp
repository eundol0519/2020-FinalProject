<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 가져오는 곳</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function reviewReportList(result) {
		var output = "";
		//리뷰 신고 구간
		for ( var i in result.reportList) {
			output += '<table style="border: 1px solid #444444; width:100%;"><tr><td rowspan="3"><table border="1" style="width: 590px; height: 100%;">'
					+ '<tr><td rowspan="4" width="30%"><img src="resources/reviewFile/';
			output += result.reportList[i].reviewImage;
			output +='"/></td> <th colspan="3" width="60%" height="20px">';
			output += result.reportList[i].reviewTitle;
			output += '</th></tr><tr><td width="" colspan="2" height="15px">';
			output += result.reportList[i].reviewRating;
			output += '</td></tr><tr><td>';
			output += result.reportList[i].reviewDate;
			output += '</td><td width="20%" height="20px">';
			output += result.reportList[i].reviewUserId;
			output += '</td></tr><tr><td colspan="2">';
			output += result.reportList[i].reviewContents;
			output += '</td></tr></table></td><td>';
			//오른쪽 화면 신고한 회원 정보
			output += result.reportList[i].reportUserId;
			output += '</td></tr><tr><td>';
			output += result.reportList[i].reportKind;
			output += '</td></tr>';
			//신고 버튼
			output += '<tr><td><button onclick="userSuspend(' + "'"
					+ result.reportList[i].reviewUserId + "'" + ', '
					+ result.reportList[i].reviewNum + ', ' + "'"
					+ result.reportList[i].reportUserId + "'," + "'"
					+ result.reportList[i].reportKind + "'"
					+ ');">정지</button></td></tr></table>';
		}
		//페이징 구간
		output += '<div style="text-align: center;">';
		if (result.paging.page <= 1) {
			output += '[이전] ';
		} else {
			output += '<a href="adminMemberList?page='+ (result.paging.page - 1) + '">[이전]</a> ';
		}
		for (var i = result.paging.startPage; i <= result.paging.endPage; i++) {
			if (i == result.paging.page) {
				output += '[' + i + ']';
			} else {
				output += '<a href="adminMemberList?page=' + i + '">' + i
						+ '</a>';
			}
		}
		if (result.paging.page >= result.paging.maxPage) {
			output += ' [다음]';
		} else {
			output += ' <a href="adminMemberList?page='
					+ (result.paging.page + 1) + '">[다음]</a>';
		}
		output += '</div>';
		//페이징 구간 끝 

		$('#reportArea').html(output);
	}

	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "adminMemberReport",
			dataType : "json",
			success : function(result) {
				reviewReportList(result);
			},
			error : function() {
				alert('신고 된 리뷰가 없습니다.');
			}
		});
	});

	// 정지 회원 
	function userSuspend(reviewUserId, reviewNum, reportUserId, reportKind) {
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "adminMemberSuspendForm");
		form.setAttribute("target", "suspendForm");

		var reviewNumInput = document.createElement('input');
		reviewNumInput.type = "hidden";
		reviewNumInput.name = "reviewNum";
		reviewNumInput.value = reviewNum;
		form.appendChild(reviewNumInput);

		var reviewUserIdInput = document.createElement('input');
		reviewUserIdInput.type = "hidden";
		reviewUserIdInput.name = "reviewUserId";
		reviewUserIdInput.value = reviewUserId;
		form.appendChild(reviewUserIdInput);

		var reportUserIdInput = document.createElement('input');
		reportUserIdInput.type = "hidden";
		reportUserIdInput.name = "reportUserId";
		reportUserIdInput.value = reportUserId;
		form.appendChild(reportUserIdInput);

		var reportKindInput = document.createElement('input');
		reportKindInput.type = "hidden";
		reportKindInput.name = "reportKind";
		reportKindInput.value = reportKind;
		form.appendChild(reportKindInput);

		document.body.appendChild(form);
		
		window.open("adminMemberSuspendForm", "suspendForm",
				"width=600, height=500");

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
		<div style="float: right;" id="reportArea"></div>
	</div>
</body>
</html>