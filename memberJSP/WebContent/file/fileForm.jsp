<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" enctype="multipart/form-data" action="fileUpload.jsp">
<table border="1">
 <tr>
  <td align="center" width="70">제목</td>
  <td>
    <input type="text" name="subject" size="50">
  </td>
 </tr>
 <tr>
  <td align="center">내용 </td>
  <td>
   <textarea rows="10" cols="50" name="content" ></textarea>
   </td>
 </tr>
 <tr>
	<td colspan="2">
		<input type="file" name="upload1" size="50">
	</td>
	</tr>
	<tr>
	<td colspan="2">
		<input type="file" name="upload2" size="50">
	</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="submit" value="파일업로드">
		<input type="reset" value="다시작성">
	</td>
	</tr>
</table>
</form>
</body>
</html>