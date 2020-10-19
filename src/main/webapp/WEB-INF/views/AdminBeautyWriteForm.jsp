<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용사 작성</title>
</head>
<body>
<table>
<form action="beautyBoardWrite" method="POST" enctype="multipart/form-data">
	<tr>
		<th>디자이너 이름</th>
		<td><input type="text" name="designerName"/></td>
	</tr>
	<tr>
		<th>디자이너 코드</th>
		<td><input type="text" name="designerCode"/></td>
	</tr>
	<tr>
		<th>디자이너 사진</th>
		<td><input type="file" name="designerImageFile"/></td>
	</tr>
	<tr>
		<th>디자이너 휴무일</th>
		<td><input type="text" name="designerOff"/></td>
	</tr>
	<tr>
		<th>디자이너 경력</th>
		<td><textarea name="designerCareer"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="작성"/></td>
	</tr>
</form>
</table>
</body>
</html>