<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
</head>
<body onload="init();">
<script>
// 문의 목록
function goodsAskList(result){
	var output="";

		output +="<table>";
		output +="<tr>";
		output +="<td>번호</td>";
		output +="<td colspan='1'>내용</td>";
		output +="<td>공개여부</td>";
		output +="<td>작성자</td>";
		output +="<td>답변확인</td>";
		output +="</tr>";
		for(var i in result) {
			if(result[i].askSecret=="일반글"){
			output +="<tr>";
			output +="<td>"+result[i].askNum+"</td>";
			output +="<td>"+result[i].askContents+"</td>";
			output +="<td>"+result[i].askSecret+"</td>";
			output +="<td>"+result[i].askUserId+"</td>";
				if(result[i].askAnswer==null){
				output += "<td>답변을 기다리는 중입니다.</td>";	
				}else{
				output += "<td>"+result[i].askAnswer+"</td>";
				}
			}else{
				output +="<tr>";
				output +="<td>"+result[i].askNum+"</td>";
				output +="<td id='secret'>비밀글 입니다<a onclick='secret("+result[i].askPw+")'>&#128274;</a><td>";
				output +="<td>"+result[i].askSecret+"</td>";
				output +="<td>"+result[i].askUserId+"</td>";
					if(result[i].askAnswer==null){
					output += "<td>답변을 기다리는 중입니다.</td>";	
					}else{
					output += "<td>"+result[i].askAnswer+"</td>";
					}
				output +="</tr>";
				output += "<div id='goodsAskList2'></div>";
			}
		}
		output +="</table>";
		$('#goodsAskList').html(output);
	}
	
//비밀번호 확인
function secret(data){
	console.log(data);
	var output="";
	output += "<input type='password' name='Pw' id='Pw' placeholder='문의글비밀번호'><button onclick='secret2("+data+")'>확인</button>";
	$('#goodsAskList2').html(output);
}

//비밀번호 확인(ajax)
function secret2(data){
	var pw = document.getElementById('Pw').value;
	var confirmPw = data;
		if(confirmPw == pw){
			$.ajax({
				type:"GET",
				url: "goodsAskSecret",
				data:{
					"askPw" : pw,
					"askGoodsNum":${goodsView.goodsNum},
					"askUserId":"${sessionScope.loginUser.userId}"
					},
				dataType:"html",
				success : function(result){
					confirm(result);
					console.log(result+"ttttt");
					},
				error : function(){
					alert("문의글 조회 실패");
					}
			});	
		}else{
			alert('비밀번호가 틀렸습니다');
			var output="";
			output += "";
			$('#goodsAskList2').html(output);
			}
		
}
//비밀글 
function confirm(result){
	document.getElementById('secret').innerHTML = "<td>"+result+"</td>";
}


// 문의 조회
$(document).ready(function(){
	var askGoodsNum=${goodsView.goodsNum}
	$.ajax({
		type:"GET",
		url: "goodsAskList",
		data:{"askGoodsNum":askGoodsNum},
		dataType:"json",

		success : function(result){
			goodsAskList(result);
			},
		error : function(){
			alert("문의글 조회 실패")
			}
		});	
	});

// 좋아요 수 조회
$(document).ready(function(){
	$.ajax({
	type:"GET",
	url:"goodsLike",
	data:{
		"goodsNum":${goodsView.goodsNum},
		"likeUserId":"${sessionScope.loginUser.userId}"
		},
		dataType:"json",

		success : function(result){
			goodsLike(result);
			},
		error : function(){
			alert("좋아요 조회 실패");
			}	
		});
});
//용품 좋아요 수
function goodsLike(result){
var output="";
output += result.goodsLike+"♥";

	if(result.likeUserId == "${sessionScope.loginUser.userId}"){
		output +="<button onclick='goodsUnLike()'>♥</button>";
	}else{
		output +="<button onclick='goodssLike()'>♡</button>";	
			}
	$('#goodsLike').html(output);
	}
