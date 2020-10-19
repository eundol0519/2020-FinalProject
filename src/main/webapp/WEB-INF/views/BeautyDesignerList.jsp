<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>

//디자이너 정보 불러오기(ajax)
function designerInformation(code,index){
		$.ajax({
			type:"GET",
			url:"designerInformation",
			data:{
				"designerCode":code
				},
			dataType:"json",
			success:function(result){
				designerInformation1(result,index);
				},
			error:function(){
				alert("디자이너 정보가 없습니다.");
				}	
			});
}

//디자이너 정보
function designerInformation1(result,index){
		var output = "";
		output += "<table border='1' style='width='30%''>";
		output += "<tr><td rowspan='4'><img src='resources/fileUpload2/"+result.designerImage+"' width='100%'/></td></tr>";
		output += "<tr><th>디자이너 이름</th><td>"+result.designerName+"</td></tr>";
		output += "<tr><th>디자이너 휴무일</th><td>"+result.designerOff+"</td></tr>";
		output += "<tr><th>디자이너경력</th><td>"+result.designerCareer+"</td></tr>";
		output += "</table>";
		$('#designerInformation2'+index).html(output);
}

//로그인 후 이용
function LoginForm(){
	var con = confirm("로그인 후 이용해주세요.");
	if(con == true){
		location.href="memberLoginForm";
	}
}
</script>
</head>
<body>

<div style="float:left;">
   <table>
   		<c:forEach var="beauty" items="${beautyList}" varStatus="status">
   		<tr><td>
   		<img src="resources/fileUpload2/${beauty.designerImage}" width="30%" height="40%"/><br/>
   			디자이너${beauty.designerName}<br/>
   		<button onclick="designerInformation('${beauty.designerCode}',${status.index} )">디자이너 정보</button>
   		<div id="designerInformation2${status.index }"></div>
   		<c:choose>
   		<c:when test="${not empty sessionScope.loginUser.userId}">
   		<button onclick="window.open('beautyReservationForm?designerName=${beauty.designerName}&designerOff=${beauty.designerOff}&designerCode=${beauty.designerCode}','window팝업','width=500, height=700, menubar=no, status=no, toolbar=no');">예약하기</button>
   		</c:when>
   		<c:otherwise>
   		<button onclick="LoginForm()">예약하기</button>
   		</c:otherwise>
   		</c:choose>
   		</td></tr>
   		</c:forEach>
   </table>
</div>
</body>

</html>