<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body onload = "init('${sessionScope.memName }');">
</body> 

<script type="text/javascript">
function init(name){
	alert(name+'님 환영합니다.');
	location.href="../main/index.do";
}

</script> 
</html>