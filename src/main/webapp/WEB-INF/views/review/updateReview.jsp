<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>리뷰 수정</title>
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

  <div class="container py-5" style="margin-top: 120px;">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header bg-warning text-white text-center">
            <h3 class="mb-0">📝 리뷰 수정</h3>
          </div>
          <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/review/updateReview" enctype="multipart/form-data">
              <input type="hidden" name="rNum" value="${upReview.rNum}">
              <input type="hidden" name="mNum" value="${sessionScope.loginUser.mNum}">

              <div class="mb-3">
                <label class="form-label">제목</label>
                <input type="text" class="form-control" name="rTitle" value="${upReview.rTitle}" required>
              </div>

              <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" name="rReview" rows="5" required>${upReview.rReview}</textarea>
              </div>

              <div class="mb-3">
                <label class="form-label">기존 이미지</label><br>
                <p>${review.rReview}</p>
                <c:if test="${not empty upReview.rImage}">
                  <img src="/assets/img/package/${review.rImage}" class="img-thumbnail" style="max-width: 200px;">
                </c:if>
              </div>

              <div class="mb-3">
                <label class="form-label">새 이미지 업로드</label>
                <input type="file" class="form-control" name="rfile" accept="image/*">
              </div>

              <div class="mb-4">
                <label class="form-label">여행 국가</label>
                <select class="form-select" name="pCountry" required>
                  <option value="베트남" <c:if test="${upReview.pCountry == '베트남'}">selected</c:if>>베트남</option>
                  <option value="태국" <c:if test="${upReview.pCountry == '태국'}">selected</c:if>>태국</option>
                  <option value="말레이시아" <c:if test="${upReview.pCountry == '말레이시아'}">selected</c:if>>말레이시아</option>
                  <option value="인도네시아" <c:if test="${upReview.pCountry == '인도네시아'}">selected</c:if>>인도네시아</option>
                  <option value="필리핀" <c:if test="${upReview.pCountry == '필리핀'}">selected</c:if>>필리핀</option>
                </select>
              </div>

              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-success">수정 완료</button>
                <a href="${pageContext.request.contextPath}/review/reviewList" class="btn btn-outline-secondary">목록으로</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <jsp:include page="../footer.jsp"/>
  
</body>
</html>
