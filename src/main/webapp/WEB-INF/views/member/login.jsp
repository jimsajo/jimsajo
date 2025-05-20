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
<%@ include file="../header.jsp" %>

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
	<div style="margin:10px; ">
  <a href="/oauth2/authorization/kakao"
     class="btn w-100 fw-bold text-dark py-3"
     style="background-color: #FEE500;">
    <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
         alt="카카오 아이콘"
         style="width: 20px; margin-right: 8px;">
    카카오 로그인
  </a>
  </div>
  <br><br>
</div>
<footer id="footer" class="footer position-relative dark-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6">
          <div class="footer-about">
            <a href="/" class="logo sitename">JIMSAJO</a>
            <div class="footer-contact pt-3">
              <p> 12th floor JIMSAJO 627, Jungang-daero, Busanjin-gu, Busan,</p>
              <p>Republic of Korea </p>
              <p class="mt-3"><strong>Phone:</strong> <span>82+ 9435 4524</span></p>
              <p><strong>Email:</strong> <span>jimsajo456@gmail.com</span></p>
            </div>
            <div class="social-links d-flex mt-4">
              <a href=""><i class="bi bi-twitter-x"></i></a>
              <a href=""><i class="bi bi-facebook"></i></a>
              <a href=""><i class="bi bi-instagram"></i></a>
              <a href=""><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>&copy; <span>Copyright</span> <strong class="px-1 sitename">JIMSAJO</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        
      </div>
    </div>

  </footer>
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
  <script src="/assets/vendor/aos/aos.js"></script>
  <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="/assets/js/main.js"></script>

</body>
</html>
