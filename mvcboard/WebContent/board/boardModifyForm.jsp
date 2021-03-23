<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
  background-image: url('../image/board.png');
  background-size: 100% 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.6;
}

@font-face {
	font-family: 'Typo_DecoSolidSlash';
	src: url('../font/Typo_DecoSolidSlash.ttf');
}


table {font-size: 15pt;
		font-weight: bold;
		margin : 100px auto;
		}
		
		
input[type=text] {
text-align: left;
border: none;
background: transparent;
font-size : 20pt; 
font-family:'Typo_DecoSolidSlash';
font-weight:bold;

}

input:focus {
outline:none;
}

textArea:focus {
outline:none;
}



</style>
<body>
<form name="boardModifyForm" method="post" action="boardModify.do">

<input type = "hidden" name="seq" value="${boardDTO.seq }">
<input type = "hidden" name="pg" value="${pg }">

<div class="main">
<h3 align="center"><img src="../image/main.PNG" style="width: 50px; height: 50px; cursor: pointer;" onclick="location.href='../main/index.jsp'"></h3>
<hr>
<table border="1">
<tr>
<td align="center" width="60px">제   목</td>
 <td>
  <input size = "100" type="text" name="subject" id="subject" value='${boardDTO.subject }' placeholder="제목을 입력하세요" style="width:1000px; height:25px">
<div id="subjectDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</tr>
<tr>
<td align="center">내   용</td>
<td>
<textArea name="content" id="content" placeholder="내용을 입력하세요" rows="30" cols="100" style="width:1000px; height:480px; border:none; background: transparent; font-size:17pt; font-weight: bold; font-family: 'Typo_DecoSolidSlash'">${boardDTO.content }</textArea>
<div id="contentDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</td>
</tr>
<tr>
<td align="center" colspan="2">
<input type="button" value="글쓰기" style= "font-family: 'Typo_DecoSolidSlash'; font-size:30px; font-weight: bold;" onclick="checkBoardModify()">
<input type="reset" value="다시작성" style= "font-family: 'Typo_DecoSolidSlash'; font-size:30px; font-weight: bold;"></td>
</tr>
</table>
</div>
</form>
</body>

<script type="text/javascript">
function checkBoardModify() {
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";
	
	if(document.getElementById("subject").value == "") {
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
	}
	else if(document.getElementById("content").value == ""){
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
	}
	else{
		document.boardModifyForm.submit();
	}
		
}



</script>
</html>