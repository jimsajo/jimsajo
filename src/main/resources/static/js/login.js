function validateForm(){
	let id = login.mId.value;
	let pw = login.mPasswd.value;
	
	if(!id){
		alert("아이디를 입력해주세요.");
		login.mId.focus();
		return false;
	}	
	if(!pw){
		alert("비밀번호를 입력해주세요.");
		login.mPasswd.focus();
		return false;	
	}
	return true;
}
