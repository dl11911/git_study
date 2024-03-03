<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터
	//String id = request.getParameter("id");
	//String name = request.getParameter("name");
	
	
	String name = null;
	String id = null;
	
	//쿠키
	/* Cookie[] ar = request.getCookies(); //특정 쿠키만을 가져오지 못하고, 모든 쿠키들을 가져와야 한다
	if(ar != null){
		for(int i=0; i<ar.length; i++){
			String cookieName = ar[i].getName(); //쿠키명
			String cookieValue = ar[i].getValue(); //쿠키값
			
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName"))
				name = cookieValue;
			if(cookieName.equals("memId"))
				id = cookieValue;
			
		}//for
	} */
	
	//세션
	name = (String)session.getAttribute("memName"); //자식 = (자식)부모 - 형변환
	id = (String)session.getAttribute("memID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		<img src="../image/1.png" width="25" height="25" alt="power" 
			 onclick="location.href='../index.jsp'" style="cursor:pointer;">
		<%=name %>님 로그인 하였습니다.
	    <br><br> <!-- 버튼 밑으로 내리기 -->
	    <input type="button" value="회원정보 수정" button onclick="location.href='updateForm.jsp'">
	    <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	</h3>
</body>
</html>