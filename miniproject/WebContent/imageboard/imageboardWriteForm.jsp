<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="imageboardWrite.do">

<h3>상품 등록</h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0">
 <tr>
  <td align="center" width="70">상품코드</td>
  <td>
    <input size="50" type="text" name="imageId" id="imageId" value="img_">
  </td>
 </tr>
 <tr>
  <td align="center" width="70">상품명</td>
  <td>
    <input size="50" type="text" name="imageName" id="imageName" placeholder="상품명 입력">
  	<div id="imageNameDiv" style="color: red; font-size:8pt; font-weight:bold;"></div>
  </td>
 </tr>
 <tr>
  <td align="center" width="70">단가</td>
  <td>
    <input size="50" type="text" name="imagePrice" id="imagePrice" placeholder="단가 입력">
  	<div id="imagePriceDiv" style="color: red; font-size:8pt; font-weight:bold;"></div> 
  </td>
 </tr>
 <tr>
  <td align="center" width="70">개수</td>
  <td>
    <input size="50" type="text" name="imageQty" id="imageQty" placeholder="개수 입력">
  	<div id="imageQtyDiv" style="color: red; font-size:8pt; font-weight:bold;"></div>
  </td>
 </tr>
 <tr>
  <td align="center">내용 </td>
  <td>
   <textarea rows="10" cols="50" name="imageContent" id="imageContent" placeholder="내용 입력"></textarea>
   </td>
 </tr>
 <tr>
	<td colspan="2">
		<input type="file" name="image1" id="image1" size="50">
		<div id="image1Div" style="color: red; font-size:8pt; font-weight:bold;"></div>
	</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="button" value="이미지등록" onclick="javascript:checkImageboardWrite()">
		<input type="reset" value="다시작성">
	</td>
	</tr>
</table>
</form>

<script type="text/javascript">
function checkImageboardWrite() {
	document.getElementById("imageNameDiv").innerText="";
	document.getElementById("imagePriceDiv").innerText="";
	document.getElementById("imageQtyDiv").innerText="";
	document.getElementById("image1Div").innerText="";
	
	if(document.getElementById("imageName").value=="") {
		document.getElementById("imageNameDiv").innerText = "상품명을 입력하세요";
	}
	else if(document.getElementById("imagePrice").value==""){
		document.getElementById("imagePriceDiv").innerText = "단가를 입력하세요";
	}
	else if(document.getElementById("imageQty").value==""){
		document.getElementById("imageQtyDiv").innerText = "개수를 입력하세요";

	}
	else if(document.getElementById("image1").value ==""){
		document.getElementById("image1Div").innerText= "이미지파일을 선택하세요";
	}
	else{
		document.imageboardWriteForm.submit();
	}
}
</script>


