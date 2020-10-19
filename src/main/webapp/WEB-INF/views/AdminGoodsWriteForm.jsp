<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 작성 폼</title>
</head>
<body>
<form action="goodsBoardWrite" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>용품 이름</th>
			<td><input type="text" name="goodsName"/></td>
		</tr>
		<tr>
			<th>용품 가격</th>
			<td><input type="text" name="goodsPrice"/></td>
		</tr>
		<tr>
			<th>용품 재고</th>
			<td><input type="text" name="goodsStock"/></td>
		</tr>
		<tr>
			<th>용품 사용 가능한 동물 종류</th>
			<td><input type="checkbox" name="goodsAnimalKinds" value="강아지"/>강아지<br/>
				<input type="checkbox" name="goodsAnimalKinds" value="고양이"/>고양이</td>
		</tr>
		<tr>
			<th>용품 종류</th>
			<td><input type="radio" name="goodsCategory" value="사료"/>사료<br/>
				<input type="radio" name="goodsCategory" value="간식"/>간식<br/>
				<input type="radio" name="goodsCategory" value="악세서리"/>악세서리<br/>
				<input type="radio" name="goodsCategory" value="장난감"/>장난감<br/>
				<input type="radio" name="goodsCategory" value="기타"/>기타</td>
		</tr>
		<tr>
			<th>용품 상세 내용</th>
			<td><textarea name="goodsContents"></textarea></td>
		</tr>
		<tr>
			<th>용품 사진</th>
			<td><input type="file" multiple name="goodsImageFile"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성"/><input type="reset" value="초기화"/></td>
		</tr>
	</table>
</form>
</body>
</html>