<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="member.dao.MemberDAO"
	import="member.bean.MemberDTO"
	import="board.dao.BoardDAO"
	import="board.bean.BoardDTO"
%>
    
<%
    //데이터
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
/* 	Map<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("cintent", content); */
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	//DB - insert
	BoardDAO boardDAO = BoardDAO.getInstance();
	MemberDAO memberDAO = MemberDAO.getInstance();
	
	boolean result = boardDAO.boardWrite(boardDTO);

	
	//세션해제
	session.removeAttribute("boardCon");//원하는 세션값만 제거함.
	session.removeAttribute("boarcSub");
	session.removeAttribute("memEmail");
	
	

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
window.onload=function(){
	alert("작성하신 글을 등록하였습니다.");
	location.href = "boardList.jsp?pg=1";
}
</script>
<%--     
<%if (result) {%>
    작성하신 글을 등록하였습니다.
<%} else { %>
	글 등록에 실패하였습니다.
<%} %> --%>

</body>
</html>