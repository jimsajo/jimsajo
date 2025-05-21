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
 <%@ include file="../section/header.jsp" %>
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
<%@ include file="../section/footer.jsp" %>
</body>
</html>
