<%@page import="member.dao.MemberDAO, member.bean.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
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
  background-image: url('../image/수정.jpg');
  background-size: 100% 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.4;
}

@font-face {
	font-family: 'Typo_DecoSolidSlash';
	src: url('../font/Typo_DecoSolidSlash.ttf');
}

table {
margin : 100px auto;
font-family : 'Typo_DecoSolidSlash';
font-size : 30pt;
font-weight: bold;
}

</style>
<body onload="check('${requestScope.gender}','${requestScope.email2 }','${requestScope.tel1 }')">
<form id= "modifyForm" name = "modifyForm" method="post" action="/mvcboard/member/modify.do">
<div class="main">
<h3 align="center"><img src='../image/main.PNG' onclick="location.href='../main/index.jsp'" style="width:50px; height:50px; cursor:pointer;"></h3>
<hr>
<table border="1" cellpadding="5" cellspacing="0">
<tr>
<td align="center">이름</td>
<td>
<input type="text" name="name" id="name" value='${requestScope.name }'>
<div id="nameDiv" style="color: red; font-size: 20pt; font-weight: bold"></div>
</td>
</tr>

<tr>
<td align="center">아이디</td>
<td><input type="text" name="id" id="id" size="25" value='${requestScope.id }' readonly>
</td>
</tr>

<tr>
<td align="center">비밀번호</td>
<td><input type="password" size="30" name="pwd"></td>
</tr>

<tr>
<td align="center">재확인</td>
<td><input type="password" size="30"name="pwd2"></td>
</tr>

<tr>
<td align="center">성별</td>
<td>
<input type="radio" name="gender" value="0">남자
<input type="radio" name="gender" value="1">여자
</td>
</tr>

<tr>
<td align="center">이메일</td>
<td><input type="text" name="email1" size="15" value="${requestScope.email1 }"> @ 
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
<td><select name="tel1">
<option value="010">010</option>
<option value="011">011</option>
<option value="019">019</option>
<option value="017">017</option>
<option value="070">070</option>
</select>
-
<input type="text" name="tel2" size="5" value="${requestScope.tel2 }">
-
<input type="text" name="tel3" size="5" value="${requestScope.tel3 }">
</td>
</tr>

<tr>
<td align="center">주소</td>
<td>
	<input type="text" id="postcode" name="zipcode" size="5" value="${requestScope.zipcode }" readonly> 
	<input type="button" value="우편번호검색" onclick="checkPost()">
	<br>
	<input type="text" id="address" name="addr1" placeholder="주소" size="60" value="${requestScope.addr1 }" readonly>
	<br>
	<input type="text" id="detailAddress" name="addr2" placeholder="상세주소" size="60" value="${requestScope.addr2 }"></td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="button" value="정보수정" onclick="checkModify()">
<input type="reset" value="다시작성">
</td>
</tr>
</table>
</div>
</form>
</body>
<script type="text/javascript">
function checkPost(){
	window.open("checkPost.do","ggg","width=700 height=500 scrollbars=yes");
}

function checkModify(){
	if(document.getElementById("name").value == "") {
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	}
	else if(document.modifyForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
	else if(document.modifyForm.pwd.value != document.modifyForm.pwd2.value) 
		alert("비밀번호가 맞지 않습니다");
	else{
		document.modifyForm.submit();
	}
}

function check(gender, email2, tel1) {
	document.modifyForm.gender[gender].checked = true;
	document.modifyForm.email2.value = email2;
	document.modifyForm.tel1.value = tel1;
}
</script>
</html>