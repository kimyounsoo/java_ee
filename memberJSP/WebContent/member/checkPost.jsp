<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="member.bean.ZipcodeDTO"%>
<%@ page import="member.dao.MemberDAO"%>
    
<%
//데이터
request.setCharacterEncoding("UTF-8");// post방식 일때는 이렇게 한글처리를 해줘야한다
String sido = request.getParameter("sido");
String sigungu = request.getParameter("sigungu");
String roadname = request.getParameter("roadname");



//DB
List<ZipcodeDTO> list = null;
if(sido!=null && roadname!=null){ // 시도 로드네임이 널이 아닐떄 디비로 가라 널이면 디비로 못가게 막음
	MemberDAO memberDAO = MemberDAO.getInstance();
	list = memberDAO.getZipcodeList(sido, sigungu, roadname);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호</title>


<link rel="stylesheet" href="../css/member.css">

</head>
<body><!-- method="" 안해주면 무조건 get방식 -->
<form action="checkPost.jsp">
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

<%if(list !=null){%>
	<%for(ZipcodeDTO zipcodeDTO: list){ 
		String address = zipcodeDTO.getSido()+" "
						+ zipcodeDTO.getSigungu()+" "
						+ zipcodeDTO.getYubmyundong()+" "
						+ zipcodeDTO.getRi()+" "
						+ zipcodeDTO.getRoadname()+" "
						+ zipcodeDTO.getBuildingname();
	%>
		<tr>
			<td align = "center"><%=zipcodeDTO.getZipcode() %></td>
			<td colspan="3">
				<a id="addressA" href="#" onclick ="checkPostClose('<%=zipcodeDTO.getZipcode() %>', '<%=address%>')"><%=address%></a>
				
			</td>
		</tr>
	<%}//for %>
<%}//if %>

</table>
</form>

<script>
function checkPostClose(zipcode, address){
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