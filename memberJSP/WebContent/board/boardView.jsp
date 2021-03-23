<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>
<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));



//DB
BoardDAO boardDAO = BoardDAO.getInstance();

//조회수 증가 - 새로고침 방지
Cookie[] ar = request.getCookies();//쿠키는 특정 쿠키만 가져올수 없으므로 모든 쿠키를 가져와야한다
if(ar  != null){
	for(int i=0; i<ar.length; i++){
		if(ar[i].getName().equals("memHit")){
			boardDAO.hitUpdate(seq);// 조회수 증가, ~~ = 없으면 리턴값이 없다는뜻
			ar[i].setMaxAge(0);//쿠키 삭제
			response.addCookie(ar[i]);
		}
	}//for
}
//boardDAO.hitUpdate(seq); //20번째줄로감	

BoardDTO boardDTO = boardDAO.boardView(seq); // 한사람 분량이라 DTO 로보낸다


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="450" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
 <tr>
 	<td colspan="3"><h3><%=boardDTO.getSubject() %></h3></td>
 </tr>
 
 <tr>
  <td width="150">글번호 : <%=boardDTO.getSeq() %></td>
  <td width="150">작성자 : <%=boardDTO.getId() %></td>
  <td width="150">조회수 : <%=boardDTO.getHit() %></td>
 </tr>
 
 <tr>
  <td colspan="3" height="200" valign="top" style="white-space: pre-line; word-break: break-all"><%=boardDTO.getContent() %></td>
 </tr>
</table>
<input type="button" value="목록" onclick="location.href='../board/boardList.jsp?pg=<%=pg%>'">
</body>
</html>

<!-- pre 는 입력한모양 그대로 찍히게 하는 태그이다  스타일을 줄때는 필요가없다 (화이트스페이스) 글이 범위밖으로 넘어가면 자동으로 넘아가게 하는 기능-->











