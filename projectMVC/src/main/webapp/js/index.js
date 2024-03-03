// 이름 유효성 검사
function checkName() {
    var name = document.getElementById('inputName').value;

    if(name == "") {
        document.getElementById('nameError').innerHTML = "이름을 입력해주세요."
        return false;
    } else {
        document.getElementById('nameError').innerHTML = ""
        return true;
    } // if-else

} // checkName


// 비밀번호 유효성 검사
function checkPassword() {
    var password = document.getElementById('inputPassword').value;
    var passwordConfirm = document.getElementById('inputPasswordConfirm').value;

    if(password != passwordConfirm) {
        document.getElementById('passwordError2').innerHTML = "비밀번호가 일치하지 않습니다.";
        return false;
    } else if(password == "" || passwordConfirm == "") {
        document.getElementById('passwordError1').innerHTML = "비밀번호를 입력해주세요.";
        return false;
    } else {
        document.getElementById('passwordError1').innerHTML = "";
        document.getElementById('passwordError2').innerHTML = "";
        return true;
    } // if-else if-else

} // checkPassword

//이메일
function checkEmail(){
	document.getElementById("email2").value = document.getElementById("email3").value;
} // change


//우편번호
function searchPost() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}




// 초기화
function resetForm() {
    document.myForm.reset();
} // resetForm