<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<div id="section">
	<input  type="text" id="seq" value="${seq }">
	<input  type="text" id="pg" value="${pg }">
	<table border="1" cellpadding="7" frame="hsides" rules="rows">
		<tr>
			<th height="100" colspan="3">
			<font size="7"><span id="subjectSpan">0</span></font>
			
		</tr>
	
		<tr>
			<td align="center" width="200">글번호:<span id="seqSpan">0</span></td>
			<td align="center" width="200">작성자:<span id="idSpan">0</span></td>
			<td align="center" width="200">조회수:<span id="hitSpan">0</span></td>
		</tr>
		
		<tr>
			<td height="300" valign="top" colspan="3">
				<span id="contentSpan" >0</span>
			</td>
		</tr>
	</table> 
	
	<input type="button" value="목록"
			onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
	<input type="button" value="글수정" id="boardUpdateFormBtn">
	<input type="button" value="글삭제">
</div>

<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardView.js"></script>

</div>










