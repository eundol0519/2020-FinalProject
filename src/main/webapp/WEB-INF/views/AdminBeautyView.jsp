<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용사 상세보기</title>
</head>
<body>
<table>
	<tr>
		<th>디자이너 이름</th>
		<td>${beautyView.designerName}</td>
	</tr>
	<tr>
		<th>디자이너 코드</th>
		<td>${beautyView.designerCode}</td>
	</tr>
	<tr>
		<th>디자이너 사진</th>
		<td><img src="resources/beautyFile/${beautyView.designerImage}" alt="디자이너 사진"/></td>
	</tr>
	<tr>
		<th>디자이너 휴무일</th>
		<td>${beautyView.designerOff}</td>
	</tr>
	<tr>
		<th>디자이너 경력</th>
		<td>${beautyView.designerCareer}</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="location.href='beautyBoardModify?designerCode=${beautyView.designerCode}'">수정</button>
						<button onclick="location.href='beautyBoardDelete?designerCode=${beautyView.designerCode}'">삭제</button></td>
	</tr>
</table>
</body>
</html>