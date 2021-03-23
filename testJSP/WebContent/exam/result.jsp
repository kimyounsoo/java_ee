<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이터
int x = Integer.parseInt(request.getParameter("x"));
int y = Integer.parseInt(request.getParameter("y"));
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=x %> + <%=y %> = <%=x+y %><br>
<%=x %> - <%=y %> = <%=x-y %><br>
<%=x %> * <%=y %> = <%=x*y %><br>
<%=x %> / <%=y %> = <%=(double)x/y %><br>

<input type ="button" value="뒤로" onclick="location.href='input.jsp'"> <!-- 뒤로가기 버튼 누르면 input.jsp 로 가라-->
<input type ="button" value="뒤로" onclick="histroy.back()"> <!-- 뒤로가기의 세가지 방법 -->
<input type ="button" value="뒤로" onclick="history.go(-1)">
</body>
</html>