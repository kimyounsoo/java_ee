package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateTest {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public UpdateTest() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticle() {
		//데이터
		Scanner scan = new Scanner(System.in);
		System.out.print("수정 할 이름 입력 : ");
		String name = scan.next();
		
		//DB
		getConnection();
		String sql = "update dbtest set age=age+1 where name like ?";
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);//생성
			
			pstmt.setString(1, "%"+name+"%");//?에 데이터를 주입
			
			int su = pstmt.executeUpdate();//실행
			
			System.out.println(su+"개의 행을 수정하였습니다");
			
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

	public static void main(String[] args) {
		UpdateTest ut = new UpdateTest();
		ut.updateArticle();

	}

}










