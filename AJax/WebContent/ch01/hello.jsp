<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
String name = request.getParameter("name");
%>

안녕하세요, <%= name %> 회원님! --%>

안녕하세요, ${param.name} 회원님!
jstl el 아무거나 된다 param 써줘야한다!!