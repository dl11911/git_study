<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>*** 메인화면 ***</h2>
<c:choose>
    <c:when test="${empty sessionScope.memId}">
        <h3><a href="./member/writeForm.jsp" >회원가입</a></h3>
        <h3><a href="./member/loginForm.jsp" >로그인</a></h3>
    </c:when>
    <c:otherwise>
        <h3><a href="./member/logout.jsp" >로그아웃</a></h3>
        <h3><a href="./member/updateForm.jsp" >회원정보수정</a></h3>
        <h3><a href="./board/boardWriteForm.jsp">글쓰기</a></h3>
        <h3><a href="./guestbook/guestbookWriteForm.jsp">방명록 등록</a></h3>
    </c:otherwise>
</c:choose>
<h3><a href="./board/boardList.jsp?pg=1">목록</a></h3>
<h3><a href="./guestbook/guestbookList.jsp?pg=1">방명록 목록</a></h3>
</body>
</html>
