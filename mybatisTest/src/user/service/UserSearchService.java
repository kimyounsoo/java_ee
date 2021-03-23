package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {
   /*// 내 버전
    * @Override
    * public void execute() {
    * 
    * Scanner scan = new Scanner(System.in); 
    * UserDTO userDTO = new UserDTO();
    * 
    * System.out.println(); 
    * System.out.println("1. 이름 검색");
    * System.out.println("2. 아이디 검색"); 
    * System.out.println("번호 입력 : ");
    * 
    * int num = scan.nextInt();
    * 
    * if(num==1) { 
    * System.out.println("찾고자 하는 이름 입력 : ");
    * userDTO.setName(scan.next()); 
    * }else if(num==2) {
    * System.out.println("찾고자 하는 아이디 입력 : "); 
    * userDTO.setId(scan.next()); 
    * }
    * 
    * 
    * //DB UserDAO userDAO = UserDAO.getInstance();
    * List<UserDTO> list = userDAO.search(userDTO);
    * 
    * //Response
    * System.out.println("이름\t아이디\t비밀번호"); 
    * for(UserDTO dto : list) {
    * System.out.println(dto.getName()+"\t"+dto.getId()+"\t"+dto.getPwd()); 
    * }//for
    * }//execute
    */

   // 강사님 버전
   public void execute() {

      Scanner scan = new Scanner(System.in);
      System.out.println();
      System.out.println("1. 이름 검색");
      System.out.println("2. 아이디 검색");
      System.out.println("번호 입력 : ");

      int num = scan.nextInt();
      
      String columnName = null;
      String value = null;

      if (num == 1) {
         System.out.println("찾고자 하는 이름 입력 : ");
         value = scan.next();
         columnName = "name";
      } else if (num == 2) {
         System.out.println("찾고자 하는 아이디 입력 : ");
         value = scan.next();
         columnName = "id";
      }
      
      Map<String, String> map = new HashMap<String, String>(); 
      map.put("columnName", columnName);
      map.put("value", value);
      
      UserDAO userDAO = UserDAO.getInstance(); 
      List<UserDTO> list = userDAO.search(map);
      
      System.out.println("이름\t아이디\t비밀번호\t");
      for(UserDTO dto : list) {
         System.out.println(dto.getName()+"\t"+dto.getId()+"\t"+dto.getPwd()); 
      }//for
      
}// execute

}// public