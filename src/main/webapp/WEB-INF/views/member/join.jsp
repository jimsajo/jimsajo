<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
	<!-- 생년월일 달력처리 -->
   <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      flatpickr("#mBirth", {
        dateFormat: "Y-m-d",
        maxDate: "today",
        locale: "ko"
      });
    });
  </script>
  <!-- join.js -->
  <script src="/js/join.js"></script>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Flatpickr CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <!-- 선택 테마 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">
  
  <!-- Favicons -->

  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body class="index-page">

<%@ include file="../section/header.jsp"%>

<div class="container d-flex justify-content-center mt-5">
  <form action="save" method="post" class="w-100" style="max-width: 400px;" onsubmit="return validateForm();">
  
    <!-- 로고 -->
    <div class="text-center mb-4">
      <a href="/">
        <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
      </a>
    </div>
<br>
    <div class="mb-4 text-center">
      <h3>Sign Up</h3>
    </div>

    <!-- 아이디 -->
    <div class="mb-3">
      <label for="mId" class="form-label">아이디</label>
      <div class="input-group">
        <input type="text" class="form-control form-control-lg" id="mId" name="mId" placeholder="아이디 입력">
        <button type="button" class="btn btn-outline-secondary" onclick="checkId()">중복검사</button>
      </div>
      <div id="idCheckResult" class="form-text mt-1"></div>
    </div>

    <!-- 비밀번호 -->
    <div class="mb-3">
      <label for="mPasswd" class="form-label">비밀번호</label>
      <input type="password" class="form-control form-control-lg" id="mPasswd" name="mPasswd" placeholder="비밀번호 입력">
    </div>

    <!-- 비밀번호 확인 -->
    <div class="mb-3">
      <label for="mPassword" class="form-label">비밀번호 확인</label>
      <input type="password" class="form-control form-control-lg" id="mPassword" name="mPassword" placeholder="비밀번호 확인">
    </div>

    <!-- 이름 -->
    <div class="mb-3">
      <label for="mName" class="form-label">이름</label>
      <input type="text" class="form-control form-control-lg" id="mName" name="mName" placeholder="이름 입력">
    </div>

    <!-- 성별 -->
    <div class="mb-3">
      <label class="form-label d-block">성별</label>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="mGender" id="genderM" value="M">
        <label class="form-check-label" for="genderM">남자</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="mGender" id="genderF" value="F">
        <label class="form-check-label" for="genderF">여자</label>
      </div>
    </div>

    <!-- 연락처 -->
    <div class="mb-3">
      <label for="mTel" class="form-label">연락처</label>
      <input type="text" class="form-control form-control-lg" id="mTel" name="mTel" placeholder="연락처('-' 없이)">
    </div>

    <!-- 생년월일 -->
	<div class="mb-4">
	  <label for="mBirth" class="form-label">생년월일</label>
	  <div class="input-group">
	    <span class="input-group-text">
	      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
	        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v1H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2z"/>
	      </svg>
	    </span>
	    <input type="text" class="form-control form-control-lg" id="mBirth" name="mBirth" placeholder="YYYY-MM-DD" readonly>
	  </div>
	</div>
	
    <!-- 가입하기 버튼 -->
    <button type="submit" class="btn btn-dark btn-lg w-100">가입하기</button>
  </form>
</div>

<%@ include file="../section/header.jsp"%>

</body>
</html>