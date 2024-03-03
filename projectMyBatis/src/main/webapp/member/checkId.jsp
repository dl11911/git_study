<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO" %>
<%@ page import = "member.dao.MemberDAO" %>    
<%
	String id =	request.getParameter("id");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean exist = memberDAO.isExistId(id);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(exist){%>
	<form action="checkId.jsp">
		<font color="red"><strong>선택하신 아이디 <%=id %>은 사용 불가능</strong></font>
		<br><br>
		아이디 <input type="text" name="id">
		<input type="submit" value="중복체크">
	</form>
	
<%}else{ %>
	<font color="blue"><strong>선택하신 아이디 <%=id %>은 사용 가능</strong></font>
	<br><br>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<%} %>

<script type="text/javascript">
function checkIdClose(id) {
	opener.document.getElementById("id").value = id;
	window.close();
	opener.document.getElementById("pwd").focus();
}
</script>
</body>
</html>