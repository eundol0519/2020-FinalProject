<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
	float:left
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
$(document).ready(function(){
	$("input:radio[name=goodsAnimalKind]:radio[value=강아지]").change(function(){
		var output = "";
		output+="<input type='radio' name='goodsCategory' value='강아지간식'>강아지간식";
		output+="<input type='radio' name='goodsCategory' value='강아지사료'>강아지사료";
		output+="<input type='radio' name='goodsCategory' value='강아지미용'>강아지미용";
		output+="<input type='radio' name='goodsCategory' value='강아지용품'>강아지용품";
		output+="<input type='radio' name='goodsCategory' value='강아지장난감'>강아지장난감";
		$('#goodsCategory').html(output);
	});
});

$(document).ready(function(){
	$("input:radio[name=goodsAnimalKind]:radio[value=고양이]").change(function(){
		var output = "";
		output+="<input type='radio' name='goodsCategory' value='고양이간식'>고양이간식";
		output+="<input type='radio' name='goodsCategory' value='고양이사료'>고양이사료";	
		output+="<input type='radio' name='goodsCategory' value='고양이미용'>고양이미용";
		output+="<input type='radio' name='goodsCategory' value='고양이용품'>고양이용품";
		output+="<input type='radio' name='goodsCategory' value='고양이장난감'>고양이장난감";	
		$('#goodsCategory').html(output);
	});
});
</script>
</head>
<body>
<!--검색  -->
<form action="goodsSearch" method="get">
	검색어 : <input type="text" name="goodsSearch" /><input type="hidden" name="page">
	<input type="submit" value="검색">
</form>


<form action="goodsCategory" method="get">
	<table border='1'>
		<tr>
			<th>동물종류</th>
		</tr>
		<tr>
			<td>
				<input type="radio" name="goodsAnimalKind" value="강아지">강아지
				<input type="radio" name="goodsAnimalKind" value="고양이">고양이
			</td>
		</tr>
		<tr>
			<th>용품종류</th>
		</tr>
		<tr>
			<td id="goodsCategory">
			
			</td>
		<tr>
			<td colspan='2'><input type="submit" value="검색"></td>
		</tr>
	</table>
</form>
<a href="goodsDateOrder">최신순</a>&nbsp;&nbsp;<a href="goodsHitOrder">조회순</a>&nbsp;&nbsp;<a href="goodsLikeOrder">좋아요순</a><br/>

<c:forEach var="goods" items="${goodsList}">
	<div>	
		<button onclick="location.href='goodsView?goodsNum=${goods.goodsNum}&page=${paging.page}'">
		<img src="resources/goods/${goods.goodsImage1}" width="300px" height="300px"/>
		</button><br/>
        조회수${goods.goodsHit}  ♥${goods.goodsLike}<br>
		${goods.goodsName}<br/>${goods.goodsPrice}
	</div><br/>
</c:forEach>
<!-- 페이징 처리 -->
   <c:if test="${paging.page <= 1}">[이전]&nbsp;</c:if>
   <c:if test="${paging.page > 1}"><a href="goodsList?page=${paging.page-1}">[이전]</a>&nbsp;</c:if>
  	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" 
				var="i"	step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
				${i}
			</c:when>

			<c:otherwise>
				<a href="goodsList?page=${i}">${i}</a>
			</c:otherwise>

		</c:choose>
	</c:forEach>
   <c:if test="${paging.page >= paging.maxPage}">[다음]&nbsp;</c:if>
   <c:if test="${paging.page < paging.maxPage}"><a href="goodsList?page=${paging.page+1}">[다음]</a>&nbsp;</c:if>
   
   <!-- 페이징 처리 -->
</body>
</html>