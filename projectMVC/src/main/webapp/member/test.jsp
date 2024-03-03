<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        .table{
            text-align: center;
            margin:10px;
        }
        tbody>tr>td:last-child {
            text-align: left;
        }
        tr.telephone>td>#tel2,#tel3 {
            width: 2.8em;
        }
        
    </style>
</head>
<body>
    <form action="#" method="get" name="inputForm">
        <table class="table" border="1px" style="border-collapse: collapse;">
            <tbody>
                <tr class="name">
                    <td>이름</td>
                    <td><input type="text" name="name" id="name" placeholder="이름 입력"/></td>
                </tr>
                <tr class="id">
                    <td>아이디</td>
                    <td><input type="text" name="id" id="id" placeholder="아이디 입력"/></td>
                </tr>
                <tr class="pwd"> 
                    <td>비밀번호</td>
                    <td><input type="password" name="pwd" id="pwd"/></td>
                </tr>
                <tr class="repwd">
                    <td>재확인</td>
                    <td><input type="password" name="repwd" id="repwd"></td>
                </tr>
                <tr class="gender">
                    <td>성별</td>
                    <td>
                        <label><input type="radio" name="gender" id="0" checked="true">남자</label>
                        <label><input type="radio" name="gender" id="1">여자</label>
                    </td>
                </tr>
                <tr class="email">
                    <td>이메일</td>
                    <td>
                        <label><input type="text" name="email1" id="email1"></label>
                        @
                        <label><input type="email" name="email2" id="email2"></label>
                        <select name="email3" id="email3" onclick="return checkWrite()">
                            <option>직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.com">hanmail.com</option>
                        </select>
                    </td>
                </tr>
                <tr class="telephone">
                    <td>휴대폰</td>
                    <td><select name="tel1" id="tel1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="019">019</option>
                        </select>
                        <input type="text" name="tel2" id="tel2">
                        <input type="text" name="tel3" id="tel3">
                    </td>
                </tr>
                <tr class="address">
                    <td>주소</td>
                    <td>
                        <label><input type="text" name="zipcode" id="zipcode" disabled></label>
                        <input type="button" value="우편번호검색">
                        <br>
                        <label><input type="text" name="addr1" id="addr1" placeholder="주소" disabled></label>
                        <br>
                        <label><input type="text" name="addr2" id="addr2" placeholder="상세주소"></label>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2" align="center"><input type="button" value="회원가입" onclick="checkWrite()">
                                                <input type="reset" value="다시작성" class="myButton">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
    <script type="text/javascript">
        function checkWrite(){
            //유효성 검사1
            if(document.inputForm.name.value == ""){
                alert("이름을 입력하세요.");
            }
            else if(document.inputForm.id.value == ""){
                alert("아이디를 입력하세요.");
            }
            else if(document.inputForm.pwd.value == ""){
                alert("비밀번호를 입력하세요.");
            }

            //유효성 검사2
            if(document.inputForm.pwd.value != document.inputForm.repwd.value){
                alert("비밀번호가 일치하지 않습니다.");
            }
            if(!document.inputForm.email3[0].selected){
                document.inputForm.email2.value = document.inputForm.email3.value;
            } else{
                document.inputForm.email2.value = "";
            }
            return false;
        }
    </script>
</body>
</html>