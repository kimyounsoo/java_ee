<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.bean.BoardPaging"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List"%>

<%
//데이터
String id = (String)session.getAttribute("memId");
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
int endNum = pg*5;
int startNum = endNum-4;
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);

//페이징 처리 - 1페이지당 5개씩
int totalA = boardDAO.getTotalA();//총글수

BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

//조회수 - 새로고침 방지
if(session.getAttribute("memId") != null){ // null 이면 로그인 자체가 안된거라 글을 볼수 없기때문에 null이 아닐때 쿠키를 생성한다
	Cookie cookie = new Cookie("memHit", "0");//생성
	cookie.setMaxAge(30*60);//초 단위
	response.addCookie(cookie);// 클라이언트 에게 보내기
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	font-size: 12pt;
}

td {
	font-size: 10pt;
}

#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;}
#subjectA:hover {color: green; text-decoration: underline;}
#subjectA:active {color: black; text-decoration: none;}

#currentPaging {
   color: red;
   text-decoration: underline;
}
#paging{
   color: black;
   text-decoration: none;
}
</style>
</head>
<body>
<%if(list != null){ %>
<table border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
 <tr>
  <th width="100">글번호</th> <!-- 가운데, 굵게 -->
  <th width="300">제목</th>
  <th width="100">작성자</th>
  <th width="100">조회수</th>
  <th width="100">작성일</th>
 </tr>
	<%for(BoardDTO boardDTO : list){ %>
	<tr>
		<td align="center"><%=boardDTO.getSeq() %></td>
		<td>
		 <a href="#" id="subjectA" onclick="isLogin('<%=id %>', <%=boardDTO.getSeq() %>, <%=pg%>)"><%=boardDTO.getSubject() %></a>
		</td>
		<td align="center"><%=boardDTO.getId() %></td>
		<td align="center"><%=boardDTO.getHit() %></td>
		<td align="center"><%=boardDTO.getLogtime() %></td>
	</tr>
	<%}//for %>
</table>
<%}//if %>

<img src="../image/apple.png" style="float: lifet; width: 100px; height: 60px; cursor: pointer;" 
onclick="location.href='../main/index.jsp'">

<!--  <div style="float: lifet; width: 500px;"> 두가지 방법-->
<div style="display: inline-block; width: 500px; text-align: center">
<%=boardPaging.getPagingHTML() %>
</div>


<script type="text/javascript">
function isLogin(id, seq, pg){
	if(id == 'null') 
		alert("먼저 로그인하세요");
	else
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
}	
</script>
</body>
</html>




















