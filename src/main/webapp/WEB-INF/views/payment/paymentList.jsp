<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
  <title>결제 내역</title>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">

</head>
<body class="index-page">

<%@ include file="../section/header.jsp" %>
<div id="payment-title" class="pt-5" style="margin-top: 100px;">
  <h2 class="text-center my-5">결제 내역</h2>
</div>

<div class="container mb-5">
  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">
      <thead class="table-dark">
        <tr>
          <th>ID</th>
          <th>상품명</th>
          <th>금액</th>
          <th>주문번호</th>
          <th>결제수단</th>
          <th>결제시간</th>
          <th>상태</th>
          <th>취소</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="payment" items="${payments}">
          <tr>
            <td>${payment.paymentId}</td>

            <td><a href="/package/detail/${payment.pNum}">${payment.pName}</a></td>

            <td>${payment.payAmount}</td>
            <td>${payment.merchantUid}</td>
            <td>${payment.payMethod}</td>
            <td>
              <c:if test="${not empty payment.paidAt}">
                ${payment.paidAt}
              </c:if>
            </td>
            <td>
              <span class="badge bg-${payment.payStatus eq 'paid' ? 'success' : 'secondary'}">${payment.payStatus}</span>
            </td>
            <td>
              <c:if test="${payment.payStatus eq 'paid'}">
                <form action="/payment/cancel" method="post" style="display:inline;">
                  <input type="hidden" name="impUid" value="${payment.impUid}" />
                  <input type="hidden" name="amount" value="${payment.payAmount}" />
                  <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('정말 결제를 취소하시겠습니까?');">결제 취소</button>
                </form>
              </c:if>
              
              <c:if test="${payment.payStatus eq 'cancelled' }">
                 <form method="post" action="/payment/delete/${payment.paymentId}">
                    <input type="hidden" name="paymentId" value="${payment.paymentId}" />
                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('삭제하시겠습니까?');">예약 삭제</button>
                 </form>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="text-center mt-4">
    <input type="button" value="Home" class="btn btn-primary mx-1" onclick="location.href='/'">
    <input type="button" value="패키지 보기" class="btn btn-outline-success mx-1" onclick="location.href='/packagelist'">
    <sec:authorize access="hasRole('ROLE_admin')">
    <input type="button" value="예약 내역 보기" class="btn btn-outline-info mx-1" onclick="location.href='/orders/orderList'">
    </sec:authorize>
  </div>
</div>
<%@ include file="../section/footer.jsp" %>
<script src="/assets/js/paymentList.js"></script>
</body>
</html>
