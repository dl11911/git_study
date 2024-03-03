<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.dao.MemberDAO"
	import="member.bean.MemberDTO"
%>
<% 
String id=(String)session.getAttribute("memId");

//DB

MemberDAO memberDAO=MemberDAO.getInstance();

MemberDTO memberDTO=memberDAO.getMemberById(id);

if(memberDTO != null){
String email=memberDTO.getEmail1()+"@"+memberDTO.getEmail2(); //이메일 1,2를 한개로 합침
session.setAttribute("memEmail",email);
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<style>
#boardWriteForm div{
	color: red;
	font-size: 8pt;
	font-weight: bold;

}
</style>
</head>
<body>
<h3>글쓰기</h3>

<form id="boardWriteForm" method="post" action="boardWrite.jsp">
	<table border="1" >
	            <tr>
	            	<th width="100" height="50">제목</th>
	                <td>    
	                	<label for="subject"></label>
		                <input type="text" name="subject" id="subject" placeholder="제목 입력" />
		                <div id="subjectDiv"></div>
	               </td>
	            </tr>
	        	
	            <tr>
	                <th>내용</th>
	                <td>   
	                   	<textarea style="width: 500px; height: 500px;" name="content" id="content"></textarea>
	                   <!--<textarea cols="50" rows="15" name="content" id="content"></textarea> -->
	                   	<div id="contentDiv"></div>
	                </td>
				</tr>
				
	        	<tr>
		        	<td style="text-align: center;" colspan="2">
		        		<input type="button" onclick="checkBoardWrite()" value="작성하기">
			    	    <input type="reset" value="다시작성">
		        	</td>
	        	</tr>
	</table>
</form>
<script type="text/javascript" src="../js/board.js"></script>
</body>
</html>