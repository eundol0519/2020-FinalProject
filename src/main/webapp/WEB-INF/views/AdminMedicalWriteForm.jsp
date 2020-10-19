<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 작성 폼</title>
</head>
<body>
<table>
<form action="medicalBoardWrite" method="POST" enctype="multipart/form-data">
	<tr>
		<th>의사 이름</th>
		<td><input type="text" name="doctorName"/></td>
	</tr>
	<tr>
		<th>의사 코드</th>
		<td><input type="text" name="doctorCode"/></td>
	</tr>
	<tr>
		<th>의사 사진</th>
		<td><input type="file" name="doctorImageFile"/></td>
	</tr>
	<tr>
		<th>의사 휴무일</th>
		<td><input type="text" name="doctorOff"/></td>
	</tr>
	<tr>
		<th>의사 경력</th>
		<td><textarea name="doctorCareer"></textarea></td>
	</tr>
	<tr>
		<th>의사 진료 과목</th>
		<td><textarea name="doctorSubject"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="작성"/></td>
	</tr>
</form>
</table>
</body>
</html>