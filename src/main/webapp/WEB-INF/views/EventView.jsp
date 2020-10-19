<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세정보</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>	
	
	//댓글목록
	function commentList(result){
		var output="";
		for(var i in result){
			output += "<table border='1'>";
			output += "<tr><td>"+result[i].commentUserId+"</td></tr>";
			//이미지가 있을 때만 이미지를 뜨게한다.
			if(result[i].commentImage != null){	
				output += "<tr><td><img src='resources/fileUpload/"+result[i].commentImage+"'width='20%'></td></tr>";
			}
			output += "<tr><td colspan='2'>"+result[i].commentContents+"</td></tr>";
			output += "<tr><td>"+result[i].commentLike+"♥</td>";
			output += "<td>"+result[i].commentDate+"</td></tr>";
			//로그인이 되어있어야지 좋아요 버튼을 누를수 있고 아니면 로그인을 하러간다.
			if(${sessionScope.loginUser.userId != null}){
				output += "<tr><td><button onclick='commentLike2("+result[i].commentNum+")'>♡</button></td></tr>";
			}else{
				output += "<tr><td><button onclick='LoginForm()'>♡</button></td></tr>";
			}
			//댓글을 단 아이디와 로그인 된 아이디가 같을 때만 수정과 삭제버튼을 누를수 있다.
			if(result[i].commentUserId == "${sessionScope.loginUser.userId}"){
			output += "<tr><td><button onclick='commentModify("+result[i].commentNum+","+i+")'>수정</button>";
			output += "<button onclick='commentDelete("+result[i].commentNum+")'>삭제</button></td></tr>";	
			}
			output += "</table><br/>";
			output += "<div id='commentModify1"+i+"'></div>";
		}
		$('#commentList1').html(output);
	}

	
	
	//댓글수정페이지(수정창)
	function commentModify(commentNum,i){
		var output="";
		output += "댓글<textarea rows='5' cols='30' id='commentContents1'></textarea>";
		output += "<button  onclick='commentModifyProcess("+commentNum+")'>수정</button>";
		$('#commentModify1'+i).html(output);
	}
	
	//댓글 좋아요
	function commentLike2(commentNum){
		$.ajax({
			type:"GET",
			url:"commentLike",
			data:{
				"commentNum":commentNum,
				"commentEventNum":${eventView.eventNum},
				"commentUserId":"${sessionScope.loginUser.userId}"
				},
			success : function(result){
				commentList(result);
				},
			error : function(){
				alert("좋아여 실패");
				}	
			});
		}

	
	//댓글 삭제
	function commentDelete(commentNum){
		$.ajax({
			type:"GET",
			url:"commentDelete",
			data:{
				"commentNum" : commentNum,
				"commentEventNum" : ${eventView.eventNum}
				},
			dataType:"json",

			success : function(result){
						alert("삭제되었습니다.");
						commentList(result);
			},
			error 	: function(){
						alert("댓글 삭제 실패");
			}

		});
	}
	//댓글조회
	$(document).ready(function(){
		$.ajax({
			type:"GET",
			url:"commentList",
			data:{
				"commentEventNum":${eventView.eventNum}
				},
			dataType:"json",
			
			success : function(result){
				commentList(result);
				},
			error : function(){
				alert("댓글 조회 실패");
				}
			});
			
	});
	
	//댓글 수정
		function commentModifyProcess(commentNum){
			var commentContents = $('#commentContents1').val();
			$.ajax({
				type:"GET",
				url:"commnetModifyProcess",
				data:{
					"commentContents":commentContents,
					"commentNum":commentNum,
					"commentEventNum":${eventView.eventNum}
					},
				dataType:"json",

				success : function(result){
					alert("수정되었습니다.");
					commentList(result);
				},
				erorr : function(){
					alert("댓글 수정 실패");
					} 
				});
			}

		 //댓글 작성
	$(document).ready(function(){
		$('#commentWrite').click(function(){
		var formData = new FormData($("#fileForm")[0]);
		 	$.ajax({
				  type:'post',
				  url:"commentWrite",
				  data:formData,  
				  processData: false, 
				  contentType: false, 
				  success: function(result){
					  		alert("댓글 작성되었습니다.");
					  		//댓글 초기화
					  		document.getElementById('commentContents').value ="";
							commentList(result);
					      },
				  error: function(){
							 alert("댓글 입력 실패");
					 	  }
			 });	
		});
	});	 



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
	<!-- 이벤트 상세정보  -->
	<table>
		<tr>
			<td colspan='2'><img src="resources/썸네일 + 상세내용/${eventView.eventImage}"></td>
		</tr>
		<tr>
			<td colspan='2'>${eventView.eventContents}</td>
		</tr>
		<tr>
			<td>${eventView.eventDate}</td>
			<td>${eventView.eventHit}</td>
		</tr>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser.userId}">
				<tr>	
					<td colspan='2'><button onclick="LoginForm()">쿠폰받기</button></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>	
					<td colspan='2'><button onclick="couponPayment()">쿠폰받기</button></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table><br />
	<button onclick="location.href='indexForm'">메인</button>
	<hr />
	
	<!-- 댓글작성창 -->
	<form id="fileForm" method="post" enctype="multipart/form-data">
		<h3>작성자${sessionScope.loginUser.userId}</h3>
		<input type="hidden" name="id" value="${sessionScope.loginUser.userId}">
		<input type="hidden" name="num" value="${eventView.eventNum}">
		<input type="file" id="commentImageFile" name="commentImageFile"><br/>
		댓글	<textarea rows="5" cols="20" id="commentContents" name="commentContents"></textarea>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser.userId}">
				<input type="button" value="입력" onclick="LoginForm()">	
			</c:when>
			<c:otherwise>
				<input type="button" value="입력" id="commentWrite">	
			</c:otherwise>
		</c:choose>
	</form>

	<hr />
	<!-- 댓글 리스트 -->
	<div id="commentList1"></div><br/>
<script>


//쿠폰지급
function couponPayment(){
	$.ajax({
		type:"GET",
		url:"eventCouponPayment",
		data:{
			"eventCouponCode":${eventView.eventCouponCode},
			"userId":"${sessionScope.loginUser.userId}"
			},
		dataType:"json",
		success:function(result){
			alert("쿠폰이 지급되었습니다.");
			},
		error:function(){
			alert("이미 지급된 쿠폰입니다.");
			}
		
		});

	}
</script>

</body>
</html>