package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MainService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		String id = request.getParameter("id");
		
		System.out.println(id);
		
		if(id == null) {
			return "index.jsp";
		} // if
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.getMember(id);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		
		return "index.jsp";
		
	} // requestPro

} // end class
