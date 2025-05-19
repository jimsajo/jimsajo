<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>패키지 예약 주문</title>
  <script src="${pageContext.request.contextPath}/assets/js/ordersform.js"></script>
  
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
<body class="bg-light">

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
            <!-- 로그인 여부 체크 -->
		  <c:if test="${empty sessionScope.loginUser}">
		    <!-- 비로그인 상태일 때 -->
		    <li class="dropdown">
		      <a href="/login"><span>로그인</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      <ul>
		        <li><a href="/join">회원가입</a></li>
		      </ul>
		    </li>
		  </c:if><%-- 디버깅용 세션 확인 코드 --%>

		  
		  <c:if test="${not empty sessionScope.loginUser}">
		    <!-- 로그인 상태일 때 -->
		    <li class="dropdown">
		      <a href="/myPage"><span>마이페이지</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      <ul>
		        <li><a href="/logout">로그아웃</a></li>
		      </ul>
		    </li>
		  </c:if>
            <li><a href="#contact">Contact</a></li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>

    </div>

  </header>

  <div class="container mt-5">
    <div class="card shadow-sm" style="margin-top:120px;">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0">✈️ 패키지 예약</h4>
      </div>
      <div class="card-body">
        <form method="post" action="/orders/submit">
          <!-- 패키지 번호 전달 -->
          <input type="hidden" name="pNum" value="${packageDto.pNum}" />
          <input type="hidden" id="price" value="${packageDto.pPrice}" />

          <div class="mb-3">
            <label class="form-label">상품명</label>
            <div class="form-control-plaintext">${packageDto.pName}</div>
            <hr>
          </div>
			
          <div class="mb-3">
            <label class="form-label">1인당 가격</label>
            <div class="form-control-plaintext text-danger fw-bold">${packageDto.pPrice} 원</div>
            <hr>
          </div>

          <div class="mb-3">
            <label class="form-label">출발일</label>
            <input type="date" name="oStart" class="form-control" required />
          </div>

          <div class="mb-3">
            <label class="form-label">도착일</label>
            <input type="date" name="oReturn" class="form-control" required />
          </div>

          <div class="mb-3">
            <label class="form-label">인원수</label>
            <input type="number" name="oPeople" id="people" value="1" min="1" class="form-control" onchange="calculateTotal()" required />
          </div>

          <div class="mb-3">
            <label class="form-label">총 결제 금액</label>
            <div class="form-control-plaintext fw-semibold text-success fs-5" id="totalPriceDisplay">0 원</div>
          </div>

          <!-- 서버로 보낼 총 금액 -->
          <input type="hidden" id="oPrice" name="oPrice" value="0" />

          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <input type="submit" value="💳 결제 페이지로 이동" class="btn btn-success" />
            <input type="button" onclick="location.href='/packagelist'" value="📦 더 많은 패키지 둘러보기" class="btn btn-outline-secondary" />
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