// 용품 좋아요
function goodssLike(){
	$.ajax({
		type:"GET",
		url:"goodssLike",
		data:{
			"goodsNum":${goodsView.goodsNum},
			"likeGoodsNum":${goodsView.goodsNum},
			"likeUserId":"${sessionScope.loginUser.userId}"
		},
		dataType:"json",
		success : function(result){
			goodsLike(result);
			},
		error : function(){
			alert("좋아요 실패");
			}	
		});
	};

 // 용픔 좋아요 취소
 function goodsUnLike(){
	$.ajax({
		type:"GET",
		url:"goodsUnLike",
		data:{
			"goodsNum":${goodsView.goodsNum},
			"likeGoodsNum":${goodsView.goodsNum},
			"likeUserId":"${sessionScope.loginUser.userId}"
			},
		dataType:"json",
		success : function(result){
			goodsLike(result);
			},
		error : function(){
			alert("좋아요 취소 실패");
			}
		});
	 };


var goodsPrices;
var buyCount;
var buyPrice;

function init() {
	goodsPrices = document.form.goodsPrices.value;
	buyCount = document.form.buyCount.value;
	document.form.buyPrice.value = goodsPrices;
	change();
}

function add () {
	hm = document.form.buyCount;
	buyPrice = document.form.buyPrice;
	hm.value ++ ;

	buyPrice.value = parseInt(hm.value) * goodsPrices;
}

function del () {
	hm = document.form.buyCount;
	sum = document.form.buyPrice;
		if (hm.value > 1) {
			hm.value -- ;
			buyPrice.value = parseInt(hm.value) * goodsPrices;
		}
}

function change () {
	hm = document.form.buyCount;
	sum = document.form.buyPrice;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * ${goodsView.goodsPrice};
}  
//장바구니
function goodBasket(){
var basketGoodsCount=document.getElementById('buyCount').value;
$.ajax({
	type:"get",
	url:"goodsBasket",
	data:{
		goodsNum:${goodsView.goodsNum},
		buyUserId:"${sessionScope.loginUser.userId}",
		basketGoodsCount:basketGoodsCount	
		},
	success:function(){
			alert("장바구니에 담겼습니다.");
		},
	error:function(){
			alert("장바구니 담기 실패");
		}
});
}
</script>
<table>
	<tr>
		<td>${goodsView.goodsName}</td>
		
		</tr>
</table>

<table>	
	<tr>
	<td>작성자${sessionScope.loginUser.userId}</td>
		<td><img src="resources/fileUpload/${goodsView.goodsImage1}" width="200px" height="200px"/><td>
	</tr>
</table>
<table>
<tr>
	<td>판매가 :${goodsView.goodsPrice}</td>
	<td>배송방법 : 택배</td>
	<td>배송비 : 2500원</td>
</tr>
</table>
<table>
	<tr>
		<th id="goodsLike"></th>
	</tr>
</table>
<form name="form" method="get" action="goodsPayMent">
수량 
<input type="hidden" name="goodsNum" value="${goodsView.goodsNum}">
<input type="button" value=" - " onclick="del();">
<input type=hidden name="goodsPrices" value="${goodsView.goodsPrice}"id="goodsPrices">
<input type="text" id="buyCount" name="buyCount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();"><br>

총 상품금액: <input type="text" id="PayMent" name="buyPrice" size="11"readonly>원

<input type="submit" value="결제" >
</form>
<button onclick="goodBasket()">장바구니</button>
<hr>
상세보기
<img src="resources/goods/${goodsView.goodsContents}" >
<hr>
문의하기
<button onclick="window.open('goodsAsk?askUserId=${sessionScope.loginUser.userId}&askGoodsNum=${goodsView.goodsNum}&goodsImage1=${goodsView.goodsImage1}','window팝업','width=500, height=600,menubar=no,status=no, toolbar=no');">문의하기</button>
<!--문의글 리스트  -->
<div id="goodsAskList"></div>


</body>
</html>