<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<style type="text/css">
body {
	margin: 0;
}

.main {
	width: 100%;
	height: 100%;
	z-index: 1;
}

.main::after {
	width: 100vw;
	height: 100vh;
	content: "";
	background-image: url('../image/background.jpeg');
	background-size: 100% 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.5;
}

@font-face {
	font-family: 'Typo_DecoSolidSlash';
	src: url('../font/Typo_DecoSolidSlash.ttf');
}

.index {
	margin-right: 100px;
	font-family: 'Typo_DecoSolidSlash';
	font-size: 100pt;
	text-align : right;
}

th {
	font-size: 23pt;
	color : #FFFFE0;
	text-align : center;
}

td {
	text-align : center;
}

table {
	font-family: 'Typo_DecoSolidSlash';
	font-size: 20pt;
	font-weight: bold;
}

#mainA:link {
	color: black;
	text-decoration: none;
}

#mainA:visited {
	color: black;
	text-decoration: none;
}

#mainA:hover {
	color: PINK;
	text-decoration: underline;
}

#mainA:active {
	color: black;
	text-decoration: none;
}
</style>
<body>
	<div class="main">
		<h1 align="center">
		<img src="../image/main.PNG"
		 style="width: 50px; height: 50px; cursor: pointer;"
		 onclick="location.href='../main/index.do'"> MVC를 이용한 게시판
		</h1>
		<hr>
		<div class="index">
		<c:if test="${sessionScope.memId == null}">
		<a id="mainA" href="../member/writeForm.do">회원가입</a><br>
		<a id="mainA" href="../member/loginForm.do">로그인</a><br>
		</c:if>
		<c:if test="${memId != null }">
		<a id="mainA" href="../member/logout.do">로그아웃</a><br> 
		<a id="mainA" href="../member/modifyForm.do">회원정보수정</a><br>
		<a id="mainA" href="../board/boardWriteForm.do">글쓰기</a><br>
		</c:if>
		<a id="mainA" href="../board/boardList.do?pg=1">글목록</a>
		</div>
		<br> <br>
	</div>	
</body>

<script type="text/javascript">
function login(id,seq) {
	if(id == "null") {
		alert("먼저 로그인 하세요.");
	}
	
}
</script>
</html>