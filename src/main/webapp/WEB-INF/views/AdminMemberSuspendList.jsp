<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정지 된 회원 리스트</title>
</head>
<body>
<div>
	<ul>
		<li><a href="hotelManagement">게시판 관리</a></li>
		<li><a href="reviewBoardList">리뷰 관리</a></li>
		<li><a href="adminMemberList">회원 관리</a></li>
		<li><a href="hotelReserveList">예약 및 결제 관리</a></li>
	</ul>
</div>
<div>
	<div style="width:30%; float:left;">
		<table>
			<tr><th><a href="adminMemberList">회원 목록</a></th></tr>
			<tr><th><a href="goAdminMemberReport">신고 내역</a></th></tr>
			<tr><th><a href="adminMemberSuspendList">정지 회원 목록</a></th></tr>
			<tr><th><a href="goAdminAskList">문의 내역</a></th></tr>
		</table>
	</div>
	<div style="width:50%; float:right;">
	<table>
		<tr>
			<th>회원 아이디</th>
			<th>회원 이름</th>
			<th>성별</th>
			<th>정지횟수</th>
			<th>정지기간</th>
		</tr>
		
		<c:forEach var="member" items="${suspendList}" varStatus="status">
			<tr>
				<td><a onclick="goMemberView(${status.index}, '${member.userId }')">${member.userId }</a></td>
				<td><a onclick="goMemberView(${status.index}, '${member.userId }')">${member.userName }</a></td>
				<td><a onclick="goMemberView(${status.index}, '${member.userId }')">${member.userGender }</a></td>
				<td><a onclick="goMemberView(${status.index}, '${member.userId }')">${member.userLockCount }</a></td>
				<td><a onclick="goMemberView(${status.index}, '${member.userId }')"> ~ ${member.userLock }</a></td>
			</tr>
		</c:forEach>
		
		<!-- window open을 post 방식으로 -->
		<script>
		function goMemberView(index, userId){
			var form=document.createElement("form");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "adminMemberView");
			form.setAttribute("target", "memberForm");
			
			
			var input = document.createElement('input');
			input.type="hidden";
			input.name="userId";
			input.value= userId;
			form.appendChild(input);
			
			document.body.appendChild(form);
			window.open("adminMemberView", "memberForm", "width=600, height=500");
		
			 form.submit();

		}
		</script>
	</table>	
	<!-- 페이징 구간 -->
	<div id="paging" style="text-align : center;">
		<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
		<c:if test="${paging.page>1 }">
			<a href="adminMemberSuspendList?page=${paging.page-1}">[이전]</a>&nbsp;
		</c:if> 
		<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page }">	
					[${i}]								
				</c:when>
				<c:otherwise>
					<a href="adminMemberSuspendList?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
		<c:if test="${paging.page<paging.maxPage}">
			&nbsp;<a href="adminMemberSuspendList?page=${paging.page+1}">[다음]</a>
		</c:if>
	</div>
	<!-- 페이징 구간 끝 -->
	</div>
</div>
</body>
</html>