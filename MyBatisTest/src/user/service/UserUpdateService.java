package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

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
		
		System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		System.out.println();
		
		System.out.print("수정할 이름 입력 : ");
		String name = scan.next();
		System.out.print("수정할 비밀번호 입력 : ");
		String pwd = scan.next();
		
		userDTO.setName(name);
		userDTO.setPwd(pwd);
		
		userDAO.update(userDTO);
		
		System.out.println("회원 정보 수정 완료");
		
	}

}










