<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
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

<div id="nav">
	<h3>
		<p><a href="/projectMVC/board/boardWriteForm.do">글쓰기</a></p>
		<p><a href="/projectMVC/board/boardList.do?pg=1">목록</a></p>
		<p><a href="#">글수정</a></p>
	</h3>
</div>











