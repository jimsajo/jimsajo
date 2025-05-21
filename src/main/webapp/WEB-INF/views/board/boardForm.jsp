<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <!-- Bootstrap CSS -->
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
<!-- 공지사항 작성 폼 -->
    <div class="container" style="margin-top: 120px;">
        <div class="card shadow">
            <div class="card-header bg-dark text-white text-center fw-bold fs-5">
                공지사항 작성
            </div>
            <div class="card-body">
                <form name="form" method="post" action="boardSave" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="bTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="bTitle" name="bTitle" required>
                    </div>

                    <div class="mb-3">
                        <label for="bContent" class="form-label">내용</label>
                        <textarea id="editor" name="bContent" class="form-control" placeholder="내용을 입력하세요."></textarea>
                    </div>

                    <div class="text-end">
                    <a href="/board" class="btn btn-secondary me-2">목록으로</a>
                        <input type="submit" value="작성 완료" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- CKEditor5 로드 및 적용 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
    <script>
    ClassicEditor
        .create(document.querySelector('#editor'), {
            ckfinder: {
                uploadUrl: '/api/upload-package-image'
            },
            toolbar: ['heading', '|', 'bold', 'italic', '|', 'link', 'imageUpload']
        })
        .catch(error => {
            console.error(error);
        });
    </script>

    <!-- Bootstrap JS (선택) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <jsp:include page="../section/footer.jsp"/>
    
</body>
</html>
