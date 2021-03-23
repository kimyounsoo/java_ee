<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO"%>
    
<%
request.setCharacterEncoding("UTF-8");
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.login(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(memberDTO==null) {
	response.sendRedirect("loginFail.jsp"); //페이지 이동
}else{
	//response.sendRedirect("loginOk.jsp?name="+ URLEncoder.encode(name, "UTF-8"));//페이지 이동
	
	//쿠키
/* 	Cookie cookie = new Cookie("memName", name);
	cookie.setMaxAge(30*60);//초 단위 - 30분
	response.addCookie(cookie);//클라이언트에 저장
	 
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(30*60);//초 단위 = 30분
	response.addCookie(cookie2); */
	
	//세션
	//HttpSession session = request.getSession(); //서블릿파일이 만들면서 9개 내장객체 만드는데 거기에 session 도 있기 때문에 빨간줄 9개 내장객체는 java_ee 워드파일 확인
	session.setAttribute("memName", memberDTO.getName());//그러므로 그냥 이렇게해주면 된다
	session.setAttribute("memId",id);
	session.setAttribute("memEmail",memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	
	session.setAttribute("memDTO", memberDTO); // 12세션 한꺼번에 실어도 된다
	
	response.sendRedirect("loginOk.jsp");
	
} //익스플로러의 16진수 방식을 생각 한다 암호화 해줘서 한글이 깨지지 않게 한다 import는 java.net
//주소에 물음표가 온다는건 보낼때부터 잘못됐다는 것이기때문에 
%>
</body>
</html>






