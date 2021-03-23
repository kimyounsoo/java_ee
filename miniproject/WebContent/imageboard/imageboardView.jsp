<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<form name="imageboardViewForm">

<input type = "hidden" name="seq" value="${imageboardDTO.seq }">
<input type = "hidden" name="pg" value="${pg }">

<h3 align="center"></h3>
<hr>
<div class="main">
	<table border="1" width="800" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<td colspan="3">
			<img src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }" width="50" height="50">
			</td>
		</tr>

		<tr>
			<td width="150">번호 : ${imageboardDTO.seq }</td>
			<td width="190">상품명 : ${imageboardDTO.imageName }</td>
			<td width="190">단가 : ${imageboardDTO.imagePrice }</td>
			<td width="150">개수 : ${imageboardDTO.imageQty }</td>
		</tr>

		<tr>
			<td colspan="3" height="350" valign="top"
				style="white-space: pre-wrap; word-break: break-all;">${imageboardDTO.imageContent }</td>
		</tr>
	</table>
	<div class="button">
		<input type="button" value="목록" onclick="location.href='../imageboard/imageboardList.do?pg=${pg }'">
	</div>
</div>
</form>












