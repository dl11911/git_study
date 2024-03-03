//유효성 검사
function checkWrite() {
    document.getElementById("nameDiv").innerText = "";
    document.getElementById("idDiv").innerText = "";
    document.getElementById("pwdDiv").innerText = "";

    if(document.getElementById("name").value =="")
        document.getElementById("nameDiv").innerText = "이름 입력";
    else if(document.getElementById("id").value ==""){
        document.getElementById("idDiv").innerText = "아이디 입력";
    } else if (!isDuplicatedChecked) {
        document.getElementById("idDiv").innerText = '중복 확인을 해주세요.';
        return;
    } else if(document.getElementById("pwd").value =="")
        document.getElementById("pwdDiv").innerText = "비밀번호 입력";
    else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
        document.getElementById("pwdDiv").innerText = "비밀번호가 일치하지 않습니다";
    else
        document.getElementById("writeForm").submit();
}

document.getElementById('id').addEventListener('change', function() {
    isDuplicatedChecked = false;
});
	
//이메일
function change(){
	document.getElementById("email2").value = document.getElementById("email3").value;
	
}


//우편 번호
function checkPost(){
    new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
}
var isDuplicatedChecked = false;
function checkId(){
	
	var id= document.getElementById("id").value
	if(id=="") //아이디에 값이 없다면 먼저아이디를입력하세요를 띄우기 
		alert("먼저 아이디를 입력하세요");
	else
		window.open("http://localhost:8080/projectJSP/member/checkId.jsp?id="+id
		,"checkId"
		,"width=450 height=150 left=300 top=300 ");
		
		 isDuplicatedChecked = true;

        alert('중복 확인이 완료되었습니다.');

	
}

function checkUpdate(){
    document.getElementById("pwdDiv").innerText = "";
    
     if(document.getElementById("name").value =="")
        document.getElementById("nameDiv").innerText = "이름 입력";
     else if(document.getElementById("pwd").value =="")
        document.getElementById("pwdDiv").innerText = "비밀번호 입력";
     else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
        document.getElementById("pwdDiv").innerText = "비밀번호가 일치하지 않습니다";
      else
       document.getElementById("updateForm").submit();
}