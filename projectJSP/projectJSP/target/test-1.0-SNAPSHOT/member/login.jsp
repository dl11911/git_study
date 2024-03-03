
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");


MemberDTO memberDTO = new MemberDTO();

MemberDAO memberDAO = MemberDAO.getInstance();

memberDTO = memberDAO.login(id,pwd); //id,pwd 를 DTO에서 불러와서 DAO에 적용한다

String a=" ";
if(memberDTO != null){
	a = memberDTO.getName();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if (memberDTO == null){
	
	response.sendRedirect("loginFail.jsp");

}else{
	//페이지이동
	/* response.sendRedirect("loginOK.jsp?name="+ URLEncoder.encode(memberDTO.getName(),"UTF-8")+"&id="+id); */
	
	//쿠키 Cookie cookie = new Cookie("쿠키명", "값");
/* 	Cookie cookie = new Cookie("memName", memberDTO.getName());
	cookie.setMaxAge(30*60); //30분
	response.addCookie(cookie); //클리이언트에 저장
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(30*60); //30분
	response.addCookie(cookie2); //클리이언트에 저장 */
	
	//세션
	/* HttpSession session = request.getSession(); - 내장 객체*/ 
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id); 
	session.setAttribute("memEmail", memberDTO.getEmail1());
	
	//페이지 이동
	response.sendRedirect("loginOK.jsp");
	
	
} %>
</body>
</html>

























