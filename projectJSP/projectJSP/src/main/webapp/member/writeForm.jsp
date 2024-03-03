<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
 	table{border-collapse:collapse;  
 	}
 
#writeForm div{
	font-size:8pt;
	font-weight:bold;
	color:red;
} 	
</style>

</head>
<body>
<form  id="writeForm" method="post" action="write.jsp">
   <table border="1" cellpadding="5" >
      <tr>
         <th width="100">이름</th>
         <td><input type="text" name="name" id="name" placeholder="이름 입력">
         <div id="nameDiv"></div></td>
         
         
      </tr>
      <tr>
         <th width="70">아이디</th>
         <td><input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
         <button type="button" onclick="checkId(); return false;">중복 체크</button>
         <div id="idDiv"></div></td>
         
      </tr>
      <tr>
         <th width="70">비밀번호</th>
         <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
         <div id="pwdDiv"></div></td>
         
      </tr>
      <tr>
         <th>재확인</th>
         <td><input type="password" name="repwd"  id ="repwd" placeholder="비밀번호 입력" size="45"></td>
      </tr>
      <tr>
         <th>성별</th>
         <td>
            <input type="radio" id="male" name="gender" value="0" checked="checked">
            <label for="male">남자</label>
            <input type="radio" id="female" name="gender" value="1">
            <label for="female">여자</label>
         </td>
      </tr>
      <tr>
         <th>이메일</th>
         <td><input type="text" name="email1"  size="15">@
         	<input type="text"  size="15" name="email2" id="email2">
         	
         	
         	
	          <select id="email3" style="width:130px;" oninput="change()">
            <option value="">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hanmail.com">hanmail.com</option>
              </select>
          <!-- <input type="email" name="email3" id="email3"  list="email3_list"  oninput="change()" placeholder="직접 입력"> -->
       <!-- <select id="email3"  id="email_list" style="width:130px;"oninput="change()"> -->
         	<!-- <datalist id="email3_list">
         		<option value="">
	         	<option value="naver.com">
	            <option value="gmail.com">
	            <option value="hanmail.com"> 
	            </datalist>
	             -->
          </td>
        </tr>
       
        
   
      <tr>
         <th >휴대폰</th>
         <td><select name="tel1" style="width:70px;" >
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="019">019</option>
               </select> 
               -
         <input type="text" name="tel2" size="4" maxlength="4">
         -
         <input type="text" name="tel3" size="4" maxlength="4"></td>
         
      </tr>
      
      <tr>
         <th>주소</th>
         <td><input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly>
            <button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br>
        <input type="text" id="addr1" name="addr1" size="60"  placeholder="주소"readonly><br>
         <input type="text" id="addr2" name="addr2"  size="60" placeholder="상세주소"></td>
      </tr>
      
      <tr>
	   	<td style="text-align: center;" colspan="2">
	      <input type="button" onclick="checkWrite()" value="회원가입">
	      <input type="reset" value="다시작성">
	   </td>
	</tr>
	
   </table>
 
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="../js/member.js"></script>

</body>
</html>