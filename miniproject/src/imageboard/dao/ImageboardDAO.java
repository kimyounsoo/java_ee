package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import imageboard.bean.ImageboardDTO;





public class ImageboardDAO {
	
	private static ImageboardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static ImageboardDAO getInstance() {
		if (instance == null) {
			synchronized (ImageboardDAO.class) {
				instance = new ImageboardDAO();
			}
		}
		return instance;
	}
	
	public ImageboardDAO() {
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
	
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("imageboardSQL.imageboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImageboardDTO> list = sqlSession.selectList("imageboardSQL.imageboardList", map); //보낸 리스트를 받아와야한다 List<ImageboardDTO> list = 있어야함 
		sqlSession.close();
		return list;
	}

	public int imageGetTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("imageboardSQL.imageGetTotalA");
		sqlSession.close();
		return totalA;
	}

	public ImageboardDTO imageboardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageboardDTO imageboardDTO = sqlSession.selectOne("imageboardSQL.imageboardView",seq);
		sqlSession.close();
		return imageboardDTO;
	}

	public void imageboardDelete(String[] seq) {
		Map<String, String[]> map = new HashMap<String, String[]>();// 맵에서는 배열자체로 못넘기기 때문에 여기서 맵에 배열로 담아준다
		map.put("array",seq);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("imageboardSQL.imageboardDelete",map);
		sqlSession.commit();
		sqlSession.close();
	}
	


}
