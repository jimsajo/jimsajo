console.log("join.js 로딩 완료됨!");

let isIdChecked = false; // 중복확인 완료 여부

// 아이디 중복 확인
function checkId() {
  const id = document.getElementById("mId").value.trim();
  const msg = document.getElementById("idCheckResult");
  const idRegex = /^[a-z0-9]+$/;

  if (!id) {
    alert("아이디를 입력하세요.");
    return;
  }

  if (!id || id.length < 8 ||id.length > 16 || !idRegex.test(id)) {
    alert("아이디는 8자리 이상 16자리 이하의 영어 소문자와 숫자만 사용 가능합니다.");
    return;
  }

  if (!idRegex.test(id)) {
    alert("아이디는 영어 소문자와 숫자만 입력할 수 있습니다.");
    return;
  }

  fetch('/checkId?mId=' + encodeURIComponent(id))
    .then(response => response.text())
    .then(result => {
      if (result === 'OK') {
        msg.innerText = "사용 가능한 아이디입니다.";
        msg.style.color = "green";
        isIdChecked = true;
      } else if (result === 'DUPLICATE') {
        msg.innerText = "이미 사용 중인 아이디입니다.";
        msg.style.color = "red";
        isIdChecked = false;
      } else {
        msg.innerText = "오류가 발생했습니다.";
        msg.style.color = "red";
        isIdChecked = false;
      }
    })
    .catch(error => {
      console.error("중복 확인 오류:", error);
      msg.innerText = "중복 확인 중 오류가 발생했습니다.";
      msg.style.color = "red";
      isIdChecked = false;
    });
}

// 아이디 입력 시 중복검사 상태 초기화
document.addEventListener("DOMContentLoaded", function () {
  const idInput = document.getElementById("mId");
  idInput.addEventListener("input", function () {
    isIdChecked = false;
    document.getElementById("idCheckResult").innerText = "";
  });
});

// 회원가입 유효성 검사
function validateForm() {
  let form = document.member || document.querySelector("form"); // name="member" 없을 경우 대비
  let id = form.mId.value.trim();
  let pw = form.mPasswd.value;
  let pwConfirm = form.mPassword.value;
  let name = form.mName.value.trim();
  let gender = form.mGender.value;
  let tel = form.mTel.value.trim();
  let birth = form.mBirth.value;
  let idRegex = /^[a-z0-9]+$/;

  if (!id) {
    alert("아이디를 입력하세요.");
    form.mId.focus();
    return false;
  }

  if (!id || id.length < 8 ||id.length > 16 || !idRegex.test(id)) {
    alert("아이디는 8자리 이상 16자리 이하의 영어 소문자와 숫자만 사용 가능합니다.");
    form.mId.focus();
    return false;
  }

  if (!isIdChecked) {
    alert("아이디 중복 확인을 해주세요.");
    return false;
  }

  if (!pw || pw.length < 8 || pw.length > 12) {
    alert("비밀번호는 8~12자리로 입력해주세요.");
    form.mPasswd.focus();
    return false;
  }

  if (pw !== pwConfirm) {
    alert("비밀번호가 일치하지 않습니다.");
    form.mPassword.focus();
    return false;
  }

  if (!name) {
    alert("이름을 입력하세요.");
    form.mName.focus();
    return false;
  }

  if (!gender) {
    alert("성별을 선택하세요.");
    return false;
  }

  if (!tel) {
    alert("연락처를 입력하세요.");
    form.mTel.focus();
    return false;
  }

  if (!birth) {
    alert("생년월일을 입력하세요.");
    form.mBirth.focus();
    return false;
  }

  return true;
}
