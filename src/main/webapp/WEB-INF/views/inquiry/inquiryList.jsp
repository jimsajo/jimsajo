<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>문의 목록</title>

  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">

  <!-- Fonts & Favicon -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <!-- Bootstrap & 기타 JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/aos/aos.js"></script>
  <script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/assets/js/main.js"></script>
</head>

<body class="index-page">

<!-- 상단 헤더 포함 -->
<jsp:include page="../section/header.jsp" />

<!--  본문 콘텐츠 -->
<div class="container mt-5 pt-5 mb-5">
  <div class="card shadow">
    <div class="card-header bg-dark text-white text-center fs-5 fw-bold">
      1:1 문의 목록
    </div>
    <div class="card-body p-0">
      <table class="table table-bordered text-center mb-0">
        <thead class="table-light">
          <tr>
            <th>제목</th>
            <th>타입</th>
            <th>상세보기</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="dto" items="${list}">
            <tr>
              <td>${dto.iTitle}</td>
              <td>${dto.iType}</td>
              <td><a href="/inquiry/detail?iNum=${dto.iNum}" class="text-decoration-none">상세보기</a></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- footer -->
<jsp:include page="../section/footer.jsp" />
</body>
</html>
