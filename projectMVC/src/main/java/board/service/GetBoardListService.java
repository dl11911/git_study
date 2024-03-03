package board.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB
		int endNum = pg*5;
		int startNum = endNum - 4;
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		List<BoardDTO> list =  boardDAO.boardList(startNum, endNum);
		
		//페이징처리
		int totalA = boardDAO.getTotalA(); // 총글수
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		//List => JSON 변환
		JSONObject json = new JSONObject();
		
		if(list !=null) {
			JSONArray array = new JSONArray();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.");
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq",boardDTO.getSeq());
				temp.put("id",boardDTO.getId());
				temp.put("name",boardDTO.getName());
				temp.put("email",boardDTO.getEmail());
				temp.put("subject",boardDTO.getSubject());
				temp.put("content",boardDTO.getContent());
				temp.put("ref",boardDTO.getRef());
				temp.put("lev",boardDTO.getLev());
				temp.put("step",boardDTO.getStep());
				temp.put("pseq",boardDTO.getPseq());
				temp.put("reply",boardDTO.getReply());
				temp.put("hit",boardDTO.getHit());
				temp.put("logtime",sdf.format(boardDTO.getLogtime()));//Date => String 변환 
				
				
				array.add(temp);
			}//for
			
			json.put("list", array);
		}//if
		
		
		//BoardPaging = > JSON 변환
		//json.put("pagingHTML", boardPaging.getPagingHTML() + "");//StringBuffer = > String 변환
		json.put("pagingHTML",boardPaging.getPagingHTML().toString());
		
		//세션
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		
		request.setAttribute("memId", memId);
		request.setAttribute("json",json);
		return "/board/getBoardList.jsp";
	}

}