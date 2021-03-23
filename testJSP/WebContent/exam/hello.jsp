<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//전역변수-1번 처리 서블릿의  init 메소드처럼 한번만 실행
String name = "홍길동";
int age = 25;
%>
<%
//지역변수, 요청시 마다 처리
age++;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hollo  JSP!!<br> --> <!-- html 주석은 학원엔 왔지만 다른짓하는 친구 -->

<%--안녕하세요  JSP!!<br> --%><!-- jsp 주석은 아예 학원도 안온 친구 -->

나의 이름은 <%= name %> 이다<br>
<!-- 나의 나이은 <%=age %> 살이거든<br>  --> <!-- html 주석은 안보이지만 나이가 계속올라가고 있고 -->

<%--<% out.println("내 나이는 "+age+"살 입니다"); --%><!-- jsp 주석은 아예 안나오므로 나이도 안오른다 -->
</body>
</html>