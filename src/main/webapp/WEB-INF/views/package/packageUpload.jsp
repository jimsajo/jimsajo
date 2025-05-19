<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>패키지 업로드</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">

  <link href="/assets/css/main.css" rel="stylesheet">

  <c:set var="currentCountry" value="${param.pCountry}" />
     <style>
    .ck-editor__editable {
      min-height: 300px; /* 원하는 최소 높이로 조정 */
    }
  </style>
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
    </div><!-- End Top Bar -->

    <div class="branding d-flex align-items-center">

      <div class="container position-relative d-flex align-items-center justify-content-between">
        <a href="/" class="logo d-flex align-items-center">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="assets/img/logo.png" alt=""> -->
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
                <li><a href="${pageContext.request.contextPath}/review/reviewList">여행 리뷰</a></li>
              </ul>
            </li>
            <li><a href="#contact">Contact</a></li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>
    </div>
  </header>
    <!-- CKEditor5 로딩 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>

    <!-- 업로드 폼 -->
   <div class="card-body" style="margin: 140px;">
    <form method="post" action="/write" enctype="multipart/form-data">
	    <div class="mb-3">
              <label class="form-label">나라</label>
              <select id="pCountry" name="pCountry" class="form-select" required>
                <option value="">선택하세요</option>
                <option value="Vietnam">베트남</option>
                <option value="Thailand">태국</option>
                <option value="Malaysia">말레이시아</option>
                <option value="Indonesia">인도네시아</option>
                <option value="Philippines">필리핀</option>
              </select>
            </div>
	
	    <div class="mb-3">
              <label class="form-label">제목</label>
              <input type="text" class="form-control" name="rName" required>
            </div>
	    가격 : <input type="number" name="pPrice" placeholder="가격" min="0"><br>
	
	   상세내용 : <textarea id="editor" name="pDescription" class="form-control"></textarea><br>
	

	     <div class="mb-3">
              <label class="form-label">이미지 업로드</label>
              <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(event)" class="form-control"><br> <!-- 수정 -->
            	<img id="preview" alt="이미지 미리보기" style="max-width: 300px; display: none;"><br>
            </div>	
	    <input type="submit" value="업로드"><br>

	</form>
</div>

    <!-- 이미지 미리보기 스크립트 -->
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var preview = document.getElementById('preview');
                preview.src = reader.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
<script>
    <!-- CKEditor5 초기화 및 이미지 업로드 설정 -->
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
   <jsp:include page="../footer.jsp" />
</body>
</html>
   