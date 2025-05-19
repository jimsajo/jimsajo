<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>패키지 결제</title>
<!-- ✅ 아임포트 SDK 반드시 포함 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
	
<!-- Main CSS File -->
<link href="/assets/css/main.css" rel="stylesheet">
</head>
<body>

	<header id="header" class="header fixed-top">

		<div class="topbar d-flex align-items-center">
			<div
				class="container d-flex justify-content-center justify-content-md-between">
				<div class="contact-info d-flex align-items-center">
					<i class="bi bi-envelope d-flex align-items-center"><a
						href="mailto:contact@example.com">jimsajo456@gmail.com</a></i> <i
						class="bi bi-phone d-flex align-items-center ms-4"><span>010-9435-4524</span></i>
				</div>
				<div class="social-links d-none d-md-flex align-items-center">
					<a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a> <a
						href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
						href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
						href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
				</div>
			</div>
		</div>
		<!-- End Top Bar -->

		<div class="branding d-flex align-items-center">

			<div
				class="container position-relative d-flex align-items-center justify-content-between">
				<a href="/" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
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
						<li class="dropdown"><a href="#"><span>공지사항</span> <i
								class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<li><a href="/board">공지사항</a></li>
								<li><a
									href="${pageContext.request.contextPath}/review/reviewList">여행
										리뷰</a></li>
							</ul></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
					<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
				</nav>
			</div>
		</div>
	</header>


<!-- 	<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" -->
<!-- 		style="height: 150px; width: auto;"></a> -->
<br>
	<div class="text-center pt-5 mt-5">
	  <h2 class="fw-bold display-5 text-primary">패키지 결제</h2>
	</div>


	<div class="container d-flex justify-content-center">
		<form name="payment-form" id="payment-form" method="post"
			class="card p-4 shadow w-100 d-block mx-auto" style="max-width: 500px;">

			<!-- 숨겨진 필드 -->
			<input type="hidden" id="pNum" value="${packageDto.pNum}" /> <input
				type="hidden" id="oNum" value="${orderDto.oNum}" /> <input
				type="hidden" id="buyer_name" value="${loginUser.mName}" /> <input
				type="hidden" id="buyer_tel" value="${loginUser.mTel}" />

			<div class="card shadow-sm border-0">
				<div class="card-body">

					<div class="mb-4 text-center">
						<h5 class="card-title">결제 정보</h5>
						<p class="text-muted small">아래 정보를 확인 후 결제를 진행해 주세요.</p>
					</div>

					<ul class="list-group list-group-flush mb-4">
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">상품명</span> <span id="name">${packageDto.pName}</span>
						</li>
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">금액</span> <span><span id="amount">${orderDto.oPrice}</span>
								원</span></li>
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">국가</span> <span>${packageDto.pCountry}</span></li>
					</ul>

					<div class="d-grid gap-2">
						<button type="button" class="btn btn-primary"
							onclick="requestPay()">💳 결제하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/payment/paymentList'">📄 결제내역
							보기</button>
					</div>

				</div>
			</div>

		</form>
	</div>

	<script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>
  
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
            <li><a href="#">Home</a></li>
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
      <p>© <span>Copyright</span> <strong class="px-1 sitename">JIMSAJO</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
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
