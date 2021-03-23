<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 게터세터 캡처본 확인 -->
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/><!-- 싱글톤 개념, scope 안해주면 page안에서만 살아있다 -->
<jsp:setProperty property="x" name="dataDTO"/> <!-- 이 x 는 setX 이다 -->
<jsp:setProperty property="y" name="dataDTO"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="get" action="http://localhost:8080/memberJSP/exam/mul.jsp">


<jsp:getProperty property="x" name="dataDTO"/> + 
<jsp:getProperty property="y" name="dataDTO"/> = 
<%=dataDTO.getX() + dataDTO.getY() %><br><br>

<input type="submit" value="곱구하기">
<%-- <input type="hidden" name="x" value="<%=x%>"> <!-- 입력상자 안보이게 text 대신 hidden 해 주고 그안에 데이터 담아서 밑에 submit 수행하게 한다 -->
<input type="hidden" name="y" value="<%=y%>"> <!-- 입력상자 데이터 받는건 submit button 하면 에러--> --%>
<%-- <%=x %> + <%=y %> = <%=x+y %><br> --%>

<%-- <input type ="submit" value="곱하기" onclick="location.href='mul.jsp'">
<input type = "button" value="곱구하기" onclick="location.href='mul.jsp?x=<%=x%>&y=<%=y %>'"> --%> <!-- hidden 사용 안하고 데이터 바로버튼에 담아서 mul.jsp 로보내는 방식 -->

</form>
</body>
</html>