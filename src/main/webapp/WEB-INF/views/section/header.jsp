<%@ page language="java" pageEncoding="UTF-8"%>

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