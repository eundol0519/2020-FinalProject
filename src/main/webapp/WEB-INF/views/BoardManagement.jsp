<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<a href="/"><img src="" alt="로고" /></a>
	<a href="memberLogout">로그아웃</a>
	<br />
	<br />
	<br />
	<!-- 상단 메뉴 바 -->
	<ul>
		<li><a href="hotelManagement">게시판 관리</a></li>
		<li><a href="reviewBoardList">리뷰 관리</a></li>
		<li><a href="adminMemberList">회원 관리</a></li>
		<li><a href="hotelReserveList">예약 및 결제 관리</a></li>
	</ul>
	<br />
	<br />
	<!-- 왼쪽 메뉴 바 -->
<div style="width:30%; float:left;">
	<ul>
		<li><a href="hotelManagement">호텔</a></li>
		<li><a href="beautyManagement">미용</a></li>
		<li><a href="medicalManagement">병원</a></li>
		<li><a href="educationManagement">교육</a></li>
		<li><a href="goodsManagement">용품</a></li>
		<li><a href="eventManagement">이벤트</a></li>
	</ul>
</div>
	<!-- 오른쪽 메인 화면 -->
<div style="float:left;">
	<!-- 글작성 버튼 -->
	<c:choose>
		<c:when test="${management.get(0).kind eq '미용'}">
			<button onclick="location.href='goBeautyWrtieForm'">글작성</button>
		</c:when>
		<c:when test="${management.get(0).kind eq '병원'}">
			<button onclick="location.href='goMedicalWrtieForm'">글작성</button>
		</c:when>
		<c:when test="${management.get(0).kind eq '용품'}">
			<button onclick="location.href='goGoodsWrtieForm'">글작성</button>
		</c:when>
		<c:when test="${management.get(0).kind eq '이벤트'}">
			<button onclick="location.href='goEventWrtieForm'">글작성</button>
		</c:when>
		<c:when test="${management.get(0).kind eq '교육'}">
			<button onclick="location.href='goEducationWrtieForm'">글작성</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='goHotelWrtieForm'">글작성</button>
		</c:otherwise>
	</c:choose>
	<table>
		<c:choose>
			<c:when test="${management.get(0).kind eq '미용'}">
				<tr>
					<th>디자이너 코드</th>
					<th>디자이너 이름</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.designerCode }</td>
						<td><a href="beautyBoardView?designerCode=${management.designerCode }">${management.designerName }</a></td>
						<td><a href="beautyBoardModify?designerCode=${management.designerCode }">수정</a></td>
						<td><a href="beautyBoardDelete?designerCode=${management.designerCode }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${management.get(0).kind eq '병원'}">
				<tr>
					<th>의사 코드</th>
					<th>의사 이름</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.doctorCode }</td>
						<td><a href="medicalBoardView?doctorCode=${management.doctorCode }">${management.doctorName }</a></td>
						<td><a href="medicalBoardModify?doctorCode=${management.doctorCode }">수정</a></td>
						<td><a href="medicalBoardDelete?doctorCode=${management.doctorCode }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${management.get(0).kind eq '용품'}">
				<tr>
					<th>용품 번호</th>
					<th>용품 이름</th>
					<th>재고</th><th colspan="2"></th>
				
					</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.goodsNum }</td>
						<td><a href="goodsBoardView?goodsNum=${management.goodsNum }">${management.goodsName}</a></td>
						<td>${management.goodsStock}</td>
						<td><a href="goodsBoardModify?goodsNum=${management.goodsNum }">수정</a></td>
						<td><a href="goodsBoardDelete?goodsNum=${management.goodsNum }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${management.get(0).kind eq '이벤트'}">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>조회수</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.eventNum }</td>
						<td><a href="eventBoardView?eventNum=${management.eventNum }">
								<img src="resources/eventFile/${management.eventTitleImage }" alt="이벤트 제목 사진" />
							</a></td>
						<td>${management.eventHit}</td>
						<td><a href="eventBoardModify?eventNum=${management.eventNum }">수정</a></td>
						<td><a href="eventBoardDelete?eventNum=${management.eventNum }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${management.get(0).kind eq '교육'}">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>조회수</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.eduNum }</td>
						<td><a href="educationBoardView?eduNum=${management.eduNum }">${management.eduTitle }</a></td>
						<td>${management.eduHit}</td>
						<td><a href="educationBoardModify?eduNum=${management.eduNum }">수정</a></td>
						<td><a href="educationBoardDelete?eduNum=${management.eduNum }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<th>방코드</th>
					<th>방이름</th>
					<th>방크기</th>
					<th colspan="2"></th>
				</tr>
				<c:forEach var="management" items="${management}">
					<tr>
						<td>${management.hotelCode }</td>
						<td><a href="hotelBoardView?hotelCode=${management.hotelCode }">${management.hotelRoomName}</a></td>
						<td>${management.hotelSize }</td>
						<td><a href="hotelBoardModify?hotelCode=${management.hotelCode }">수정</a></td>
						<td><a href="hotelBoardDelete?hotelCode=${management.hotelCode }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<c:if test="${management.get(0).kind eq '용품'}">
		<!-- 페이징 구간 -->
		<div id="paging" style="text-align : center;">
			<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
			<c:if test="${paging.page>1 }">
				<a href="goodsManagement?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:if> 
			<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
				<c:choose>
					<c:when test="${i eq paging.page }">	
						[${i}]								
					</c:when>
					<c:otherwise>
						<a href="goodsManagement?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach> 
			<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
			<c:if test="${paging.page<paging.maxPage}">
				&nbsp;<a href="goodsManagement?page=${paging.page+1}">[다음]</a>
			</c:if>
		</div>
		<!-- 페이징 구간 끝 -->
	</c:if>
</div>
</body>
</html>