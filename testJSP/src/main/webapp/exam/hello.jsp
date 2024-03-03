<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//전역변수,1번만 실행
 String name= "홍길동";
int age=25;
%>


<%
//요청시마다 실행
age++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Hello JSP!! <br> -->

<%--안녕하세요 JSP<br> --%>

나의 이름은 <%=name %> 입니다.<br>
<%out.println("나의 이름은 " + name +" 입니다."); %> <br><%--out 내장객체 --%>

<!--  내 나이는 <%=age  %>살 입니다 <br>-->

<%-- <% out.println("내 나이는 " + age + "살 입니다"); --%>

</body>
</html>