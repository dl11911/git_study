<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
<% 
		//데이터
		String id = (String)session.getAttribute("memId");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.getMemberById(id);
		
		String name ="";
		String email1 = "";
		String email2 = "";
		String tel1 = "";
		String tel2 = "";
		String tel3 = "";
		String zipcode = "";
		String addr1 = "";
		String addr2 = "";

    if(memberDTO !=null){
    	name = memberDTO.getName();
    	email1 = memberDTO.getEmail1();
    	email2 = memberDTO.getEmail2();
    	tel1 = memberDTO.getTel1();
    	tel2 = memberDTO.getTel2();
    	tel3 = memberDTO.getTel3(); 
    	zipcode = memberDTO.getZipcode();
    	addr1 = memberDTO.getAddr1();
    	addr2 = memberDTO.getAddr2();
    	
    	
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
<form  id="updateForm" method="post" action="update.jsp">
   <table border="1" cellpadding="5" >
      <tr>
         <th width="100">이름</th>
         <td><input type="text" name="name" id="name" value="<%= name %>">
         <div id="nameDiv"></div></td>
         
         
      </tr>
      <tr>
         <th width="70">아이디</th>
         <td><input type="text" name="id" id="id" size="30" value="<%= id %>" readonly></td>
         
      </tr>
      <tr>
         <th width="70">비밀번호</th>
         <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
         <div id="pwdDiv"></div></td>
         
      </tr>
      <tr>
         <th>재확인</th>
         <td><input type="password" name="repwd"  id ="repwd" placeholder="비밀번호 입력" size="45">
         <div id="pwdDiv"></div></td>
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
         <td><input type="text" name="email1"  size="15" value="<%= email1 %>">@
         	<input type="text"  size="15" name="email2" id="email2" value="<%= email2 %>">
         	
         	
         	
	          <select id="email3" style="width:130px;" oninput="change()">
            <option value="직접입력">직접입력</option>
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
         <input type="text" name="tel2" size="4" maxlength="4" value="<%= tel2 %>">
         -
         <input type="text" name="tel3" size="4" maxlength="4" value="<%= tel3 %>"></td>
         
      </tr>
      
      <tr>
         <th>주소</th>
         <td><input type="text" id="zipcode" name="zipcode" value="<%= zipcode %>" readonly>
            <button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br>
        <input type="text" id="addr1" name="addr1" size="60"  value="<%= addr1 %>"readonly><br>
         <input type="text" id="addr2" name="addr2"  size="60" value="<%= addr2 %>"></td>
      </tr>
      
      <tr>
	   	<td style="text-align: center;" colspan="2">
	      <input type="button" onclick="checkUpdate()" value="수정 완료">
	      <input type="reset" value="다시작성">
	   </td>
	</tr>
	
   </table>
 
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="../js/member.js"></script>
</body>
</html>