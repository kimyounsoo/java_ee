<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style type="text/css">

.main {
	width: 100%;
  	height: 100%;
  	z-index: 1;
  
}


.main::after {
  width: 100vw;
  height: 100vh;
  content: "";
  background-image: url('../image/join2.jpeg');
  background-size: 100% 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.3;
}

body {
	margin: 0;
}

input[type=button] {
	font-family: 'Typo_DecoSolidSlash'; 
	font-size: 20pt;
	font-weight: bold;
	
}

input[type=reset] {
	font-family: 'Typo_DecoSolidSlash'; 
	font-size: 20pt;
	font-weight: bold;
	
}

input[type=text] {
text-align: left;
border: none;
background: transparent;
font-size : 20pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;
border:1px solid black;
}

input[type=password] {
text-align: left;
border: none;
background: transparent;
font-size : 20pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;
border:1px solid black;
}

input[type=email] {
text-align: left;
border: none;
background: transparent;
font-size : 20pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;
border:1px solid black;
}

input:focus {
outline:none;
}


@font-face
{
	font-family: 'Typo_DecoSolidSlash'; 
	src : url('../font/Typo_DecoSolidSlash.ttf');
}

.left{
	text-align : left;
	height : 0px;
}

table {
	margin : 100px auto;
	font-weight : bold;
	font-family : 'Typo_DecoSolidSlash';
}

td {
	width:100px;
	height:30px;
	font-size : 25pt;
}

.writeFormDIV {
	text-align: center;
	font-weight: bold;
}




</style>
<body>
<form name = "writeForm" method="post" action="/mvcmember/member/write.do">
<div class = "main">
<h3 align="center"><img src='../image/main.PNG' onclick="location.href='../main/index.jsp'" style="width:50px; height:50px; cursor:pointer;"></h3>
<hr>
<div class="writeFormDIV" style= "height:0px; font-size:30pt; font-family:'Typo_DecoSolidSlash';">
<br>
[회원가입]
</div>
<table border="1" cellpadding="5" cellspacing="0">
<tr>
<td align="center">이름</td>
<td>
<input type="text" name="name" id="name" placeholder="이름입력">
<div id="nameDiv" style="color: red; font-size: 18pt; font-weight: bold"></div>
</td>
</tr>

<tr>
<td align="center">아이디</td>
<td><input type="text" name="id" id="id" placeholder="아이디입력" onkeydown = "inputIdcheck()">
	<input type="button" value="중복체크" onclick="checkId()">
	<input type="hidden" id="checked" value="idUncheck"> 
	
	
<div id="idDiv" style="color: red; font-size: 18pt; font-weight: bold"></div>
</td>
</tr>

<tr>
<td align="center">비밀번호</td>
<td><input type="password" name="pwd" size="30"></td>
</tr>

<tr>
<td align="center">재확인</td>
<td><input type="password" name="pwd2" size="30"></td>
</tr>

<tr>
<td align="center">성별</td>
<td align="center"><input type="radio" name="gender" value="0">남자
&emsp;&emsp;&emsp;&emsp;
	<input type="radio" name="gender" value="1">여자
</td>
</tr>

<tr>
<td align="center">이메일</td>
<td align="center"><input type="text" name="email1" size="15"> @ 
<input type="email" name="email2" list="email2" placeholder="직접입력">
<datalist id="email2">
	<option value="gmail.com"></option>
	<option value="naver.com"></option>
	<option value="hanmail.net"></option>
</datalist>
</td>
</tr>

<tr>
<td align="center">핸드폰</td>
<td align="center"><select name="tel1">
<option value="010">010</option>
<option value="011">011</option>
<option value="019">019</option>
<option value="017">017</option>
<option value="070">070</option>
</select>
-
<input type="text" name="tel2" size="5">
-
<input type="text" name="tel3" size="5">
</td>
</tr>

<tr>
<td align="center">주소</td>
<td>
<div class="left">
	<input type="text" id="postcode" name="zipcode" size="5" readonly> 
	<input type="button" class="button" value="우편번호검색" onclick="checkPost()">
</div>
	<br>
	<input type="text" id="address" name="addr1" placeholder="주소" size="60" readonly>
	<br>
	<input type="text" id="detailAddress" name="addr2" placeholder="상세주소" size="60"></td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="button" class="button" value="회원가입" onclick="checkWrite()">
<input type="reset" class="button" value="다시작성">
</td>
</tr>
</table>
</div>
</form>
<script>
function checkWrite(){
	//alert("dsfk")
	//console.log("askjfaksjfaksd")
	
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	
	//if(document.writeForm.name.value=="")
	if(document.getElementById("name").value == "")
		//alert("이름을 입력하세요");
		document.getElementById("nameDiv").innerText = "이름을 입력하세요.";
	//else if(document.writeForm.id.value=="") 
	else if(document.getElementById("id").value=="")
		//alert("아이디를 입력하세요");
		document.getElementById("idDiv").innerText = "아이디를 입력하세요.";
	else if(document.writeForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
	else if(document.writeForm.pwd.value != document.writeForm.pwd2.value) 
		alert("비밀번호가 맞지 않습니다");
	else if(document.getElementById("checked").value == "idUncheck")
		alert("중복체크 하셔야 되요.....");
	else
		document.writeForm.submit();
}


function checkPost(){
	window.open("checkPost.do","checkPost","width=700 height=500 scrollbars=yes");
}

function checkId(){//아이디 중복체크 화면 창 띄우기
	
	let id = document.getElementById("id").value;
	
	if(document.getElementById("id").value == ""){
		document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요.";
	}
	else if(document.getElementById("checked").value == "idcheck")
		alert("중복체크 확인됐음.")
	else 
		window.open("/mvcboard/member/checkId.do?id="+id,"checkId","width=350 height=100");
		
}

var name = document.getElementById('name');
name.onkeydown=function(event) {
	document.getElementById("nameDiv").innerText = "";
}

function inputIdcheck(){
	document.getElementById("checked").value = "idUncheck";
}

</script>


</body>
</html>