package imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//1페이지당 3개씩
		int endNum = pg*3;
		int startNum = endNum-2;
		
		//DB로 가야하는데 묶어서 가는게 편하니까  map으로 묶어서 가져간다
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		List<ImageboardDTO> list = imageboardDAO.imageboardList(map);
		
		HttpSession session = request.getSession();
		session.getAttribute("memId");
		
		//페이징처리
		int totalA = imageboardDAO.imageGetTotalA();//총글수
		
		ImageboardPaging imageboardPaging = new ImageboardPaging();
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		
		imageboardPaging.makePagingHTML();
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("list", list); // list 를 imageboardList의 forEach로 넘긴다
		request.setAttribute("imageboardPaging", imageboardPaging);
		request.setAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index.jsp";
	}

}











