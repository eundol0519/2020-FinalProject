<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 상세보기</title>
</head>
<body>
<div style="width:70%">
<table>
	<tr>
		<th width="30%">제목</th>
		<td>${educationView.eduTitle }</td>
	</tr>
	<tr>
		<th>썸네일</th>
		<td><img src="resources/educationFile/${educationView.eduImage }" width="30%;"/></td>
	</tr>
	<tr>
		<th>비디오</th>
		<td>${educationView.eduVideo }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${educationView.eduContents }</td>
	</tr>
	<tr>
		<th>좋아요수</th>
		<td>${educationView.eduLike }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${educationView.eduHit }</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="location.href='educationBoardModify?eduNum=${educationView.eduNum}'">수정</button>
						<button onclick="location.href='educationBoardDelete?eduNum=${educationView.eduNum}'">삭제</button></td>
	</tr>
</table>
</div>
</body>
</html>