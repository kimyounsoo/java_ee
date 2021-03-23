package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService{

   @Override
   public void execute() {
      Scanner scan=new Scanner(System.in);
      System.out.print("삭제할 아이디 입력 : ");
      String id=scan.next();
      
      UserDAO userDAO=UserDAO.getInstance();
      UserDTO userDTO=userDAO.getUser(id);
      
      if (userDTO == null) {
         System.out.println("찾고자하는 아이디가 존재하지 않습니다.");
         return;
      }
      
      userDAO.delete(id);
      
      System.out.println("삭제하였습니다.");
   }

}