console.log("join.js 로딩 완료됨!");

let isIdChecked = false; // 중복확인 완료 여부

// 아이디 정규식: 영어 소문자와 숫자만 허용 (8~16자)
const idRegex = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{8,16}$/;


// 비밀번호 정규식: 영어 소문자와 숫자만 허용 (8~12자)
const pwRegex = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{8,12}$/;

// 아이디 중복 확인
function checkId() {
  const id = document.getElementById("mId").value.trim();
  const msg = document.getElementById("idCheckResult");

  if (!id) {
    alert("아이디를 입력하세요.");
    return;
  }

  if (!idRegex.test(id)) {
    alert("아이디는 영어 소문자와 숫자를 모두 포함한 8~12자여야 합니다.");
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

function validateForm() {
  let form = document.member || document.querySelector("form");
  let id = form.mId.value.trim();
  let pw = form.mPasswd.value;
  let pwConfirm = form.mPassword.value;
  let name = form.mName.value.trim();
  let gender = form.mGender.value;
  let tel = form.mTel.value.trim();
  let birth = form.mBirth.value;

  // 아이디 유효성 검사
  if (!id) {
    alert("아이디를 입력하세요.");
    form.mId.focus();
    return false;
  }

  if (
    id.length < 8 || id.length > 16 ||                 // 8~16자
    !/^[a-z][a-z0-9]*$/.test(id)                       // 영어로 시작 + 영어+숫자만 가능
  ) {
    alert("아이디는 영어 소문자만 입력하거나 영어+숫자의 조합으로 8~16자여야 합니다.");
    form.mId.focus();
    return false;
  }

  if (!isIdChecked) {
    alert("아이디 중복 확인을 해주세요.");
    return false;
  }

  // 비밀번호 유효성 검사
  if (
    pw.length < 8 || pw.length > 12 ||
    !/^[a-z0-9]+$/.test(pw) ||     // 영어+숫자로만 구성
    !/[a-z]/.test(pw) ||           // 영어 포함
    !/[0-9]/.test(pw)              // 숫자 포함
  ) {
    alert("비밀번호는 영어 소문자와 숫자를 모두 포함한 8~12자여야 합니다.");
    form.mPasswd.focus();
    return false;
  }

  if (pw !== pwConfirm) {
    alert("비밀번호가 일치하지 않습니다.");
    form.mPassword.focus();
    return false;
  }

  // 이름
  if (!name) {
    alert("이름을 입력하세요.");
    form.mName.focus();
    return false;
  }

  // 성별
  if (!gender) {
    alert("성별을 선택하세요.");
    return false;
  }

  // 전화번호 유효성 검사
  if (!tel) {
    alert("연락처를 입력하세요.");
    form.mTel.focus();
    return false;
  }

  if (!/^[0-9]+$/.test(tel)) {
    alert("연락처에는 숫자만 입력할 수 있으며, '-' 기호는 사용할 수 없습니다.");
    form.mTel.focus();
    return false;
  }

  // 생년월일
  if (!birth) {
    alert("생년월일을 입력하세요.");
    form.mBirth.focus();
    return false;
  }

  return true;
}

