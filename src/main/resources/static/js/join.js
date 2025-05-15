
let isIdChecked = false; // 중복확인 완료 여부

function checkId() {
  const id = document.getElementById("mId").value.trim();
  const msg = document.getElementById("idCheckResult");
  const idRegex = /^[a-z0-9]+$/;

  if (!id) {
    alert("아이디를 입력하세요.");
    return;
  }

  if (id.length > 12) {
    alert("아이디는 12자리 이하로 입력해주세요.");
    return;
  }

  if (!idRegex.test(id)) {
    alert("아이디는 영어 소문자와 숫자만 입력할 수 있습니다.");
    return;
  }

  // 중복 검사 fetch 요청
  fetch('/checkId?mId=' + encodeURIComponent(id))
    .then(response => response.text())
    .then(result => {
      if (result === 'OK') {
        alert("사용가능한 아이디 입니다.")
        isIdChecked = true;
      } else if (result === 'DUPLICATE') {
    	alert("이미 사용중인 아이디 입니다.")  
        isIdChecked = false;
      } else {
        msg.innerText = "오류가 발생했습니다.";
        msg.style.color = "red";
        isIdChecked = false;
      }
    })
    .catch(error => {
      console.error("중복 확인 오류:", error);
      isIdChecked = false;
    });
}

// 회원가입 유효성 검사에서 중복확인 여부 확인
function validateForm() {
  const form = document.member;
  const id = form.mId.value.trim();
  const pw = form.mPasswd.value;
  const pwConfirm = form.mPassword.value;
  const name = form.mName.value;
  const gender = form.mGender.value;
  const tel = form.mTel.value;
  const idRegex = /^[a-z0-9]+$/;

  if (!id) {
    alert("아이디를 입력하세요.");
    return false;
  }

  if (id.length > 12 || !idRegex.test(id)) {
    alert("아이디는 12자리 이하의 영어 소문자와 숫자만 사용 가능합니다.");
    return false;
  }

  if (!isIdChecked) {
    alert("아이디 중복 확인을 해주세요.");
    return false;
  }

  if (!pw || pw.length < 8 || pw.length > 12) {
    alert("비밀번호는 8~12자리로 입력해주세요.");
    return false;
  }

  if (pw !== pwConfirm) {
    alert("비밀번호가 일치하지 않습니다.");
    return false;
  }

  if (!name) {
    alert("이름을 입력하세요.");
    return false;
  }

  if (!gender) {
    alert("성별을 선택하세요.");
    return false;
  }

  if (!tel) {
    alert("연락처를 입력하세요.");
    return false;
  }

  return true;
}
