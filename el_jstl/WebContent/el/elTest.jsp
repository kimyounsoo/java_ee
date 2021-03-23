<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="50%"> <!-- 여기에 50% 잡아주면 반반씩 크기가 주어지되 창크기에따라 크기가 늘었다 줄었다한다 -->
<tr>
	<th width="50%">표현식</th> <!-- 50% 테이블에 반반씩 50% 빼면 글자수가 작은 값이 테이블 크기가 더 작아진다 -->
	<th width="50%">값</th>
</tr>

<tr>
	<td align="center">\${25+3 }</td> <!-- \ 해주면 계산안하고 문자 그대로 출력 -->
	<td align="center">${25+3 }</td>
</tr>

<tr>
	<td align="center">\${25 / 3 }</td>
	<td align="center">${25 / 3 }</td> <!-- 나누기는 / 와 div 두가지로 쓸 수 있다  -->
</tr>

<tr>
	<td align="center">\${25 div 3 }</td>
	<td align="center">${25 div 3 }</td> <!-- 나누기는 / 와 div 두가지로 쓸 수 있다  -->
</tr>

<tr>
	<td align="center">\${25 % 3 }</td>
	<td align="center">${25 % 3 }</td>
</tr>

<tr>
	<td align="center">\${25 mod 3 }</td>
	<td align="center">${25 mod 3 }</td>
</tr>

<tr>
	<td align="center">\${25 < 3 }</td>
	<td align="center">${25 < 3 }</td>
</tr>

<!-- gt(>), lt(<), ge(>=), le(<=), eq(==), ne(!=) -->

<tr>
	<td align="center">\${25 ne 3 }</td>
	<td align="center">${25 ne 3 }</td>
</tr>

<tr>
	<td align="center">\${header['host'] }</td><!-- 위 아래 둘다 익혀두도록 하자 -->
	<td align="center">${header['host'] }</td>
</tr>

<tr>
	<td align="center">\${header.host }</td>
	<td align="center">${header.host }</td>
</tr>
	
</table>
</body>
</html>