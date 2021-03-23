<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>** 변수 설정 **</h3>
<c:set var="name" value="홍길동"/>
<c:set var="age">25</c:set>

나의 이름은 <c:out value="${name }" /> 입니다.<br>
			${name }<br>
<!-- 보안상의 이유로 위에것을 선호한다 둘다 알아둘것 -->
내 나이는 ${age }살 입니다<br>

<h3>** 변수 삭제 **</h3>
<c:remove var="name"/>
나의 이름은 <c:out value="${name }" /> 입니다.<br>
내 나이는 ${age }살 입니다<br>

<h3>** forEach **</h3>
<c:forEach var="i" begin="1" end="10" step="1">
	${i }
	<c:set var="sum" value="${sum+i }"/>
<!-- 	int sum=0;
	for(int i=1; i<=10; i++){
	sum += i; // sum = sum+i 자바문법을 저렇게 풀어놓은것이다
} -->

	
</c:forEach>
<br>
1 ~ 10 까지의 합 = ${sum }

<c:forEach var="i" begin="1" end="10" step="1">
	${11-i }
</c:forEach>
<br>

<h3>** 문자열 분리 **</h3>
<c:forTokens var="car" items="소나타, 아우디, 링컨, 페라리, 벤츠" delims=",">
	${car }<br>
</c:forTokens>

<h3>** jstlStart.jsp에서 넘어온 데이터 출력 **</h3>
결과 = ${requestScope.list }

<h3>** 인덱스 2번째 데이터 출력 **</h3>
결과 = ${list[2] } <!-- requestScope. 생략해도 된다 알아서 찾아간다 -->

<h3>** list2의 모든 데이터 출력 **</h3>
결과 = ${list2 }
<br><br>

<!-- for(PersonDTO personDTO : list2){

	} -->

<c:forEach var="personDTO" items="${list2 }">
	이름 = ${personDTO.getName() } 나이 = ${personDTO.getAge() }<br>
</c:forEach> <!-- 웹에서는 자료형이 없어서 이름만 쓴다 -->
<br>

<h3>메소드명을 변수명처럼 사용</h3>
<c:forEach var="personDTO" items="${list2 }" varStatus="i">
	index = ${i.index} &emsp; count = ${i.count} &emsp; 이름 = ${personDTO.name } &emsp; 나이 = ${personDTO.age }<br>
</c:forEach>



</body>
</html>













