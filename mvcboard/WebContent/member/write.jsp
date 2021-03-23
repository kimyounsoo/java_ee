<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.bean.MemberDTO, member.dao.MemberDAO" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<c:if test="${requestScope.su == 1 }">
	회원가입 성공!!<br><br>
	<input type="button" value="로그인" onclick="location.href='/mvcmember/member/loginForm.do'">
</c:if>
<c:if test="${requestScope.su == 0 }">
회원가입 실패.........
</c:if>
</body>



</html>
