<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
</head>
<body>
와후 ! '${param.id }'은(는) 사용 가능해요!!!!!
<input type="button" value="사용하기" onclick="existed()">
</body>
<script type="text/javascript">
	function existed() {
		window.opener.document.getElementById("checked").value = "idcheck";
		window.opener.document.getElementById("id").value = "${param.id }";
		window.opener.document.getElementById("idDiv").innerText = "";
		window.close();
		opener.writeForm.pwd.focus();
		window.opener.document.getElementById("id").readOnly = true;
	}
</script>
</html>