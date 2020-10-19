<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 작성 폼</title>
</head>
<body>
<form action="educationBoardWrite" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="eduTitle"/></td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td><input type="file" name="eduImageFile"/></td>
		</tr>
		<tr>
			<th>비디오</th>
			<td><textarea name="eduVideo"></textarea></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="eduContents"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성"/></td>
		</tr>
	</table>
</form>
</body>
</html>