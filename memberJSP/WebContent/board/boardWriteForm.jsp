<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>글쓰기</h3>
<form name="boardWriteForm" method="post" action="boardWrite.jsp">
	<table border="1">
<tr>
	<td align="center">제목</td>
				<td>
					<input type="text" id="subject" name="subject" size="48" placeholder="제목입력">
					<div id="subjectDiv" style=" color: red; font-size:8pt; font-weigth:bold;"></div>
				</td>

			</tr>
			<tr>
				<td align="center">내용</td>
				<td>
					<textarea id="content" name="content" cols="50" rows="15" placeholder="내용입력"></textarea>
					<div id="contentDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글작성" onclick="javascript:checkBoardWrite()">
					<input type="reset" value="다시작성"> 

				</td>
			</tr>
		</table>
	</form>
	<script> 
function checkBoardWrite(){
	if(document.boardWriteForm.subject.value == "")
		alert("글 제목을 입력 하세요");
	else if (document.boardWriteForm.content.value == "")
		alert("글 내용을 입력 하세요");
	else
		document.boardWriteForm.submit();
}
	</script>
</body>
</html>