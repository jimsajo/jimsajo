<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>패키지 리스트</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

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

  <!-- 현재 선택된 국가값 저장 -->
  <c:set var="currentCountry" value="${param.pCountry}" />
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
          <h1 class="sitename">JIMSAJO</h1>
        </a>

        <nav id="navmenu" class="navmenu">
          <ul>
            <li><a href="/" class="${empty currentCountry ? 'active' : ''}">홈</a></li>
            <li><a href="/packagelist/country?pCountry=Thailand" class="${currentCountry == 'Thailand' ? 'active' : ''}">태국</a></li>
            <li><a href="/packagelist/country?pCountry=Indonesia" class="${currentCountry == 'Indonesia' ? 'active' : ''}">인도네시아</a></li>
            <li><a href="/packagelist/country?pCountry=Vietnam" class="${currentCountry == 'Vietnam' ? 'active' : ''}">베트남</a></li>
            <li><a href="/packagelist/country?pCountry=Malaysia" class="${currentCountry == 'Malaysia' ? 'active' : ''}">말레이시아</a></li>
            <li><a href="/packagelist/country?pCountry=Philippines" class="${currentCountry == 'Philippines' ? 'active' : ''}">필리핀</a></li>

            <li class="dropdown"><a href="#"><span>공지사항</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="/board">공지사항</a></li>               
                <li><a href="/reviewList">여행 리뷰</a></li>
              </ul>
            </li>

            <!-- 로그인 여부 체크 -->
            <c:if test="${empty sessionScope.loginUser}">
              <li class="dropdown">
                <a href="/login"><span>로그인</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="/join">회원가입</a></li>
                </ul>
              </li>
            </c:if>

            <c:if test="${not empty sessionScope.loginUser}">
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

  <main class="main">
    <section id="hero" class="hero section dark-background">
      <img src="/assets/img/hero-bg.jpg" alt="">
      <section id="about" class="about section2">
        <div class="container section-title">
          <span>Package<br></span>
          <h2>Package<br></h2>
          <p>동남아 추천 여행 패키지 상품입니다 즐겁고 행복한 여행 되세요~~</p><br>
          
          
	    <c:forEach var="dto" items="${packageList}">
	      <p>
	        <a href="/package/detail/${dto.pNum}">제목: ${dto.pName}</a>
	      </p>
	      <p>국가: ${dto.pCountry}</p>
	      <p>작성일: ${dto.pCreate}</p>
	
	      <!-- 썸네일 이미지 표시 -->
	      <c:if test="${not empty dto.pImage}">
	        <img src="${pageContext.request.contextPath}/assets/img/package/${dto.pImage}" alt="썸네일" style="width: 100px; height: 100px;">
	      </c:if>
	    </c:forEach>
        </div>
      </section>
    </section><!-- /Hero Section -->

    
  </main>
</body>
</html>
