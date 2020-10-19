<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
<script>
	// 댓글 목록
	function educationCommentList(result){
		var output="";
		output += "<table>";
		for(var i in result){
		output += "<tr><td>"+result[i].commentUserId+"</td></tr>";
		output +="<tr><td colspan='2'>"+result[i].commentContents+"</td></tr>";
		output += "<tr><td>"+result[i].commentLike+"♥</td>"
		output += "<td>"+result[i].commentDate+"</td></tr>";
		output += "<tr><td><button onclick='commentLike2("+result[i].commentNum+")'>♥</button></td></tr>";
		output += "<tr><td><button onclick='commentModify("+result[i].commentNum+")'>수정</button>";
		output += "<button onclick='commentDelete("+result[i].commentNum+")'>삭제</button></td></tr>";
		output += "<tr><td colspan='2'><div id='commentModify1'></div></td></tr>";
		
			}
		output += "</table>";
		$('#educationCommentList').html(output);
		}



	// 댓글 삭제
	function commentDelete(commentNum){
		$.ajax({
			type:"GET",
			url:"educationCommentDelete",
			data:{
				"commentNum" : commentNum,
				"commentEduNum" : ${educationView.eduNum}
				},
			dataType:"json",

			success : function(result){
				alert("삭제되었습니다.");
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 삭제 실패");
				}
			});
		}

	// 댓글 좋아요
	function commentLike2(commentNum){
		$.ajax({
			type:"GET",
			url:"educationCommentLike",
			data:{
				"commentNum":commentNum,
				"commentEduNum":${educationView.eduNum},
				"commentUserId":"${sessionScope.loginUser.userId}"
				},
			success : function(result){
				educationCommentList(result);
				},
			error : function(){
				alert("좋아요 실패");
				}
			});
		}

	// 뎃글조회
	$(document).ready(function(){
		var commentEduNum=${educationView.eduNum};
		$.ajax({
			type:"GET",
			url:"educationCommentList",
			data:{"commentEduNum":commentEduNum},
			dataType:"json",

			success : function(result){
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 조회 실패")
				}
			});
		});

	// 댓글 쓰기
	function educationComment(){
		var commentContents = document.getElementById("commentContents").value;
		$.ajax({
			type:'post',
			url:"educationComment",
			data:{
				"commentContents": commentContents,
				"commentEduNum" : ${educationView.eduNum},
				"commentUserId" : "${sessionScope.loginUser.userId}"
				},
			dataType:"json",
			success : function(result){
					alert("댓글 작성되었습니다.");
					educationCommentList(result);
			},
			error : function(){
					alert("댓글 입력 실패");
				}
			});
		}
	
	// 댓글 수정
	function educationCommentModify(commentNum){
		var commentContents = $('#commentContents1').val();
		$.ajax({
			type:"GET",
			url:"educationCommentModify",
			data:{
				"commentContents" : commentContents,
				"commentNum" : commentNum,
				"commentEduNum" : ${educationView.eduNum}
				},
			dataType:"json",

			success : function(result){
				alert("수정되었습니다.");
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 수정 실패");
				}
			});
		}

	// 댓글 수정페이지
	function commentModify(commentNum){
		var output="";
		output += "<div>";
		output += "댓글<textarea rows='5' cols='30' id='commentContents1'></textarea>";
		output += "<button onclick='educationCommentModify("+commentNum+")'>수정</button>";
		output += "</div>";
		$('#commentModify1').html(output);
		}
	
	
	// 좋아요수 조회
	$(document).ready(function(){
			$.ajax({
			type:"GET",
			url:"eduLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
				},
			dataType:"json",

			success : function(result){
				eduLike(result);
				},
			error : function(){
				alert("좋아요 조회 실패")
				}
			});
		});

	//좋아요수
	function eduLike(result){
		var output="";
		output += result.eduLike+"♥";		
	
			console.log(result.eduLike);
			console.log(result.likeUserId);
			if(result.likeUserId == "${sessionScope.loginUser.userId}"){
				output +="<button onclick='educationUnLike()'>♥</button>";
			}else{
				output +="<button onclick='educationLike()'>♡</button>";	
			}
	
		$('#eduLike').html(output);
		}
		
	// 교육 게시글 좋아요
	function educationLike(){
		$.ajax({
			type:"GET",
			url:"educationLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeEduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
			},
			dataType:"json",
			success : function(result){
				 eduLike(result);
				},
			error : function(){
				alert("좋아요 실패");
				}
				
			});
		};
	// 교육 게시글 좋아요 취소
	function educationUnLike(){
		$.ajax({
			type:"GET",
			url:"educationUnLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeEduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
				},
				dataType:"json",
				success : function(result){
					 eduLike(result);
					},
				error : function(){
					alert("좋아요 취소 실패");
					}
			});
		};

</script>
</head>
<body>
	<!-- 상세정보 -->
	<table>
		<tr>
			<th>${educationView.eduTitle}</th>
		</tr>
		<tr>
			<th>${educationView.eduVideo}</th>
		</tr>
		<tr>
			<th>${educationView.eduContents}</th>
		</tr>
		<tr>
			<th id="eduLike"></th>
		</tr>
	</table>
	
	<!-- 댓글작성 -->
		<h3>작성자${sessionScope.loginUser.userId}</h3>
		댓글 <textarea rows="5" cols="20" id="commentContents" name="commentContents"></textarea>
		<input type="button" value="입력" onclick="educationComment()">
	
	<br>
	<div id="educationCommentList">
	</div>
</body>

</html>