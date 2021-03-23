<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//String name = request.getParameter("name"); 

String name = null;
String id = null;

//쿠키
/* Cookie[] ar = request.getCookies();//특정 쿠키를 얻을수 없고(아이디 네임 원하는것을 빼올수 없다) 모든 쿠키를  배열 타입으로 가져온다
if(ar != null){// 3초가 지나면 쿠키는 사라지기떄문에 if문 걸어준다 로그인 성공 후 3초가 지나면(login.jsp 에서 30분으로 늘려놓은 상태이다) 이름쿠키 아이디쿠키는 사라진다 주소로보내는 방식이 아닌 쿠키로 보내는 방식으로 바꾼것이다
	for(int i=0; i<ar.length; i++){
		//System.out.println("쿠키명= " + ar[i].getName());
		//System.out.println("쿠키값= " + ar[i].getValue());
		//System.out.println();
		
		if(ar[i].getName().equals("memName")) name = ar[i].getValue();
		else if(ar[i].getName().equals("memId")) id = ar[i].getValue();// getName은 쿠키명이다
	}//for
}//if */

name = (String)session.getAttribute("memName"); // 자식 = (자식)부모 형변환
id = (String)session.getAttribute("memId"); // 자식 = (자식)부모 형변환
			
%>
<!-- 로그인ok 이동 캡처 확인 이런 방식을 get 방식 이라고 한다 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="../image\apple.png" style="width: 130px; height: 80px; cursor: pointer;" 
onclick="location.href='../main/index.jsp'">
<%=name %>님 로그인<br><br>

<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<input type="button" value="회원정보수정" onclick="location.href='modifyForm.jsp'">
</body>
</html>