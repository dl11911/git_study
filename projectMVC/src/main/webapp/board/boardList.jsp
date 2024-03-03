<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#currentPaging {
	border: 1px solid black;
	color: red;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px 8px;
}
#paging {
	color: black;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px;
}
span:hover {
	text-decoration: underline;
}

.boardListDiv {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}
.subjectA:link {color:black; text-decoration:none;} 
.subjectA:visited {color:black; text-decoration:none;} 
.subjectA:hover {color:black; text-decoration:none;} 
.subjectA:active {color:black; text-decoration:none;} 




#container {
	margin: auto;
	width: 1100px;
	height: 500px;
}

#container:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

#nav {
	margin-left: 10px;
	width: 25%;
	height: 100%;
	float: left;
}

#section {
	width: 70%;
	height: 100%;
	float: left;
}
</style>

<div id="header" style="text-align: center;">
	<h1>
		<a href="/projectMVC/index.jsp">
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"></a>
		MVC를 활용한 미니 프로젝트
	</h1>
</div>
<hr style="border-color: yellowgreen;">

<div id="container">
	
	<jsp:include page="../main/boardMenu.jsp" />
	
	<input type="text" id="pg" value="${pg }">
	<input type="text" id="memId" value="${memId }">
	
	
	<div id="section" class="boardListDiv">
		<table border="1" cellpadding="7" frame="hsides" rules="rows" id="boardListTable">
			<tr>
				<th width="100">글번호</th>
				<th width="300">제목</th>
				<th width="150">작성자</th>
				<th width="100">조회수</th>
				<th width="150">작성일</th>
			</tr>
			
				<!-- 동적 처리 -->
			
					<%-- <tr>
						<td align="center"></td>
						<td></td>
						<td align="center"></td>
						<td align="center">
							<fmt:formatDate value="" pattern="YYYY.MM.dd."/>
						</td>
						<td align="center"></td>
					</tr> --%>
		</table>
		<div id="boardPagingDiv" style="text-align: center; width: 870px; margin-top: 15px;">
			
		</div>
	</div>
</div>	

<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardList.js">
	
</script>
    
<script type="text/javascript">
function boardPaging(pg) {
	location.href = "/projectMVC/board/boardList.do?pg=" + pg;
}
</script>











