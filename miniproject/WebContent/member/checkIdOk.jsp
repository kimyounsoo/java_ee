<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${id }는 사용가능<br> <!-- requestScope.생략  pageScope -> requestScope -> sessionScope 라서 알아서 찾는다 -->
<input type="button" value="사용하기" onclick="checkIdClose('${id }')"> 

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