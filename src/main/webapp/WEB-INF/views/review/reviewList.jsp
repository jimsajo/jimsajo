<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">
  
  
  <!-- Vendor CSS Files -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body class="index-page">
<%@ include file="../section/header.jsp" %>
<!-- <a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a> -->

<div style="margin-top: 140px;">
	<h2 class="text-center fw-bold mb-4">여행지의 경험들</h2>
	<p class="text-center text-muted">즐거웠던 추억들 함께 공유해 보아요</p>
</div>
	<div class="container-md">
		<div class="container my-5">
			<div class="row g-4 mt-4">
				<c:forEach var="review" items="${reviews}">
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<div class="insta-card shadow-sm">
						
							<!-- 이미지 -->
							<a href="${pageContext.request.contextPath}/review/reviewDetail/${review.rNum}">
								<img src="${pageContext.request.contextPath}/assets/img/package/${review.rImage}" alt="리뷰 이미지" class="insta-img">
								<div class="insta-overlay">
									<i class="bi bi-heart-fill heart-icon"></i>
								</div>
							</a>
							
							<!-- 메타 정보 -->
							<div class="insta-meta">
								<span><strong>${review.mId}</strong></span> 
								<span><i class="bi bi-eye me-1"></i>조회수 ${review.rCnt}</span>  
								<span><fmt:formatDate value="${review.rDate}" pattern="yyyy-MM-dd" /></span>
								<span>${review.rTitle}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>
	</div>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
