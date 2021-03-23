<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

#image1A:link {color: black; text-decoration: none;}
#image1A:visited {color: black; text-decoration: none;} 
#image1A:hover {color: green; text-decoration: underline;} 
#image1A:active {color: black; text-decoration: none;}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<form name="imageboardListForm" method="post" action="imageboardDelete.do">
<!-- 데이터가 널안넘어오면 안보여준다 -->
<!-- th (테이블헤더) 는 알아서 가운데정렬, 굵게 해준다 -->
<c:if test="${ list != null}">
<table border="1" frame="hsides" rules="rows">
	<tr>
		<th width="100"><input type="checkbox" id="all" onclick="checkAll()">번호</th> <!-- 여긴 값이 넘어가는게 아니기때문에  name을 갖을 필요가 없다 -->
		<th width="150">이미지</th>
		<th width="150">상품명</th>
		<th width="100">단가</th>
		<th width="100">개수</th>
		<th width="100">합계</th>
	</tr>
	<!-- 리스트 forEach문으로 뿌리기 -->
	<!-- getSeq() 인데 생략 된것 -->
	<!-- DB에는 이미지 이름만 저장하고 이미지파일은 서버(storage)에 저장해놓은 방식이다 여기선 꺼내오는 역할 -->
	<!-- submit을 했을때 name 속성의 값이 가는것이지 절대  id속성의 값이 가는것이 아니다 -->
	<!-- seq를 value 값으로 잡아준다 check=6&check=4 이런식으로 값이 넘어간다 -->
<c:forEach var="imageboardDTO" items="${requestScope.list }">
	<tr>
		<td align="center">
		<input type="checkbox" name="check" value="${imageboardDTO.seq }">${imageboardDTO.seq }</td> 
		
		<td align="center">
		<a id="image1A" href="#" onclick="isImageLogin('${memId }',${imageboardDTO.seq }, ${pg })">
			<img src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }" width="50" height="50">
		</a>
		</td>
		
		<td align="center">${imageboardDTO.imageName }</td>
		<td align="center">
			<fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice }"/>
			</td>
		<td align="center">${imageboardDTO.imageQty }</td>
		<td align="center">
		<fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty}"/>
		</td>

	</c:forEach>
</table>

<div style="float: left;">
	<input type="button" value="선택삭제" onclick="choiceDelete()">
</div>

<div style="float: left; width: 700px;" align="center">
${imageboardPaging.pagingHTML }
</div>
</c:if>
</form>

<script type="text/javascript">
function isImageLogin(id, seq, pg){
	if(id==""){
		alert("먼저 로그인 하세요");
		location.href="../member/loginForm.do"
	}
	else {
		location.href="imageboardView.do?seq="+seq+"&pg="+pg;
	}
	
}

function imageboardPaging(pg){
	//let keyword = document.boardListSearchForm.keyword.value
	//let keyword = document.getElementById("keyword").value;
		location.href="imageboardList.do?pg="+pg; // 이건 위에 스크립트 메소드? 에서보낸거라 잘 움직인다
		//location.href="imageboardList.do?pg=${pg}"; // 자바(service) 에서 보내준거라서 자기자신것을 보낸거라 움직이지 않고
}

function checkAll(){
	//getElementsName s를 붙여서 복수형, 즉 check라는 name속성을 가진것 들을 가져온다
	//alert(document.getElementsByName("check").length); //3
	//alert(document.getElementById("all").checked) // true / false
	
	let check = document.getElementsByName("check");
	if(document.getElementById("all").checked){
		for(var i=0; i<check.length; i++){ //check라는 name속성을 가진것 들의 length 가져온다 3
			check[i].checked = true;
			
		}//for
	}else{ //해제
		for(var i=0; i<check.length; i++){
			check[i].checked = false;
		}//for
	}
}

function choiceDelete(){
	let check = document.getElementsByName("check");
	let count = 0;
	
	for(var i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}//for
	
	console.log("count = " + count);
	
	if(count==0)
		alert("삭제할 항목을 선택하세요");
	else
		if(confirm("정말로 삭제 ㄱ?"))
			document.imageboardListForm.submit();
}
</script>
