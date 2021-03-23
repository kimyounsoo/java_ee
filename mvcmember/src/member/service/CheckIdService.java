package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.isExistId(id);
		
		//응답
		request.setAttribute("id", id); // 이렇게하면 밑에 주소에다 id 실어보낼필요없다 둘중하나 선택 캡쳐 request 참조
		if(exist) {
			return "/member/checkIdFail.jsp"; 
			//?id="+id; // 사용 불가능 여기서 주소에다 id 실어보내도 된다
		}else {
			return "/member/checkIdOk.jsp";
			//?id=\"+id"; // 사용가능 여기서 주소에다 id 실어보내도 된다
		}
		
		
	}

}
