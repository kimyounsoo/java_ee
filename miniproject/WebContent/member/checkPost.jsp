<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호</title>


<link rel="stylesheet" href="../css/member.css">

</head>
<body><!-- method="" 안해주면 무조건 get방식 -->
<form method="post" action="checkPost.do">
<hr>
<table border="1" width="100%" cellpadding="2" cellspacing="0">
<tr>
	<td width="100" align="center">시도</td>
	<td>
		<select name="sido" style="width: 100px;">
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
	<td align="center" width="100">시.군.구</td>
	<td>
		<input type="text" name="sigungu">
	</td>
</tr>
<tr>
<td align="center">도로명</td>
<td colspan="3">
	<input type="text" name="roadname" size="35">
	<input type="submit" value="검색">
	</td>
</tr>
<tr>
	<td align="center">우편번호</td>
	<td colspan="3" align="center">주소</td>
</tr>
	<c:if test="${requestScope.list != null }">
		<c:forEach var="zipcodeDTO" items="${list }"> <!-- list가 하나씩 zipcodeDTO로들어간다 자료형이 필요없어서 ZipcodeDTO zipcodeDTO 할필요없다-->
		<c:set var="address">
			${zipcodeDTO.sido 
			} ${zipcodeDTO.sigungu 
			} ${zipcodeDTO.yubmyundong 
			} ${zipcodeDTO.ri 
			} ${zipcodeDTO.roadname 
			} ${zipcodeDTO.buildingname } 
		</c:set><!-- 접두어 get 뺴고 z 소문자로 바꿔줌 이렇게하면 한줄로 인식해서 잘 나온다 공백인식못함 -->
		<tr>
			<td align = "center">${zipcodeDTO.zipcode }</td> <!-- 접두어 get 뺴고 z 소문자로 바꿔줌 -->
			<td colspan="3">
				<a href = "#" id="addressA" onclick="checkPostClose('${zipcodeDTO.zipcode}', '${address }')">${address }</a>
			</td>
		</tr>
		</c:forEach>
	</c:if>
</table>
</form>

<script>
function checkPostClose(zipcode, address){ // zipcodeDTO.zipcode, address 66줄에서 받아옴
	//아이디로 접근 하던가 forms[0](forms배열관리 캡처 확인) 로접근하던가
	opener.document.forms[0].zipcode.value = zipcode;// 위아래 일부로 다르게함 네임속성
	//opener.writeForm.zipcode.value = zipcode; //원래는 이런 형태였다 이렇게하면 writeForm에서만 적용된다
	opener.document.getElementById("address").value = address; // document 없으면 우편번호만 가고 주소가 안간다
	//opener.writeForm.addr1.value = address;
	window.close();
	opener.writeForm.addr2.focus();
}
</script>
</body>
</html>