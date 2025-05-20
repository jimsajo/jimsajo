<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>

  <!-- login JS -->
  <script src="/js/login.js"></script>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Flatpickr CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">

  <!-- Favicon -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

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
<header id="header" class="header fixed-top">
  <div class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">jimsajo456@gmail.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>010-9435-4524</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>

    </div>
  </div>

  <div class="branding d-flex align-items-center">
    <div class="container position-relative d-flex align-items-center justify-content-between">
      <a href="/" class="logo d-flex align-items-center">
        <h1 class="sitename">JIMSAJO</h1>
      </a>
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="/" class="active">홈</a></li>
          <li><a href="/packagelist/country?pCountry=Thailand">태국</a></li>
          <li><a href="/packagelist/country?pCountry=Indonesia">인도네시아</a></li>
          <li><a href="/packagelist/country?pCountry=Vietnam">베트남</a></li>
          <li><a href="/packagelist/country?pCountry=Malaysia">말레이시아</a></li>
          <li><a href="/packagelist/country?pCountry=Philippines">필리핀</a></li>
          <li class="dropdown"><a href="#"><span>공지사항</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="/board">공지사항</a></li>
              <li><a href="/reviewList">여행 리뷰</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
    </div>
  </div>
</header>

<!-- 로그인 폼 컨테이너 -->
<div class="container" style="max-width: 400px; margin-top: 120px;">
  <h3 class="text-center mb-4">Login</h3>

  <form action="loginProcess" method="post" name="login" onsubmit="return validateForm()">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="mId" name="mId" placeholder="아이디 입력">
      <label for="mId">아이디</label>
    </div>
    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="mPasswd" name="mPasswd" placeholder="비밀번호 입력">
      <label for="mPasswd">비밀번호</label>
    </div>
    <button type="submit" class="btn btn-dark w-100 mb-3 py-3">로그인</button>
  </form>

  <div class="d-flex align-items-center mb-3">
    <hr class="flex-grow-1 me-2">
    <span class="text-muted">또는</span>
    <hr class="flex-grow-1 ms-2">
  </div>

  <a href="/oauth2/authorization/kakao"
     class="btn w-100 fw-bold text-dark py-3"
     style="background-color: #FEE500;">
    <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
         alt="카카오 아이콘"
         style="width: 20px; margin-right: 8px;">
    카카오 로그인
  </a>
</div>
</body>
</html>
