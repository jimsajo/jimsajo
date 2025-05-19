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
    </div><div class="branding d-flex align-items-center">
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
                <li><a href="/review/reviewList">여행 리뷰</a></li>
              </ul>
            </li>

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

            <li><a href="/#contact">Contact</a></li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>
    </div>
  </header>

  <main class="main" style="margin-top: 140px;">
<div>
    <div class="container-md">
      <div class="container my-5">
        <div class="text-center mb-4">
          <h2>동남아 추천 여행 패키지</h2>
          <p class="text-muted">즐겁고 행복한 여행 되세요~~</p>
        </div>

        <div class="row g-4 mt-4">
          <c:forEach var="dto" items="${packageList}">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
              <div class="insta-card shadow-sm">
                <a href="${pageContext.request.contextPath}/package/detail/${dto.pNum}">
                  <img src="${pageContext.request.contextPath}/assets/img/package/${dto.pImage}" alt="패키지 이미지" class="insta-img">
                  <div class="insta-overlay">
                    <i class="bi bi-bookmark-heart-fill heart-icon"></i>
                  </div>
                </a>
                <div class="insta-meta">
                  <span><strong>${dto.pName}</strong></span><br>
                  <span><i class="bi bi-geo-alt me-1"></i>${dto.pCountry}</span><br>
                  <span><i class="bi bi-calendar-check me-1"></i><fmt:formatDate value="${dto.pCreate}" pattern="yyyy-MM-dd" /></span><br>
                  <span><i class="bi bi-cash-coin me-1"></i><strong>${dto.pPrice} 원</strong></span>
                </div>

                
	              </div>
	            </div>
	          </c:forEach>
	      </div>
	    </div>
	    </div>
	</div>
  </main>
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
      <p>© <span>Copyright</span> <strong class="px-1 sitename">JIMSAJO</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        
      </div>
    </div>
</footer>
  
</body>
</html>