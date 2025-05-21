<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 예약 리스트</title>
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

<%@ include file="../section/header.jsp"%>

  <div class="container py-5" style="margin-top:100px;">
    <h2 class="mb-4 text-primary text-center fw-bold">📋 전체 예약 내역</h2>

    <c:choose>
      <c:when test="${empty orderList}">
        <div class="alert alert-info text-center">
          예약 내역이 없습니다. 잠시 후 다시 시도해주세요.<br>
          <a href="/packagelist" class="btn btn-outline-primary mt-3">패키지 목록으로 이동</a>
        </div>
      </c:when>
      <c:otherwise>
        <div class="table-responsive">
          <table class="table table-bordered table-striped table-hover align-middle text-center">
            <thead class="table-primary">
              <tr>
                <th>주문번호</th>
                <th>주문일</th>
                <th>출발일</th>
                <th>도착일</th>
                <th>인원</th>
                <th>금액</th>
                <th>회원번호</th>
                <th>패키지번호</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="order" items="${orderList}">
                <tr>
                  <td>${order.oNum}</td>
                  <td>${order.oDate}</td>
                  <td>${order.oStart}</td>
                  <td>${order.oReturn}</td>
                  <td>${order.oPeople}</td>
                  <td class="text-end">${order.oPrice} 원</td>
                  <td>${order.mNum}</td>
                  <td>${order.pNum}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:otherwise>
    </c:choose>

    <div class="text-center mt-4">
      <a href="/" class="btn btn-secondary">🏠 Home</a>
    </div>
  </div>
  
<%@ include file="../section/footer.jsp"%>
</body>
</html>
