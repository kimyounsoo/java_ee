<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardReply</title>
<script type="text/javascript">
window.onload=function() {
   alert("답글이 저장되었습니다.")
   location.href="boardList.do?pg=${requestScope.pg}";
}
</script>
</head>
<body>

</body>
</html>