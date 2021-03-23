package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		//데이터 아이디 입력받고
		System.out.print("수정할 아이디를 입력 : ");
		String id = scan.next();
		
		//DB 한사람분량의 데이터만 꺼내오면된다
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO == null) {
			System.out.println("찾고자 하는 아이디가 존재하지 않습니다.");
			return;
		}
		
		System.out.println("이름\t아이디\t비밀번호");
		System.out.println(userDTO.getName()+"\t"+userDTO.getId()+"\t"+userDTO.getPwd());
		System.out.println();
		
		System.out.println("수정할 이름 입력 : ");
		String name = scan.next();
		System.out.println("수정할 비밀번호 입력 : ");
		String pwd = scan.next();
		
		Map<String,String> map = new HashMap<String,String>(); // userDTO 에 담아도 되고 Map 에 담아도 된다
		map.put("name", name);
		map.put("id", id);
		map.put("pwd", pwd);
		
		userDAO.modify(map);
		System.out.println("두팔짱");
		System.out.println("수정하였습니다.");

	}

}
