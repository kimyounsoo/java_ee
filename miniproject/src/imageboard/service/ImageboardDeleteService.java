package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		//imageboardViewService와는 다르게 같은 이름의 check 변수가 여러개 넘어오기 때문에 배열타입의 seq로 넘기며 getParameter 가아닌 Values 가 붙는다
		String[] seq = request.getParameterValues("check");
		
		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardDelete(seq);
		
//		for(int i = 0; i < seq.length ; i++) {
//			imageboardDAO.imageboardDelete(seq[i]);
//		}
		
		//응답
		request.setAttribute("display","/imageboard/imageboardDelete.jsp");
		return "/main/index.jsp";
	}

}












