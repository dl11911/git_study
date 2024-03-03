package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// 페이징 처리
		int endNum = pg*5;
		int startNum = endNum - 4;

		BoardDAO boardDAO = BoardDAO.getInstance();
		
		List<BoardDTO> boardDTO =  boardDAO.boardList(startNum, endNum);
		
		//페이징처리
		int totalA = boardDAO.getTotalA(); // 총글수
		int totalP = (totalA + 4) / 5; // 총 페이지 수
		
		HttpSession session = request.getSession();
		session.setAttribute("boardDTO", boardDTO);
		session.setAttribute("totalP", totalP);
		session.setAttribute("pg", pg);
		
		return "/board/board.jsp";
	} // requestPro	
	
} // end class
