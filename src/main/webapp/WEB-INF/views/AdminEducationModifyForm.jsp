<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 수정 폼</title>
</head>
<body>
<form action="educationBoardModifyProcess" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="eduTitle" value="${educationView.eduTitle }"/></td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td><img src="resources/educationFile/${educationView.eduImage }" alt="영상 썸네일"/>
				<input type="file" name="eduImageFile"/></td>
		</tr>
		<tr>
			<th>비디오</th>
			<td><textarea name="eduVideo">${educationView.eduVideo }</textarea></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="eduContents">${educationView.eduContents }</textarea>
				<input type="hidden" name="eduNum" value="${educationView.eduNum }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"/></td>
		</tr>
	</table>
</form>
</body>
</html>