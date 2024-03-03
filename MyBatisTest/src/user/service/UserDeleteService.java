package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		
		Scanner scan = new Scanner(System.in);
		System.out.print("찾고자 하는 아이디 입력 : ");
		String id = scan.next();
		
		//DB-select
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO == null) {
			System.out.println("찾고자 하는 아이디가 없습니다.");
			return; //메소드를 벗어나라
		}
		
		userDAO.delete(id);
		
		System.out.println("회원 정보 삭제 완료");
	}

}





