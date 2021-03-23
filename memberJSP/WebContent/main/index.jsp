<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>*** 메인화면 ***</h3>
<hr>
<!--세션(memId) 없다면  -->
<%if(session.getAttribute("memId") == null){ %>
	<a href="../member/writeForm.jsp">회원가입</a><br>
	<a href="../member/loginForm.jsp">로그인</a><br>
<!--세션(memId) 있다면  -->
<%}else{ %>
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../member/modicyForm.jsp">회원정보수정</a><br>
	<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
<!-- 깍두기 -->
<%} %>
<a href="../board/boardList.jsp?pg=1">목록</a><br>
</body>
</html>