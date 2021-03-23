package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class StudentTeacher {
	private Scanner scan = new Scanner(System.in);
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	public StudentTeacher() {
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
	
	
	public void menu() {
		int num;
		while(true) {
			System.out.println();
			System.out.println("*************");
			System.out.println("   1. 입력");
			System.out.println("   2. 검색");
			System.out.println("   3. 삭제");
			System.out.println("   4. 종료");
			System.out.println("*************");
			System.out.print("     번호 : ");
			num = scan.nextInt();
			if(num==4) break;
			
			if(num==1) insertArticle();
			else if(num==2) selectArticle();
			else if(num==3) deleteArticle();
		}//while
		
	}//menu()

	private void selectArticle() {
		int num;
		String name = null;
		
		while(true) {
			System.out.println();
			System.out.println("*************");
			System.out.println("   1. 이름검색");
			System.out.println("   2. 전체검색");
			System.out.println("   3. 이전메뉴");
			System.out.println("*************");
			System.out.print("     번호 : ");
			num = scan.nextInt();
			if(num==3) break;
			
			//데이터
			if(num==1) {
				System.out.print("검색 할 이름 입력 : ");
				name = scan.next();
			}
			
			//DB
			getConnection();
			String sql = null;
			if(num == 1)
				sql = "select * from student where name like ?";
			else if(num == 2)
				sql = "select * from student";
			
			try {
				pstmt = conn.prepareStatement(sql);
				if(num==1) pstmt.setString(1, "%"+name+"%");
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					System.out.print("이름="+rs.getString("name")+"\t");
					
					if(rs.getInt("code")==1)
						System.out.println("학번="+rs.getString("value"));
					
					else if(rs.getInt("code")==2)
						System.out.println("과목="+rs.getString("value"));
					
					else if(rs.getInt("code")==3)
						System.out.println("부서="+rs.getString("value"));
				}//while
				
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
				
			
		}//while
		
	}//selectArticle()

	private void insertArticle() {
		int num;
		String name, value=null;
		int code=0;
		
		while(true) {
			System.out.println();
			System.out.println("*************");
			System.out.println("   1. 학생");
			System.out.println("   2. 교수");
			System.out.println("   3. 관리자");
			System.out.println("   4. 이전메뉴");
			System.out.println("*************");
			System.out.print("     번호 : ");
			num = scan.nextInt();
			if(num==4) break;
			
			//데이터
			System.out.print("이름 입력 : ");
			name = scan.next();
			if(num==1) {
				System.out.print("학번 입력 : ");
				value = scan.next();
				code = 1;
				
			}else if(num==2) {
				System.out.print("과목 입력 : ");
				value = scan.next();
				code = 2;
				
			}else if(num==3) {
				System.out.print("부서 입력 : ");
				value = scan.next();
				code = 3;
			}
			
			//DB-insert
			this.getConnection(); //접속
			String sql = "insert into student values(?,?,?)";
			
			try {
				pstmt = conn.prepareStatement(sql);//생성
				pstmt.setString(1, name);
				pstmt.setString(2, value);
				pstmt.setInt(3, code);
				
				int su = pstmt.executeUpdate();//실행
				
				System.out.println(su+"행이 삽입되었습니다");
				
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
		}//while
		
	}//insertArticle()
	private void deleteArticle() {
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 이름 입력 : ");
		String name = scan.next();
		getConnection();
		String sql = "delete student where name = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int su = pstmt.executeUpdate();
			System.out.println(su+"개의 행이 삭제 되었습니다.");
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	public static void main(String[] args) {
		new Student().menu();
		System.out.println("프로그램을 종료합니다");
	}

}
















