<%@page import="member.dao.MemberDAO, member.bean.ZipcodeDTO, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소찾기</title>

<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form method="post" action="checkPost.do">
<table border="1" width="100%" cellpadding="2" cellspacing="0">
<tr>
<td align="center" style="font-size: 13pt; font-weight: bold" width="100">시도</td>
<td>
<select name="sido" style="width: 100px; font-size: 13pt; font-weight: bold">
				<option>시도선택</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="울산">울산</option>
				<option value="세종">세종</option>
				<option value="광주">광주</option>
				<option value="경기">경기</option>
				<option value="강원">강원</option>
				<option value="전남">전남</option>
				<option value="전북">전북</option>
				<option value="경남">경남</option>
				<option value="경북">경북</option>
				<option value="충남">충남</option>
				<option value="충북">충북</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
		</select>
</td>


<td align="center" style="font-size: 13pt; font-weight: bold">시.군.구</td>
<td><input type="text" name="sigungu"></td>
</tr>


<tr>
<td align="center" style="font-size: 13pt; font-weight: bold">도로명</td>
<td colspan="3">
<input type="text" name="roadname" size="35">
<input type="submit" value="검색"></td>
</tr>


<tr>
<td align="center" style="font-size: 13pt; font-weight: bold">우편번호</td>
<td colspan="3" align="center" style="font-size: 13pt; font-weight: bold">주소</td>
</tr>

<c:if test="${requestScope.list != null }">
<c:forEach var="postList" items="${requestScope.list }">
<tr>
<td align="center">${postList.zipcode }</td>
<c:set var="address" value="${postList.sido
} ${postList.sigungu
} ${postList.yubmyundong
} ${postList.ri
} ${postList.roadname
} ${postList.buildingname}"/>


<td colspan="3"><a id="addressA" href="#" onclick="checkPostClose('${postList.zipcode }','${address }')">
${address }</a>
</td>
</tr>
</c:forEach>
</c:if>

</table>
</form>
</body>

<script type="text/javascript">
function checkPostClose(zipcode, address){
	window.opener.document.getElementById("postcode").value = zipcode;
	//opener.document.forms[0].zipcode.value = zipcode;
	window.opener.document.getElementById("address").value = address;
	window.close();
	opener.document.getElementById("detailAddress").focus();
	//opener.document.forms[0].addr2.focus();
}

</script>
</html>