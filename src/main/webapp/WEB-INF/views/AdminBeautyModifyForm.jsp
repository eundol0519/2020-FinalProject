<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용사 수정 폼</title>
</head>
<body>
<form action="beautyBoardModifyProcess" method="POST" enctype="multipart/form-data">
<table>
	<tr>
		<th>디자이너 이름</th>
		<td><input type="text" name="designerName" value="${beautyView.designerName }"/></td>
	</tr>
	<tr>
		<th>디자이너 코드</th>
		<td>${beautyView.designerCode}</td>
	</tr>
	<tr>
		<th>디자이너 사진</th>
		<td><img src="beautyFile/${beautyView.designerImage }" alt="디자이너 사진">
		<input type="file" name="designerImageFile"/></td>
	</tr>
	<tr>
		<th>디자이너 휴무일</th>
		<td><input type="text" name="designerOff" value="${beautyView.designerOff }"/></td>
	</tr>
	<tr>
		<th>디자이너 경력</th>
		<td><textarea name="designerCareer">${beautyView.designerCareer }</textarea></td>
	</tr>
	<tr>
		<input type="hidden" value="${beautyView.designerCode }" name="designerCode"/>
		<td colspan="2"><input type="submit" value="수정"/></td>
</table>
</form>
</body>
</html>