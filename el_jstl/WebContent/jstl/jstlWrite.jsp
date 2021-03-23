<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:requestEncoding value="UTF-8" />
<sql:update var="su" dataSource="jdbc/oracle"> 
	insert into usertable values('${param.name }','${param.id }','${param.pwd }') 
</sql:update> <!-- 인서트가 없다 업데이트가 있으면 업데이트 없으면 인서트로 대체된다 -->
<!-- 3,5줄 포스트방식 한글처리 하는방법 약간 다르다 -->
<!-- jstlWriteForm.jsp 의 각 이름 아이디 비번 변수에서 param 객채를 통해 꺼내오는것이다 -->
<!-- DAO에 conext ds 부분이 간단하게 바뀌었다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${su==1 }"><h3>DB에 저장 완료</h3></c:if>
<c:if test="${su==0 }"><h3>DB에 저장 실패</h3></c:if>
<br><br>
<input type="button" value="등록" onclick="location.href='jstlList.jsp'">
</body>
</html>