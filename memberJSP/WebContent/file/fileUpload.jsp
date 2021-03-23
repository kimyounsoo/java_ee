
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%
String realFolder = request.getServletContext().getRealPath("/storage");
System.out.println("실제폴더="+realFolder);

//Upload
   MultipartRequest multi = new MultipartRequest(request
                                 , realFolder
                                 , 5*1024*1024 //5MB, 최대업로드 용량
                                 , "UTF-8"
                                 , new DefaultFileRenamePolicy());
//Data
// 위에서 request의 권한을 모두 multi가 위임 받았으므로 선언시 multi 사용한다.
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");

// 이름이 바뀌기 전 원래 이름을 얻는다.
String originalFileName1 = multi.getOriginalFileName("upload1");
String originalFileName2 = multi.getOriginalFileName("upload2");

String fileName1 = multi.getFilesystemName("upload1");
String fileName2 = multi.getFilesystemName("upload2");

// 파일의 정보를 얻어오기 위해 파일화 시킨다.
File file1 = multi.getFile("upload1");
File file2 = multi.getFile("upload1");

long fileSize1=0;
long fileSize2=0;

// 파일 사이즈를 구한다.
if(file1!=null) fileSize1 = file1.length();
if(file2!=null) fileSize1 = file2.length();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h3>파일이 업로드 되었습니다.</h3>
 <hr>
 <ul>
  <li>제 목 : <%=subject%><br>
  <li>내 용 : <pre><%=content%></pre><br>
						<!-- URLEncoder 스태틱이라 new 없이 바로 접근한다 익스플로러에 경우 한글이 깨져서 에러가 나기때문에 암호화 해주어야한다-->
  <li>파 일 : <a href="fileDownload.jsp?fileName=<%= URLEncoder.encode(originalFileName1,"UTF-8") %>"><%=originalFileName1%></a><br>
  <li>파 일 : <%=fileName1%><br>
  <li>크 기 : <%=fileSize1%><br>
  <br><br>
  <li>파 일 : <a href="fileDownload.jsp?fileName=<%=originalFileName2%>"><%=originalFileName2%></a><br>
  <li>파 일 : <%=fileName2%><br>
  <li>크 기 : <%=fileSize2%><br>
  
 </ul>
</body>
</html>