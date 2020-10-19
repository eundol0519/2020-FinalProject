<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 수정 폼</title>
</head>
<body>
<form action="medicalBoardModifyProcess" method="POST" enctype="multipart/form-data">
<table>
	<tr>
		<th>의사 이름</th>
		<td><input type="text" name="doctorName" value="${medicalView.doctorName }"/></td>
	</tr>
	<tr>
		<th>의사 코드</th>
		<td>${medicalView.doctorCode}</td>
		<input type="hidden" value="${medicalView.doctorCode}" name="doctorCode"/>
	</tr>
	<tr>
		<th>의사 사진</th>
		<td><img src="resources/medicalFile/${medicalView.doctorImage}" alt="의사 사진">
		<input type="file" name="doctorImageFile"/></td>
	</tr>
	<tr>
		<th>의사 휴무일</th>
		<td><input type="text" name="doctorOff" value="${medicalView.doctorOff }"/></td>
	</tr>
	<tr>
		<th>의사 경력</th>
		<td><textarea name="doctorCareer">${medicalView.doctorCareer }</textarea></td>
	</tr>
	<tr>
		<th>의사 진료 과목</th>
		<td><textarea name="doctorSubject">${medicalView.doctorSubject }</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정"/></td>
	</tr>
</table>
</form>
</body>
</html>