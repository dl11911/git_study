<%@ page import="guestbook.dao.GuestbookDAO" %>
<%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
	
	//세션
	String id = (String)session.getAttribute("memId");


    //데이터
    String name = request.getParameter("name");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	GuestbookDTO guestbookDTO = new GuestbookDTO();
	guestbookDTO.setName(name);
	guestbookDTO.setEmail(email);
	guestbookDTO.setHomepage(homepage);
	guestbookDTO.setSubject(subject);
	guestbookDTO.setContent(content);
	
	//DB - insert
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	
	boolean result = guestbookDAO.guestbookWrite(guestbookDTO);
	

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
	location.href = "guestbookList.jsp?pg=1";
}
</script>
</body>
</html>