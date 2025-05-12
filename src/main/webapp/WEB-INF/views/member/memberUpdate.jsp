<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<form class="form-container" name = "member" method = "post" action = "save" >
    <!-- 상단 테이블 3 input -->
    <table class="form-table">
      <tr>
        <td><input type="text" placeholder="아이디" name = "mId" id = "mId" required>
      </tr>
      <tr>
        <td><input type="password" placeholder="비밀번호" name = "mPasswd" id = "mPasswd"></td>
      </tr>
      <tr>
        <td><input type="password" placeholder="비밀번호 확인" name = "mPassword"></td>
      </tr>
    </table>

    <!-- 이름 -->
    <div class="form-group">
      <label for="mName">이름<span class="required">●</span></label><br>
      <input id="mName" type="text" name = "mName" id = "mName" placeholder="이름을(를) 입력하세요" >
    </div>

    <!-- 성별 -->
    <div class="form-group">
      <label>성별<span class="required">●</span></label>
      <div class="radio-group">
        <label><input type="radio" name="mGender" value="M">남자</label><br>
        <label><input type="radio" name="mGender" value="F">여자</label>
      </div>
    </div>

    <!-- 연락처 -->
    <div class="form-group">
      <label for="mTel">연락처<span class="required">●</span></label><br>
      <input type="mTel" name = "mTel" id ="mTel"placeholder="연락처" >
    </div>
	<!-- 연락처 -->
	<div class="form-group">
		<label for ="mBirth">생년월일</label><br>
		<input type = "date" name = "mBirth" id = "mTel" placeholder = "1990-01-01">
	</div>

    <!-- 가입하기 버튼 -->
    <input type="submit" value = "가입하기">
  </form>

</body>
</html>
</body>
</html>