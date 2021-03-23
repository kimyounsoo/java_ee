package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import member.dao.MemberDAO;
import search.bean.SearchDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public BoardDAO() {
		// mybatis.config.xml의 내용 읽어오기
		try {
			// InputStream inputStream =
			// Resources.getResourceAsStream("mybatis-config.xml"); // src/ 안해줘도 기본으로 여기서
			// 찾는다
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");// 위에껀 바이트 단위 이건 케릭터 단위
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();

	}

	public List<BoardDTO> boardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>(); // Map<이름, 값>
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();

		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

	public BoardDTO boardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.boardView",seq);
		sqlSession.close();
		return boardDTO;
	}



	public void hitUpdate(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.selectOne("boardSQL.hitUpdate",seq);
		sqlSession.commit();
		sqlSession.close();

	}
	
	public void boardModify(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify",map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardReply(Map<String, String> map) { // 원글을 먼저 가져와야 한다 답글은항상 원글과 함께 있어야하기 때문에
		BoardDTO pDTO = boardView(Integer.parseInt(map.get("pseq")));
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//step update pDTO 생성해서 원글가져옴
		sqlSession.update("boardSQL.boardReply1", pDTO);
		
		//insert - boardReplyService에서 안담은것들 여기서 담기 map으로 다 가져옴
		map.put("ref",pDTO.getRef()+"");//원글 ref(그룹번호)
		map.put("lev",pDTO.getLev()+1+""); // 원글 lev + 1
		map.put("step",pDTO.getStep()+1+""); // 원글 lev + 1
		sqlSession.insert("boardSQL.boardReply2",map);
		
		//reply update seq가져옴
		sqlSession.update("boardSQL.boardReply3",pDTO.getSeq());
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public List<BoardDTO> boardSearch(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardSearch", map);
		sqlSession.close();
		return list;
	}

	public int getSearchTotalA(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getSearchTotalA",map);
		sqlSession.close();
		return totalA;
	} 

}
