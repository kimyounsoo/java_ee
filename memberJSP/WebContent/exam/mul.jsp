<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session" />
<!-- sum의 싱글톤 개념이라 sum 처럼게터세터 안해줘도된다 -->
<!-- 여기에도 scope=session 해줘야함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty property="x" name="dataDTO"/> + 
<jsp:getProperty property="y" name="dataDTO"/> = 
<%=dataDTO.getX() * dataDTO.getY() %><br><br>


<input type ="button" value="처음으로" onclick="location.href='input.jsp'"> <!-- 뒤로가기 버튼 누르면 input.jsp 로 가라-->

</body>
</html>