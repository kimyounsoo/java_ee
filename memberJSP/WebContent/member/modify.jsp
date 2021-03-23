<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
    
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memberDTO" class="member.bean.MemberDTO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/> <!-- 이렇게 해주면 아래 12줄 안써도 된다 -->

<%
//DB
MemberDAO memberDAO = MemberDAO.getInstance();
memberDAO.modify(memberDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	alert("회원정보를 수정하였습니다");
	location.href="../main/index.jsp";
}
</script>
</head>
<body>

</body>
</html>