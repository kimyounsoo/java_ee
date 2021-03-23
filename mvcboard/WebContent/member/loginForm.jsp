<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<style type="text/css">
.main {
	width: 100%;
  	height: 100%;
	text-align: center;
  	z-index: 1;
  	
  
}


.main::after {
  width: 100vw;
  height: 100vh;
  content: "";
  background-image: url('../image/login.png');
  background-size: 100% 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.4;
}

@font-face
{
	font-family: 'Typo_DecoSolidSlash'; 
	src : url('../font/Typo_DecoSolidSlash.ttf');
}


table {
	text-align : center;
	font-weight : bold;
	font-family : 'Typo_DecoSolidSlash';
	font-size : 30pt;
	margin : 100px auto;
	
}

.loginDiv {
	text-align : center;
	font-weight: bold;
	height : 50px;
}

/*텍스트 눌렀을때 아웃라인 없애는 것*/
input:focus {
outline:none;
}

input[type=text] {
text-align:left; 
display:block;
margin: 0 auto; 
border: none; 
background: transparent;
font-size : 24pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;

}

input[type=password] {
text-align:left;
display:block; 
margin: 0 auto; 
border: none;
background: transparent;
font-size : 24pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;

}

input[type=button] {
	border : 1px solid black;
	font-family :'Typo_DecoSolidSlash';
	font-size : 30pt; 
	font-weight : bold;
}





</style>
<body>
<div class="main">
<form name = "loginForm" method="post" action="/mvcboard/member/login.do">
<h3 align="center"><img src="../image/main.PNG" style="width:50px; height:50px; cursor: pointer;" onclick= "location.href='../main/index.jsp'">
</h3>
<hr>
<div class="loginDiv" align="center" style="font-size : 50pt; font-family : 'Typo_DecoSolidSlash'">
<br>
[login]
</div>
<table border="1" cellpadding="5" cellspacing="0" height="300">
<tr>
<td>아이디</td>
<td width="300px"><input type="text" name="id" id="loginid" size="30"></td>
</tr>

<tr>
<td>비밀번호</td>
<td><input type="password" name="pwd" id="loginpwd" size="30"></td>
</tr>

<tr>
<td colspan="2" align="center">
	<input type="button" value="로그인" onclick="javascript:login()">
	<input type="button" value="회원가입" onclick="location.href='/mvcboard/member/writeForm.do'">
</td>
</tr>
</table>
</form>
</div>
</body>

<script type="text/javascript">
function login(){
	if(document.getElementById("loginid").value=="")
		alert("아이디를 입력하세요");
		
	else if(document.loginForm.loginpwd.value=="") 
		alert("비밀번호를 입력하세요");
		
	else
		document.loginForm.submit();
}
</script>
</html>