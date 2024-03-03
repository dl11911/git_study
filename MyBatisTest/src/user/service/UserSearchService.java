package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		int num;
		
		System.out.println();
		System.out.println("******************");
		System.out.println("   1. 이름 검색");
		System.out.println("   2. 아이디 검색");
		System.out.println("******************");
		System.out.print("번호 입력 : ");
		num = scan.nextInt();
		
		String columnName = null;
		String value = null;
		if(num == 1) {
			System.out.print("검색할 이름 입력 : ");
			value = scan.next();
			
			columnName = "name";
			
		}else if(num == 2) {
			System.out.print("검색할 아이디 입력 : ");
			value = scan.next();
			
			columnName = "id";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("columnName", columnName);
		map.put("value", value);
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(map);
		
		//응답
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}//for
		             
	}

}









