<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table {
	border-collapse: collapse;
}

#updateForm div {
	font-size: 8pt;
	font-weight: bold;
	color: red;
}

#updateForm {
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

<form name="updateForm" id="updateForm">
	<table border="1" cellpadding="5">
		<tr>
			<th width="100">이름</th>
			<td>
				<input type="text" name="name" id="name" value="${requestScope.memberDTO.getName() }">
				<div id="nameDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" value="${memberDTO.id }" size="25" readonly="readonly">
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
			<th>재확인</th>
			<td>
				<input type="password" name="repwd" id="repwd" size="30" placeholder="비밀번호 입력">
			</td>
		</tr>
		
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" id="male" name="gender" value="0">
				<label for="male">남자</label>
				<input type="radio" id="female" name="gender" value="1">
				<label for="female">여자</label>
          </td>
        </tr>
        
        <tr>
        	<th>이메일</th>
        	<td>
        		<input type="text" name="email1" value="${memberDTO.email1 }">
        		@
        		<input type="text" name="email2" id="email2" value="${memberDTO.email2 }">
        		
        		<input type="email" name="email3" id="email3" list="email3_list" oninput="change()">
        		<datalist id="email3_list">
        			<option value="직접입력" />
        			<option value="hanmail.com" />
        			<option value="naver.com" />
        			<option value="gmail.com" />
        		</datalist>
        	</td>
        </tr>
        
        <tr>
        	<th>휴대전화</th>
        	<td>
        		<select name="tel1" style="width: 70px;">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="019">019</option>
        		</select>
        		-
        		<input type="text" name="tel2" size="4" maxlength="4" value="${memberDTO.tel2 }">
        		-
        		<input type="text" name="tel3" size="4" maxlength="4" value="${memberDTO.tel3 }">
        	</td>
        </tr>
        
        <tr>
        	<th>주소</th>
        	<td>
        		<input type="text" name="zipcode" id="zipcode" value="${memberDTO.zipcode }" readonly>
        		<button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br/>
        		<input type="text" name="addr1" id="addr1" size="60" value="${memberDTO.addr1 }" readonly><br>
            	<input type="text" name="addr2" id="addr2" size="60" value="${memberDTO.addr2 }">
        	</td>
        </tr>
        
        <tr>
        	<td colspan="2" align="center">
        		<input type="button" value="회원정보수정" id="updateBtn">
        		<input type="reset" value="다시입력" onclick="location.reload()">
        	</td>
        </tr>
	</table>
</form>

<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	//radio는 배열의 값으로 넘어온다. 그래서 남자는 gender[0], 여자는 gender[1]
	document.updateForm.gender['${memberDTO.gender}'].checked = true;
	document.updateForm.tel1.value = '${memberDTO.tel1 }';
}
</script>








