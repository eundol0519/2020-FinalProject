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

//닥터 정보 불러오기(ajax)
function doctorInformation(code, index){
		$.ajax({
			type:"GET",
			url:"doctorInformation",
			data:{
				"doctorCode":code
				},
			dataType:"json",
			success:function(result){
				doctorInformation1(result, index);
				},
			error:function(){
				alert("의사 정보가 없습니다.");
				}	
			});
}

//닥터 정보
function doctorInformation1(result, index){
		var output = "";
		output += "<table border='1' style='width='30%''>";
		output += "<tr><td rowspan='5'><img src='resources/fileUpload2/"+result.doctorImage+"' width='100%'/></td></tr>";
		output += "<tr><th>이름</th><td>"+result.doctorName+"</td></tr>";
		output += "<tr><th>전문분야</th><td>"+result.doctorSubject+"</td></tr>";
		output += "<tr><th>휴무일</th><td>"+result.doctorOff+"</td></tr>";
		output += "<tr><th>경력</th><td>"+result.doctorCareer+"</td></tr>";
		output += "</table>";
		
		$('#doctorInformation2'+index).html(output);
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
   		<c:forEach var="medicalList" items="${medicalList}"  varStatus="status">
   		<tr><td>
   		<img src="resources/fileUpload2/${medicalList.doctorImage}" width="30%" height="40%"/><br/>
   		 닥터&nbsp;${medicalList.doctorName}<br/>
   		<button onclick="doctorInformation('${medicalList.doctorCode}',${status.index})">정보</button>
   		<div id="doctorInformation2${status.index }"></div>
   		<c:choose>
   		<c:when test="${not empty sessionScope.loginUser.userId}">
   		<button onclick="window.open('medicalReservation?doctorName=${medicalList.doctorName}&designerOff=${medicalList.doctorOff}&doctorCode=${medicalList.doctorCode}&doctorSubject=${medicalList.doctorSubject}','병원예약','width=500, height=700, menubar=no, status=no, toolbar=no');">예약하기</button>
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