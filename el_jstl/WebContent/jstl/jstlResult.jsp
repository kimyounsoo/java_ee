<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 자바에서 포스트방식 한글처리 request.setCharacterEncoding("UTF-8"); -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value ="UTF-8"/>
<!-- 자바에서 포스트방식 한글처리 request.setCharacterEncoding("UTF-8"); 4번째 줄과 13번째줄 -->
이 름 : ${param['name'] }<br><br> <!-- param 으로 받는다 배열받아도 된다 -->

나 이 : ${param.age } <br><br> <!-- 배열로 안받고 .age로 받았다 -->
<c:if test="${param.age > 20 }"> <!-- 3번째줄에 c 태그 안잡아주면 c:안써진다 -->
	<strong>성인</strong>
</c:if>
<c:if test="${param.age <= 20 }">
	<strong>청소년</strong>
</c:if>
<br><br>

색깔 :
<c:if test="${param.color == 'red'}">빨 강</c:if>   <!-- equals 는 자바에서만 사용한다 여기서는 == 으로 간다 -->
<c:if test="${param.color == 'green' }">초 록</c:if>
<c:if test="${param.color == 'blue'}">파 랑</c:if>
<c:if test="${param.color == 'violet' }">보 라</c:if>
<c:if test="${param.color == 'cyan' }">하 늘</c:if>

<c:choose>
	<c:when test="${param.color == 'red'}">빨 강</c:when>
	<c:when test="${param.color == 'green'}">초 록</c:when>
	<c:when test="${param.color == 'blue'}">파 랑</c:when>
	<c:when test="${param.color == 'violet'}">보 라</c:when>
	<c:otherwise>하 늘</c:otherwise>
</c:choose>
<br><br>

취 미 :
${paramValues['hobby'][0] }
${paramValues['hobby'][1] }
${paramValues['hobby'][2] }
${paramValues['hobby'][3] }
${paramValues['hobby'][4] }
<br><br>
취 미 :
<c:forEach var="data" items="${paramValues.hobby }"> <%-- ${ } 안해주면 값이 안나오고 글자가 그대로 나온다 차이점 알아두자 --%>
	${data }
</c:forEach>

</body>
</html>