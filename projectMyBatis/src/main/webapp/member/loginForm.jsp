<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  id="loginForm" method="post" action="login.jsp">
   <table border="1" cellpadding="5" >
      <tr>
         <th width="70">아이디</th>
         <td><input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
         <div id="idDiv"></div></td>
      </tr>
      <tr>
         <th width="70">비밀번호</th>
         <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
         <div id="pwdDiv"></div></td>
      </tr>
	 
  	  <tr>
  	  	 <td style="text-align: center;" colspan="2">
		      <button type="submit">로그인</button>
		      <button type="button" onclick="location.href='writeForm.jsp'">회원가입</button>
		      <!--onclick="location.href='http://localhost:8080/projectJSP/member/writeForm.jsp'"  -->
	     </td>
	  </tr>

	</table>
</form>
</body>
</html>