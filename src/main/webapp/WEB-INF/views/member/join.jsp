<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src = /js/join.js></script>
</head>
<body>

<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<form class="form-container" name="member" method="post" action="save" onsubmit="return validateForm()">

  <table class="form-table">
    <tr>
      <td>
        <input type="text" placeholder="아이디" name="mId" id="mId">
        <button type="button" onclick="checkId()">아이디 중복검사</button>
        <span id="idCheckResult" style="margin-left:10px;"></span>
        <input type="hidden" id="idCheckStatus" value="unchecked">
      </td>
    </tr>
    <tr>
      <td><input type="password" placeholder="비밀번호" name="mPasswd" id="mPasswd"></td>
    </tr>
    <tr>
      <td><input type="password" placeholder="비밀번호 확인" name="mPassword"></td>
    </tr>
  </table>

  <div class="form-group">
    <label for="mName">이름<span class="required">●</span></label><br>
    <input id="mName" type="text" name="mName" placeholder="이름을 입력하세요">
  </div>

  <div class="form-group">
    <label>성별<span class="required">●</span></label><br>
    <label><input type="radio" name="mGender" value="M">남자</label>
    <label><input type="radio" name="mGender" value="F">여자</label>
  </div>

  <div class="form-group">
    <label for="mTel">연락처<span class="required">●</span></label><br>
    <input type="text" name="mTel" id="mTel" placeholder="연락처('-' 없이 입력하세요)">
  </div>

  <div class="form-group">
    <label for="mBirth">생년월일</label><br>
    <input type="date" name="mBirth" id="mBirth" placeholder="1990-01-01">
  </div>

  <input type="submit" value="가입하기">

</form>
</body>
</html>
