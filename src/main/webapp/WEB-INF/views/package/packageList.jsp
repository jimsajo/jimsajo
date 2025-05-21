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


<%@ include file="../section/header.jsp"%>

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
	
<%@ include file="../section/footer.jsp"%>
</body>
</html>