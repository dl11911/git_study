<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
    //데이터
    String id = request.getParameter("id"); 
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String gender = request.getParameter("gender");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");
    String zipcode = request.getParameter("zipcode");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");

    MemberDTO memberDTO = new MemberDTO(); 
    memberDTO.setId(id);
    memberDTO.setName(name);
    memberDTO.setPwd(pwd);
    memberDTO.setGender(gender);
    memberDTO.setEmail1(email1);
    memberDTO.setEmail2(email2);
    memberDTO.setTel1(tel1);
    memberDTO.setTel2(tel2);
    memberDTO.setTel3(tel3);
    memberDTO.setZipcode(zipcode);
    memberDTO.setAddr1(addr1);
    memberDTO.setAddr2(addr2);


    //DB - Update
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean su =  memberDAO.updateMember(memberDTO); 
    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su){ %>
    수정이 완료되었습니다.
<button onclick="location.href='loginForm.jsp'">로그인 하기</button>

<%}else{ %>
    수정이 불가능 합니다.<br>
    다시 작성해주세요.

<%} %>

</body>
</html>
