<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="birth" value="${param.birth }" />
<c:set var="year" value="${birth.substring(0,4) }" />
<c:set var="month" value="${birth.substring(4,6) }" />
<c:set var="day" value="${birth.substring(6,8) }" />

<c:set var="age" value="${2021 - year + 1 }"/>

${param.name }님의 생일은 ${year }년 ${month }월 ${day }일 입니다.
나이는 ${age }살 입니다.

012345678
19900716

<%
/* 맨위의 birth와 같은 코드 */
String birth = request.getParameter("birth");
%>