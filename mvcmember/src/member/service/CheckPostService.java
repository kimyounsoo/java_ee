package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//서블릿에서 한글처리를 해주기때문에 post방식도 한글처러 따로해줄필요 없다
		//데이터
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		//DB
		List<ZipcodeDTO> list = null;
		if(sido!=null && roadname!=null){ // 시도 로드네임이 널이 아닐떄 디비로 가라 널이면 디비로 못가게 막음
			MemberDAO memberDAO = MemberDAO.getInstance();
			list = memberDAO.getZipcodeList(sido, sigungu, roadname);
		}
		
		//응답
		request.setAttribute("list", list); // "list" 에 담에서 list 로보낸다 는뜻
		return "/member/checkPost.jsp";
	}

}
