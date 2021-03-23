<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
    
<%
//데이터

request.setCharacterEncoding("UTF-8");// post방식이라 한글처리 따로 해줘야한다

String name = (String)session.getAttribute("memName");
String id = (String)session.getAttribute("memId");
String email = (String)session.getAttribute("memEmail");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Map<String, String> map = new HashMap<String, String>();// map 사용
map.put("id", id);
map.put("name", name);
map.put("email", email);
map.put("subject", subject);
map.put("content", content);

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardWrite(map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	alert("작성하신 글이 등록 되었습니다");
	location.href="boardList.jsp?pg=1";
}
</script>
</body>
</html>	








