<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>

<%
    //데이터
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    
    //세션
    String id = (String)session.getAttribute("memId");
    String name = (String)session.getAttribute("memName");
    String email = (String)session.getAttribute("memEmail");
    
    //BoardDTO에 데이터 설정
    BoardDTO boardDTO = new BoardDTO();
    boardDTO.setId(id);
    boardDTO.setName(name);
    boardDTO.setEmail(email);
    boardDTO.setSubject(subject);
    boardDTO.setContent(content);
    
    //DB - insert
    BoardDAO boardDAO = BoardDAO.getInstance();
    boardDAO.boardWrite(boardDTO); //호출
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
        alert("작성하신 글을 등록하였습니다");
        location.href = "boardList.jsp?pg=1";
    }
    </script>
</body>
</html>
