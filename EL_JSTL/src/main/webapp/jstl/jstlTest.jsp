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
	<h3>*** 변수 설정 ***</h3>
	<c:set var="name" value="홍길동"/>
	
	나의 이름은 ${name }입니다<br>
	내 나이는 <c:out value="${age }"/> 살 입니다<br>
	나의 키는 ${height }cm 입니다<br>
	
	<h3>*** forEach ***</h3>
	<c:forEach var="i" begin="1" end="10" step="1"> <%-- for(int i=1; i<=10; i++) --%>
		${i} &emsp;	
		<c:set var="sum" value="${sum+i }"></c:set>						<%--sum = sum +i  --%>
		
	</c:forEach>
	<br>
	1~10까지의 합 = ${sum }
		
	<br><br>
	<c:forEach var="i" begin="1" end="10" step="1"> <%-- for(int i=1; i<=10; i++) --%>
		${11-i} &emsp;	
	</c:forEach>
		<h3>*** forToken ***</h3>
		<c:forTokens var="car" items="소나타,아우디,페라리,벤츠,링컨" delims=",">
			${car }<br>
		</c:forTokens>
		
		
	
	
</body>
</html>





