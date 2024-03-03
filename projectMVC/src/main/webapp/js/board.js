function checkWrite() { // 유효성 검사
	
	if(document.inputForm.subject.value == "") {
		alert("제목을 입력하세요.");
		document.inputForm.subject.focus();
	} else if(document.inputForm.content.value == "") {
		alert("내용을 입력하세요.");
		document.inputForm.content.focus();
	} else {
		document.inputForm.submit();
	} // if-else if-else
	
	return false;
	
} // checkWrite

