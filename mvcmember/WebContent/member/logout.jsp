<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
	location.href="/mvcmember/member/loginForm.do"; // jsp 로 가는건 없다 모두다 do 로
}
</script>
</body>
</html>