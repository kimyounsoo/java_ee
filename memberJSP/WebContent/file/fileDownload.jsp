<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>

<% 
String fileName = request.getParameter("fileName");

String realFolder = request.getServletContext().getRealPath("/storage");//실제폴더

//다운로드 받을 파일
File file = new File(realFolder, fileName);
fileName = URLEncoder.encode(fileName, "UTF-8").replace("+", " ");

System.out.println(file);

//사용자한테  다운로드 창 띄우는 기능
response.setHeader("Content-Disposition", "attachment;fileName+fileName"); //파일내려받으시겠습니까? 메세지 뜨게하는 기능 크롬은 자동으로 받아버린다
response.setHeader("Content-Length", file.length()+"");

/*
getOutputStream() has already been called for this response
JSP에서는 SERVLET으로 변환될 때 내부적으로 out객체가 자동으로 생성 하기 때문에 out객체를 만들면 충돌이 일어나서 저런 메시지가 뜨는 것이다.
그래서 먼저 out를 초기화하고 생성하면 된다.
*/
out.clear();
out = pageContext.pushBody();// pagecontext에 있는 내용을 body부에 넣어준다

BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

int size = (int)file.length();
byte[] b = new byte[size];
bis.read(b,0,size);
bos.write(b);

bis.close();
bos.close();

%>
