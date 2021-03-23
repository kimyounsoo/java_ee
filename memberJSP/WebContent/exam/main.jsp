<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 이건 합쳐서 한꺼번에 컴파일러 하고 -->
<!-- 그래서 이건 변수명이 중복되면 에러 정적이다  -->
<h3>** include directive **</h3>
<%@ include file="today.jsp" %>

<!-- 이건 컴파일러를 각자 하고 나서 합친다 아래것을 선호한다 -->
<!-- 그래서 변수가 중복되도 따로 관리되어서 동적이다 -->
<h3>** include JSP tag **</h3>
<jsp:include page="image.jsp"></jsp:include>

<%
String name = "홍길동";
%>

main.jsp name = <%=name %>

<h3>** 3초뒤에 페이지 이동 **</h3>
<% response.setHeader("Refresh", "3;url=input.jsp"); %>
</body>
</html>