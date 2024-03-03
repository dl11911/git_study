<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ page import="guestbook.dao.GuestbookDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import ="java.util.Date"%>
<%@ page import= " java.text.SimpleDateFormat"%>
<%
	//데이터
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//세션
	String id = (String)session.getAttribute("memId");
	
	
	Map<String,String> map = new HashMap<>();
	map.put("name",name);
	map.put("email",email);
	map.put("homepage",homepage);
	map.put("subject",subject);
	map.put("content",content);
	
	// 현재 시간을 logtime으로 설정
	Date logtime = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String logtimeStr = dateFormat.format(logtime);
	map.put("logtime", logtimeStr);
	
	//DB
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	guestbookDAO.guestbookWrite(map);

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
		location.href = "guestbookList.jsp?pg=1";
	}
	</script>

</body>
</html>