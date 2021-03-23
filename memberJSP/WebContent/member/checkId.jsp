<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%
//데이터    //스크린샷 54
String id = request.getParameter("id");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistId(id); // exist 가 true 이면 사용불가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="checkId.jsp"><!-- submit 은 form 태그가 필요하다 -->
<% if(exist){ %>
	<%=id %>는 사용 불가능<br><br>
	아이디<input type="text" name="id">
	<input type="submit" value="중복체크">
<%}else{ %>
	<%=id %>는 사용 가능<br><br>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<%} %>
</form>
<script> //스크립트는 꼭 function 해줘야한다
function checkIdClose(id){//26줄  id가 여기로 들어온다 자바스크립트는 자료형이 필요없어서 String id 하지않고 그냥 id 해줬다
	opener.writeForm.id.value = id; // opener열려있는 창들 중에 캡쳐3 내용확인
	opener.writeForm.check.value = id; // writeForm.jsp 에 중복체크 후 사용하기 눌렀을때
	window.close();
	opener.writeForm.pwd.focus(); // 포커스 커서 이자리에서 깜빡거리게함
}
</script>
</body>
</html>