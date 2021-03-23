<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="" style="width: 130px; height: 80px; cursor: pointer;" 
onclick="location.href='../main/index.jsp'">
${sessionScope.memName }님 로그인<br><br>

<input type="button" value="로그아웃" onclick="location.href='/mvcmember/member/logout.do'">
<input type="button" value="회원정보수정" onclick="location.href='modifyForm.do'">
</body>
</html>