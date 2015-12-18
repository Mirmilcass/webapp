/**
 * 
 */
function cheakEmail(reg_form) {
	if (reg_form.cheak.VALUE == 0) {
		alert("중복 체크를 하지 않으셨습니다");
		return;
	} else
		alert("전송")
}
function openConfirmid(reg_form) {
	// 아이디 입력 검사
	if (reg_form.u_email.value == "") {
		alert("이 메일을 입력하세요");
		return;
	}

	// url 과 사용자 입력 id를 조합합니다.
	url = "idcheck.jsp?email=" + reg_form.u_email.value;

	// 새로운 윈도우를 엽니다.
	open(
			url,
			"confirm",
			"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}