<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">
	table{
	border-collapse:collapse;
	}
	table, th, td {
		border: 2px solid black;
	}#guestbookWriteForm div{
	color:red;
	font-size:8pt;
	font-weight:bold;
	}
</style>
</head>
<body>
<form id="guestbookWriteForm" method="post" name="guestbookWriteForm" action="guestbookWrite.jsp">
<h3>방명록</h3>
	<table border="1" cellpadding="7">
		<tr>
			<th width="100">작성자</th>
				<td>
					<input type="text" name="name" id="name" placeholder="작성자 입력" size="45">
					<div id="nameDiv"></div>
				</td>
		</tr>	
		
		<tr>
			<th width="100">이메일</th>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일 입력" size="45">
					<div id="emailDiv"></div>
				</td>
		</tr>	
		
		<tr>
			<th width="100">홈페이지</th>
				<td>
					<input type="text" name="homepage" id="homepage" value ="http://" size="45">
					<div id="homepageDiv"></div>
				</td>
		</tr>	
		
		
		<tr>
			<th width="100">제목</th>
				<td>
					<input type="text" name="subject" id="subject" placeholder="제목 입력" size="45">
					<div id="subjectDiv"></div>
				</td>
		</tr>	
		
		<tr>
		
			<th > 내용</th>
			<td >
				<textarea rows="5" cols="50" name="content" id="content"></textarea>
			<div id="contentDiv"></div>
			</td>
		</tr>
		
		<tr>
		<td align="center" colspan="2" >
			<input type="button" onclick="checkGuestbookWrite()" value="글작성">
			<input type="reset" value="다시작성">
			<input type="button" onclick="location.href='./guestbookList.jsp?pg=1'" value="글목록">
		 </td>
		</tr>	
	</table>
</form>

<script >
function checkGuestbookWrite(){
	document.getElementById("nameDiv").innerText="";
	document.getElementById("emailDiv").innerText="";
	document.getElementById("homepageDiv").innerText="";
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	
	if (document.getElementById("name").value == "") {
		document.getElementById("nameDiv").innerText = "작성자 입력";
		
	} else if (document.getElementById("email").value == "") { 
		document.getElementById("emailDiv").innerText = "이메일 입력"	
		
	} else if (document.getElementById("homepage").value == "") { 
		document.getElementById("homepageDiv").innerText = "홈페이지 입력"	
		
	} else if (document.getElementById("subject").value == "") { 
		document.getElementById("subjectDiv").innerText = "제목 입력"	
		
	} else if (document.getElementById("content").value == "") { 
		document.getElementById("contentDiv").innerText = "내용 입력"	
	}else {
		document.getElementById("guestbookWriteForm").submit();
	}
}
</script>
</body>
</html>







