<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 상세보기</title>
</head>
<body>
<table>
	<tr>
		<td colspan="6">
			<img src="resources/goodsFile/${goodsView.goodsImage1 }" alt="용품 이미지"/><br/>
			<img src="resources/goodsFile/${goodsView.goodsImage2 }" alt="용품 이미지"/><br/>
			<img src="resources/goodsFile/${goodsView.goodsImage3 }" alt="용품 이미지"/><br/>
			<img src="resources/goodsFile/${goodsView.goodsImage4 }" alt="용품 이미지"/><br/>
			<img src="resources/goodsFile/${goodsView.goodsImage5 }" alt="용품 이미지"/>
		</td>
	</tr>
	<tr>
		<th>용품명</th><td>${goodsView.goodsName }</td>
		<td><img src="resources/svg/eye.svg" alt="조회수 이미지"/></td><td>${goodsView.goodsHit }</td>
		<td><img src="resources/svg/favourite-color.svg" alt="좋아요 이미지"/></td><td>${goodsView.goodsLike }</td>
	</tr>
	<tr>
		<th>가격</th><td>${goodsView.goodsPrice}</td>
		<th>재고</th><td>${goodsView.goodsStock }</td>
	</tr>
	<tr>
		<th>사용 가능 동물</th><td>${goodsView.goodsAnimalKind}</td>
		<th>물품 카테고리</th><td>${goodsView.goodsCategory }</td>
	</tr>
	<tr>
		<td>
			<img src="resources/goodsFile/${goodsView.goodsContents}" alt="${goodsView.goodsContents}"/>
		</td>
	</tr>
	<tr>
		<td colspan="6"><button onclick="location.href='goodsBoardModify?goodsNum=${goodsView.goodsNum}'">수정</button>
						<button onclick="location.href='goodsBoardDelete?goodsNum=${goodsView.goodsNum}'">삭제</button></td>
	</tr>
</table>
		
		
</body>
</html>