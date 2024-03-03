<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}


#guestbookWriteForm div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<h3>방명록</h3>
	<form id="guestbookWriteForm" method="post" action="guestbookWrite.jsp">
		<table border="1">
			<tr>
				<th width="100" height="30">작성자</th>
				<td><label for="name"></label> <input type="text" name="name"
					id="name" placeholder="작성자 입력" />
					<div id="nameDiv"></div></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><label for="email"></label> <input type="text" name="email"
					id="email" placeholder="이메일 입력" />
					<div id="emailDiv"></div></td>
			</tr>

			<tr>
				<th>홈페이지</th>
				<td><label for="homepage"></label> <input type="text"
					name="homepage" id="homepage" value="https://">
					<div id="homepageDiv"></div></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><label for="subject"></label> <input type="text"
					name="subject" id="subject" placeholder="제목 입력" />
					<div id="subjectDiv"></div></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea style="width: 500px; height: 500px;"
						name="content" id="content"></textarea> <!--<textarea cols="50" rows="15" name="content" id="content"></textarea> -->
					<div id="contentDiv"></div></td>
			</tr>

			<tr>
				<td style="text-align: center;" colspan="2">
				<input type="button" onclick="checkGuestbookWrite()" value="작성하기">
				<input type="reset" value="다시작성">
				<button type="button" onclick="location.href='guestbookList.jsp'">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="../js/guestbook.js"></script>
</body>
</html>

