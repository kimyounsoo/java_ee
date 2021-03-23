<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("apple", "사과");

//페이지 이동
//forward와 같은의미 위의것을 선호
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");//상대번지 나는 합병을 하겠습니다
dispatcher.forward(request, response); // 제어권 넘기기 request와 response 제어권을 넘기겠습니다
%>

<%-- <jsp:forward page="forwardResult.jsp"/> 많이 안쓰이는 forward태그--%>