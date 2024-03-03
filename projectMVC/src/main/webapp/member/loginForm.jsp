<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table {
	border-collapse: collapse;
}

#loginForm div {
	font-size: 8pt;
	font-weight: bold;
	color: red;
}

#loginForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
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

<form name="loginForm" id="loginForm">
	<table border="1" cellpadding="5">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" size="25" placeholder="아이디 입력">
				<div id="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="로그인" id="loginBtn">
				<input type="reset" value="회원가입" onclick="location.href='writeForm.jsp'">
			</td>
		</tr>
	</table>
	
	<div id="loginResult" style="padding: 10px;"></div>
</form>

<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(){
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val() == '')
		$('#idDiv').text('아이디 입력');
	else if($('#pwd').val() == '')
		$('#pwdDiv').text('비밀번호 입력');
	else
		$.ajax({
			type: 'post',
			url: '/projectMVC/member/login.do',
			//data: 'id='+$('#id').val()+'&pwd='+$('#pwd').val()
			data: {'id': $('#id').val(), 'pwd': $('#pwd').val()},
			dataType: 'text',
			success: function(data){
				//alert(data);
				data = data.trim();
				
				if(data == 'ok'){
					location.href = '/projectMVC/index.jsp';
					
				}else if(data == 'fail'){
					$('#loginResult').text('아이디 또는 비밀번호가 틀렸습니다.');
					$('#loginResult').css('font-size', '12pt');
				}
			},
			error: function(e){
				console.log(e);
			}
		});
});
</script>










