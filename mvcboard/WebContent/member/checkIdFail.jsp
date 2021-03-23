<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크 실패</title>
</head>
<body>
<form action="/mvcboard/member/checkId.do">
'${param.id }'는 누군가가 사용하고 있어요ㅠㅠ
<br><br>
아이디 <input type="text" name="id" id="id">
<input type="submit"
 style="border:1px solid black; background-color:#C0C0C0; font-size:12pt; font-weight:bold; font-family:휴먼명조"
 value=중복체크>
 </form>
</body>
</html>