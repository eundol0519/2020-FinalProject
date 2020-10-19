<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 방 수정</title>
</head>
<body>
<table>
<form action="hotelBoardModifyProcess" method="POST" enctype="multipart/form-data">
	<tr>
		<th>방 크기</th>
		<td><input type="text" name="hotelSize" value="${hotelView.hotelSize }"/></td>
	</tr>
	<tr>
		<th>호텔 방 코드</th>
		<td>${hotelView.hotelCode }</td>
		<input type="hidden" name="hotelCode" value="${hotelView.hotelCode }"/>
	</tr>
	<tr>
		<th>호텔 방 이름</th>
		<td><input type="text" name="hotelRoomName" value="${hotelView.hotelRoomName }"/></td>
	</tr>
	<tr>
		<th>호텔 방 가격</th>
		<td><input type="text" name="hotelPrice" value="${hotelView.hotelPrice }" onKeyPress="inputNumCom()"/></td>
	</tr>
	<tr>
		<th>최대 수용 가능한 마리 수</th>
		<td><input type="text" name="hotelMaxAnimal" value="${hotelView.hotelMaxAnimal }"/></td>
	</tr>
	<tr>
		<th>방 상세 정보</th>
		<td><textarea type="text" name="hotelContents">${hotelView.hotelContents }</textarea></td>
	</tr>
	<tr>
		<th>방 사진</th>
		<td><img src="hotelFile/" alt="호텔 방 사진"/>
			<input type="file" name="hotelImageFile" multiple/></td>
	</tr>
	<tr>
		<td colsapn="2"><input type="submit" value="수정"/></td>
	</tr>
</form>
</table>
</body>
<script>
function inputNumCom(){
	 var keycode = event.keyCode;

	 if( !((48 <= keycode && keycode <=57) || keycode == 13 || keycode == 46) ){
	  //alert("숫자만 입력 가능합니다.!");
	  event.keyCode = 0;  // 이벤트 cancel
	 }
	}
</script>
</html>