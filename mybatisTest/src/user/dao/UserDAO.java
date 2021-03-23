package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private static UserDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public static UserDAO getInstance() {
		if (instance == null) {
			synchronized (UserDAO.class) {
				instance = new UserDAO();
			}
		}
		return instance;
	}

	public UserDAO() {
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

	public int write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("userSQL.write", userDTO); // 반드시 DTO 를넘겨줘야 DTO 데이터를 넘길수있다
		// mapper.xml에서 <insert 태그 찾아가라 namespace.메소드이름

		sqlSession.commit();
		sqlSession.close();

		return su;
	}

	// list로 꺼내온다(여러명)
	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList");
		sqlSession.close();
		// 결과(rs) 1개 selectOne
		// 결과(rs) 2개 이상 selectList
		return list;
	}

	// list로 꺼내오는것이 아니다(한사람)
	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;

	}

	public void modify(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.modify", map);
		sqlSession.commit();
		sqlSession.close();

	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
	}

	/*
	 * public List<UserDTO> search(UserDTO userDTO) {
	 * 
	 * SqlSession sqlSession = sqlSessionFactory.openSession(); List<UserDTO> list =
	 * sqlSession.selectList("userSQL.search1", userDTO); sqlSession.close();
	 * 
	 * return list;
	 * 
	 * }// getUser
	 */		   
		   //강사님 버전
		   public List<UserDTO> search(Map<String, String> map) {

		      SqlSession sqlSession = sqlSessionFactory.openSession();
		      List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		      sqlSession.close();

		      return list;


}
}

/*
 * 이젠 Mybatis로 DB를 연동하기에 생성자에서의 연동 내용이 바뀐다. DB와 연동떄마다 필요하던 여러 메소드는 모두 사라지고,
 * singtone만 남는다. SqlSessionFactory(Interface라서 직접 생성 불가, 1회만 생성)를 통해
 * Sqlsession(여러번 생성)을 만들어서 진행 매개변수가 너무 많으면 일일이 맞춰주기가 번거롭다. 그래서 build 사용.
 * 안드로이드에서 자주 사용하는 구문이다. 인터넷으로 "자바빌드생성" 검색 및 공부.
 * 
 */