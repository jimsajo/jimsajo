console.log("✅ JS 파일 로딩됨");

function validateForm(form) {
  console.log("✅ validateForm 실행됨");

  let currentPw = form.currentPasswd.value;
  let newPw = form.newPasswd.value;
  let pwConfirm = form.passwdConfirm.value;
  let tel = form.mTel.value;
  
  if (!currentPw) {
    alert("비밀번호를 입력해주세요.");
    form.currentPasswd.focus();
    return false;
  }

  if (!newPw) {
    alert("새로운 비밀번호를 입력해주세요.");
    form.newPasswd.focus();
    return false;
  }

  if (newPw.length < 8 || newPw.length > 12) {
    alert("비밀번호는 8~12자리로 입력해주세요.");
    form.newPasswd.focus();
    return false;
  }

  if (newPw !== pwConfirm) {
    alert("비밀번호가 일치하지 않습니다.");
    form.passwdConfirm.focus();
    return false;
  }
 
  if(!tel){
	alert("전화번호를 입력해주세요.")
	form.mTel.focus();
	return false;
  }
  return true;
}
