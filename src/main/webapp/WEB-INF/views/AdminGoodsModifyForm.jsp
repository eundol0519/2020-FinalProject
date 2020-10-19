<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 수정 폼</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- checked -->
<script>
	$(document).ready(function() {
		 $('input:checkbox[name="goodsAnimalKinds"]').each(function() {
			 if(this.value == '${goodsView.goodsAnimalKinds[0]}'){ //값 비교
			     this.checked = true; //checked 처리
			  }
			 if(this.value == '${goodsView.goodsAnimalKinds[1]}'){ //값 비교
			       this.checked = true; //checked 처리
			 }
		});
	});
</script>
</head>
<body>
<form action="goodsBoardModifyProcess" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>용품 이름</th>
			<td><input type="text" name="goodsName" value="${goodsView.goodsName }"/></td>
		</tr>
		<tr>
			<th>용품 가격</th>
			<td><input type="text" name="goodsPrice" value="${goodsView.goodsPrice }"/></td>
		</tr>
		<tr>
			<th>용품 재고</th>
			<td><input type="text" name="goodsStock" value="${goodsView.goodsStock }"/></td>
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
				<!-- checked -->
				<c:if test="${goodsView.goodsCategory eq '사료' }">
					<script>
						$("input:radio[name='goodsCategory']:radio[value='사료']").prop('checked', true);
					</script>
				</c:if>
				<c:if test="${goodsView.goodsCategory eq '간식' }">
					<script>
						$("input:radio[name='goodsCategory']:radio[value='간식']").prop('checked', true);
					</script>
				</c:if>
				<c:if test="${goodsView.goodsCategory eq '악세서리' }">
					<script>
						$("input:radio[name='goodsCategory']:radio[value='악세서리']").prop('checked', true);
					</script>
				</c:if>
				<c:if test="${goodsView.goodsCategory eq '장난감' }">
					<script>
						$("input:radio[name='goodsCategory']:radio[value='장난감']").prop('checked', true);
					</script>
				</c:if>
				<c:if test="${goodsView.goodsCategory eq '기타' }">
					<script>
						$("input:radio[name='goodsCategory']:radio[value='기타']").prop('checked', true);
					</script>
				</c:if>
		</tr>
		<tr>
			<th>용품 상세 내용</th>
			<td><textarea name="goodsContents">${goodsView.goodsContents}</textarea></td>
		</tr>
		<tr>
			<th>용품 사진</th>
			<td><img src="resources/goodsFile/${goodsView.goodsImage1 }" alt="용품 사진"/><br/>
				<img src="resources/goodsFile/${goodsView.goodsImage2 }" alt="용품 사진"/><br/>
				<img src="resources/goodsFile/${goodsView.goodsImage3 }" alt="용품 사진"/><br/>
				<img src="resources/goodsFile/${goodsView.goodsImage4 }" alt="용품 사진"/><br/>
				<img src="resources/goodsFile/${goodsView.goodsImage5 }" alt="용품 사진"/><br/>
				<input type="file" multiple name="goodsImageFile"></td>
		</tr>
		<tr>
			<input type="hidden" name="goodsNum" value="${goodsView.goodsNum }"/>
			<td colspan="2"><input type="submit" value="수정"/></td>
		</tr>
	</table>
</form>
</body>
</html>