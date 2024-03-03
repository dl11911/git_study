//유효성 검사
function checkGuestbookWrite() {


	document.getElementById("nameDiv").innerText = "";
	document.getElementById("emailDiv").innerText = "";
	document.getElementById("homepageDiv").innerText = "";
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";

	if (document.getElementById("name").value == "") {
		document.getElementById("name").focus();
		document.getElementById("nameDiv").innerText = "이름을 입력하세요.";
	}

	else if (document.getElementById("email").value == "") {
		document.getElementById("email").focus();
		document.getElementById("emailDiv").innerText = "이메일을 입력하세요.";
	}

	else if (document.getElementById("homepage").value == "") {
		document.getElementById("homepage").focus();
		document.getElementById("homepageDiv").innerText = "홈페이지를 입력하세요.";
	}

	else if (document.getElementById("subject").value == "") {
		document.getElementById("subject").focus();
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요.";
	}
	else if (document.getElementById("content").value == "") {
		document.getElementById("content").focus();
		document.getElementById("contentDiv").innerText = "내용을 입력하세요.";
	}
	else {
		document.getElementById("guestbookWriteForm").submit();
	}
}