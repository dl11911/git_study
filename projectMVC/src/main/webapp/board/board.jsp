<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	#currentPaging{
		color:red;
		border:1px solid black;
		font-size:15pt;
		cursor:pointer;
		margin: 5px;
		padding: 5px 8px;
		
	}
	#paging{
		color:black;
		font-size:15pt;
		cursor:pointer;
		margin : 5px;
		padding: 5px;
	}
	
	span {
		border: 1px solid black;
		padding: 7px;
		margin: 10px 10px;
	}
	
	div {
		margin-top:15px;
	}
	
	a {
		text-decoration:none;
	}
	
	a:hover {
		text-decoration:underline;
	}

</style>

</head>
<body>

	<h2><img src="../image/1.jpg" width="60" height="60" alt="kakao" onclick="location.href='../index.do'"></h2>

	<table border="1" cellpadding="7" frame="hsides" rules="rows">
		<thead>
			<tr>
				<th>글번호</th>
				<th>id</th>
				<th>이름</th>
				<th>e-mail</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
		    <c:forEach var="board" items="${boardDTO}">
		        <tr>
		            <th>
		                <c:forEach begin="1" end="${board.lev}">
		                    &emsp;
		                </c:forEach>
		                <c:if test="${board.pseq != 0}"><img src="../image/reply.gif" alt="reply"></c:if>
		                ${board.seq}
		            </th>
		            <th>${board.id}</th>
		            <th>${board.name}</th>
		            <th>${board.email}</th>
		            <th>${board.subject}</th>
		            <td>${board.content}</td>
		            <fmt:parseDate var="parsedDate" value="${board.logtime}" pattern="yyyy-MM-dd HH:mm:ss" />
		            <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		            <td>${board.hit}</td>
		        </tr>
		    </c:forEach>
		 </tbody>
		 
		 <table>
		 	<div style="text-align:center; width:870px; margin-top: 15px;">
			 	<c:forEach var="i" begin="1" end="${totalP}">
			 		<c:choose>
			 			<c:when test="${pg == i}">
			 				<span><a id="currentPaging" href="board.do?pg=${i}">${i}</a></span>
			 			</c:when>
			 			<c:otherwise>
			 				<a id="paging" href="board.do?pg=${i}">${i}</a>
			 			</c:otherwise>
			 		</c:choose>
			 	</c:forEach>
		 	</div>
		 </table>
		
	</table>
	
	<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/board.js"></script>

</body>
</html>