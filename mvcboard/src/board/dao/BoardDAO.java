package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private DataSource ds;

	private static BoardDAO instance;

	public BoardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public void boardWrite(Map<String, String> map) {
		String sql = "insert into board(seq,id,name,email,subject,content,ref) "
				+ " values(seq_board.nextval,?,?,?,?,?,seq_board.nextval)";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));

			pstmt.executeUpdate();// 실행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from" + "(select rownum rn, tt.* from"
				+ "(select seq, id, name, email, subject, content," + " ref, lev, step, pseq, reply, hit,"
				+ " to_char(logtime, 'YYYY.MM.DD') as logtime from board order by ref desc, step asc)tt"
				+ ")where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));

				list.add(boardDTO);
			} // while
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public BoardDTO boardView(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq=?";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));

			} // if
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return boardDTO;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			totalA = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return totalA;
	}

	public void hitUpdate(int seq) {
		String sql = "update board set hit=hit+1 where seq=?";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void boardReply(Map<String, String> map) {
		// step 은 넣을때마다 바뀌므로 변경.
		String step_sql = "update board set step=step+1 where ref=? and step>?";
		// 해당 답글을 DB 넣는 친구에 대한 구문
		String sql = "insert into board values(seq_board.nextval" + ", ?"// 아이디
				+ ", ?"// 이름
				+ ", ?"// 이메일
				+ ", ?"// 제목
				+ ", ?"// 내용
				+ ", ?" // 그룹번호 - 원글의 ref 따라간다
				+ ", ?" // 단계- 원글의 lev + 1
				+ ", ?" // 글순서 원글 step + 1
				+ ", ?" // pseq
				+ ", 0"// 답글수
				+ ", 0"// 조회수
				+ ", sysdate)";
		// reply도 집어넣을때마다 수가 바뀌므로 변경.
		String reply_sql = "update board set reply=reply+1 where seq=?";

		// seq 입력해서 원글 가져오기 - boardView는 int만 받고, map은 String만 받으니 형변환
		BoardDTO pDTO = boardView(Integer.parseInt(map.get("pseq")));

		try {
			conn = ds.getConnection();

			// step update
			pstmt = conn.prepareStatement(step_sql); // sql문 3가지 step_sql, sql, reply_sql
			pstmt.setInt(1, pDTO.getRef()); // 원글ref
			pstmt.setInt(2, pDTO.getStep()); // 원글step
			pstmt.executeUpdate();
			pstmt.close(); // 이렇게 끊어줘야 새로 생성할수있다

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));
			pstmt.setInt(6, pDTO.getRef()); // 원글ref map에 없는친구
			pstmt.setInt(7, pDTO.getLev() + 1); // 원글lev + 1 map에 없는친구
			pstmt.setInt(8, pDTO.getStep() + 1);// 원글step + 1 map에 없는친구
			pstmt.setInt(9, Integer.parseInt(map.get("pseq")));
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setInt(1, Integer.parseInt(map.get("pseq"))); // 원글번호

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void boardModify(Map<String, Object> map) {
		String sql = "update board set subject=?, content=?, logtime=sysdate where seq=?";

		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("subject").toString());// map은 object 로보내기때문에 subject는 String이라 형변환 해준다
			pstmt.setString(2, (String)map.get("content"));// 두가지방법의 형변환
			pstmt.setInt(3, (Integer) map.get("seq")); // 마찬가지로 int로 형변환

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void boardDelete(int seq) {
		String sql = "";

		try {
			conn = ds.getConnection();
			// 원글을 찾아서 답글수(reply) 감소
			sql = "update board set reply=reply-1 where seq = (select pseq from board where seq=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();

			// 답글을 찾아서 subject를 수정
			sql = "update board set subject=concat('[원글이 삭제된 답글]',subject) where pseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();

			// 삭제
			sql = "delete from board where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
