<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 상세보기</title>
</head>
<body>
<table>
	<tr>
		<th>의사 이름</th>
		<td>${medicalView.doctorName}</td>
	</tr>
	<tr>
		<th>의사 코드</th>
		<td>${medicalView.doctorCode}</td>
	</tr>
	<tr>
		<th>의사 사진</th>
		<td><img src="resources/medicalFile/${medicalView.doctorImage}" alt="의사 사진"/></td>
	</tr>
	<tr>
		<th>의사 휴무일</th>
		<td>${medicalView.doctorOff}</td>
	</tr>
	<tr>
		<th>의사 경력</th>
		<td>${medicalView.doctorCareer}</td>
	</tr>
	<tr>
		<th>의사 진료 과목</th>
		<td>${medicalView.doctorSubject }</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="location.href='medicalBoardModify?doctorCode=${medicalView.doctorCode}'">수정</button>
						<button onclick="location.href='medicalBoardDelete?doctorCode=${medicalView.doctorCode}'">삭제</button></td>
	</tr>
</table>
</body>
</html>