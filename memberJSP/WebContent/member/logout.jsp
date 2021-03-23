<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//쿠키
/* Cookie[] ar = request.getCookies();//여기도 마찬가지로 특정 쿠키를 얻을수 없고 모든 쿠키를 가져온다
if(ar != null){
	for(int i=0; i<ar.length; i++){
		if(ar[i].getName().equals("memName")){
			ar[i].setMaxAge(0);// 시간을 없애면 쿠키도 삭제된다
			response.addCookie(ar[i]);//클라이언트에 저장
		
		}else if(ar[i].getName().equals("memId")){
			ar[i].setMaxAge(0);// 시간을 없애면 쿠키도 삭제된다
			response.addCookie(ar[i]);//클라이언트에 저장
		}
	}//for
}//if */

//세션
session.removeAttribute("memName");
session.removeAttribute("memId");
			
session.invalidate();//무효화			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<h3>로그아웃</h3>

<script type="text/javascript">
window.onload=function(){
	alert("로그아웃");
	location.href="../main/index.jsp"; // 로그인 폼으로 가도되고 메인으로가면 어디든 갈수있기 때문에 메인으로 보냄
}
</script>
</body>
</html>