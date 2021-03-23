package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;


public class BoardModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.boardView(seq); // 한사람글 데이터 가져오는거 boardDAO 에만들어놓은거 다시 사용만하면된다
		
		//응답
		request.setAttribute("pg", pg); // pg만 넘긴다 seq는 dto 에있어서 안넘겨도 된다
		request.setAttribute("boardDTO", boardDTO);
		return "/board/boardModifyForm.jsp";
	}

}
