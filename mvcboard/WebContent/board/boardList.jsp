<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
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
  background-image: url('../image/찰리.png');
  background-size: 100% 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.3;
}

@font-face {
	font-family: 'Typo_DecoSolidSlash';
	src: url('../font/Typo_DecoSolidSlash.ttf');
}

.paging {
	font-family: 'Typo_DecoSolidSlash';
	font-size: 30pt;
	position: relative;
	bottom: 200px;
}

body {
	margin: 0;
}

table {
	margin : 200px auto;
	font-family: 'Typo_DecoSolidSlash';
	font-weight: bold;
}

th {
	font-size: 35pt;
	color : #FF6666;
}

td {
	font-size : 30pt;
}

#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;} 
#subjectA:hover {color: green; text-decoration: underline;} 
#subjectA:active {color: black; text-decoration: none;}

#currentPaging {
	color: blue;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
</head>
<body>
<form name="boardListForm">
<div class="main">
<h3 align="center"><img src='../image/main.PNG' onclick="location.href='../main/index.do'" style="width:50px; height:50px; cursor:pointer;"></h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
<c:if test="${list != null }">
<tr>
	<th width = "180">글번호</th> <!-- 테이블 헤더 / 가운데, 굵게 -->
	<th width="500">제목</th>
	<th width = "180">작성자</th>
	<th width = "100">조회수</th>
	<th width = "180">작성일</th>
</tr>

<c:forEach var="boardDTO" items="${list }"> 
	<tr>
	<td align="center">${boardDTO.seq }</td>
	<td>
		<c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
			&emsp;
		</c:forEach>
		<c:if test="${boardDTO.pseq != 0 }">
			<img src="../image/reply.gif">
		</c:if>
		<a id="subjectA" href="#" onclick="isLogin('${memId }', ${boardDTO.seq }, ${pg })">
			${boardDTO.subject }
		</a>
	</td>
	<td align="center">${boardDTO.id }</td>
	<td align="center">${boardDTO.hit }</td>
	<td align="center">${boardDTO.logtime }</td>
	</tr>
</c:forEach>
</c:if>
</table>

<div class="paging" align="center">${boardPaging.pagingHTML }</div>
</div>
</form>
</body>

<script type="text/javascript">
function isLogin(id, seq, pg) {
	if(id == ""){
		alert("먼저 로그인하세요");
		location.href="../member/loginForm.do"
	}
	else {
		location.href="/mvcboard/board/boardView.do?seq="+seq+"&pg="+pg;
	}
	
}

function boardPaging(pg){
	location.href="boardList.do?pg="+pg;
}
</script>
</html>














