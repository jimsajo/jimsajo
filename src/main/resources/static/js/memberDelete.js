document.addEventListener("DOMContentLoaded", function () {
  const deleteForm = document.querySelector("#deleteModal form");

  deleteForm.addEventListener("submit", function (e) {
    const passwordInput = deleteForm.querySelector("input[name='password']");
    const password = passwordInput.value.trim();

    if (!password) {
      e.preventDefault(); // 전송 막기
      alert("비밀번호를 입력해주세요.");
      passwordInput.focus();
    }
  });
});
