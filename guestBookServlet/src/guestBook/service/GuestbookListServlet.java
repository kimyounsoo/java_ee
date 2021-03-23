package guestBook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestBook.bean.GuestbookDTO;
import guestBook.dao.GuestbookDAO;



@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		//데이터
 		int pg = Integer.parseInt(request.getParameter("pg"));
 		
 		//페이징 처리 - 1페이지당 2개씩
 		int endNum = pg*2;
 		int startNum = endNum-1;
 		
 		
 		//DB
 		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
 		int totalA = guestbookDAO.getTotalA();//총글수
 		//int totalP = totalA-totalA/2;//총페이지수
 		int totalP = (totalA+1)/2;//총페이지수
 		            
 		List<GuestbookDTO> list = guestbookDAO.getList(startNum, endNum);
 		
 		//응답
 		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>"); 
		out.println("<head>");
		out.println("<title>글목록</title>");
		out.println("<style>");
		out.println("#currentPaging {color: red; text-decoration: underline; }");
		out.println("#paging {color: black; text-decoration: none; }");
		out.println("");
		out.println("</style>");
		out.println("<body>");
		if(list != null) {
			//페이지
			for(int i=1; i<=totalP; i++) {
				if(pg==i) {
					out.println("[<a id=currentPaging href='http://localhost:8080/guestbookServlet/GuestbookListServlet?pg="+i+"'>"+i+"</a>]");
				}else {
					out.println("[<a id=paging href='http://localhost:8080/guestbookServlet/GuestbookListServlet?pg="+i+"'>"+i+"</a>]");
				}                       
			}//for
			out.println("<br><br>");
			
			for(GuestbookDTO guestbookDTO : list) {
				out.println("<table border=1>");
				out.println("<tr>");
				out.println("<td width=150 align=center>작성자</td>");
				out.println("<td width=150 align=center>"+guestbookDTO.getName()+"</td>");
				out.println("<td width=150 align=center>작성일</td>");
				out.println("<td width=150 align=center>"+guestbookDTO.getLogtime()+"</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td align=center>이메일</td>");
				out.println("<td colspan=3>"+guestbookDTO.getEmail()+"</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td align=center>홈페이지</td>");
				out.println("<td colspan=3>"+guestbookDTO.getHomepage()+"</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td align=center>제목</td>");
				out.println("<td colspan=3>"+guestbookDTO.getSubject()+"</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td colspan=4><pre>"+guestbookDTO.getContent()+"</pre></td>");
				out.println("</tr>");
				out.println("</table>");
			}//for
			
		}//if
		out.println("</body>");
		out.println("</html>");
 	}

}

















