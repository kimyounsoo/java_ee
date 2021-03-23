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
	
	private DataSource ds; // 은행여직원 역할
	
	private static BoardDAO instance; // 싱글톤 변수
	
	public BoardDAO() {
		Context context;
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); //Tomcat의 경우에만 앞에 접두사(java:comp/env/)가 붙는다 은행 여직원이 모든 커넥션을 다 가지고 있다
		
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		
	}
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public void boardWrite(Map<String,String> map) {
		//String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,seq_board.currval,0,0,0,0,0,sysdate)";
													//    seq_board.nextrval 해도 먹힌다 순서대로 수행하는것이 아니라 한꺼번에 수행하는거라 맨앞의 seq_board.currval 과 같은 번호로 나온다
		String sql = "insert into board(seq,id,name,email,subject,content,ref) "
				+ " values(seq_board.nextval,?,?,?,?,?,seq_board.nextval)"; // 둘중 아무거나 써도 무관
		
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);//생성
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));

			pstmt.executeUpdate();//실행
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	public List<BoardDTO> getBoardList(int startNum, int endNum){
	      
	      List<BoardDTO> list = new ArrayList<BoardDTO>();
	      /*
	       * String sql="select seq,id,name,email,subject,content,"+
	       * "ref,lev,step,pseq,reply,hit"
	       * +",to_char(logtime,'YYYY.MM.DD') as logtime from board order by seq desc";
	       */ 
	      String sql = "select * from"
	    		  + "(select rownum rn, tt.* from"
	    		  + "(select seq, id, name, email, subject, content," 
	    		  + " ref, lev, step, pseq, reply, hit,"
	    		  + " to_char(logtime, 'YYYY.MM.DD') as logtime from board order by seq desc)tt"
	    		  + ")where rn>=? and rn<=?";
	     
	      try {
	    	 conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, startNum);
	         pstmt.setInt(2, endNum);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            BoardDTO boardDTO = new BoardDTO();
	            
	            //데이터를seq부터 하나씩 다 실어줘야한다 보이는것만 하지말고 13개 전부다
	            boardDTO.setSeq(rs.getInt("seq"));
	            boardDTO.setId(rs.getString("id"));
	            boardDTO.setName(rs.getString("name"));
	            boardDTO.setEmail(rs.getString("email"));
	            boardDTO.setSubject(rs.getString("subject"));
	            boardDTO.setContent(rs.getString("content"));
	            boardDTO.setRef(rs.getInt("ref"));
	            boardDTO.setLev(rs.getString("lev"));
	            boardDTO.setStep(rs.getString("step"));
	            boardDTO.setPseq(rs.getString("pseq"));
	            boardDTO.setReply(rs.getString("reply"));
	            boardDTO.setHit(rs.getString("hit"));
	            boardDTO.setLogtime(rs.getString("logtime"));
	            
	            list.add(boardDTO);
	         }
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	         list = null; //에러 방지차원
	         
	      }finally {
	         try {
	            
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }//boardList
	
	public BoardDTO boardView(int seq){//  boardView.jsp 에서 받아옴
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq=?";
		
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery(); // 한사람 분량
			
			if(rs.next()) { // boardList에서는 리스트에 담아줫지만 여기서는 그냥 보내기만 하면 된다
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
	            boardDTO.setId(rs.getString("id"));
	            boardDTO.setName(rs.getString("name"));
	            boardDTO.setEmail(rs.getString("email"));
	            boardDTO.setSubject(rs.getString("subject"));
	            boardDTO.setContent(rs.getString("content"));
	            boardDTO.setRef(rs.getInt("ref"));
	            boardDTO.setLev(rs.getString("lev"));
	            boardDTO.setStep(rs.getString("step"));
	            boardDTO.setPseq(rs.getString("pseq"));
	            boardDTO.setReply(rs.getString("reply"));
	            boardDTO.setHit(rs.getString("hit"));
	            boardDTO.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	         try {
		            
		            if(rs != null) rs.close();
		            if(pstmt != null) pstmt.close();
		            if(conn != null) conn.close();
		            
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		
		return boardDTO; //boardDTO 리턴
	}
	public int getTotalA(){
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
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
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
			
			pstmt.executeUpdate();//실행
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
}