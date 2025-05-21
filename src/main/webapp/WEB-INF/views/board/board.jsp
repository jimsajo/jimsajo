<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 목록</title>
  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<body class="index-page">
<%@ include file="../section/header.jsp" %>
  <!-- 공지사항 테이블 -->
  <div class="container mt-5 pt-5">
   	   <div class="bg-white text-black text-center fs-2 fw-bold" style="margin-top:80px;">
        공지사항 목록
      </div>
    <div class="card shadow" style="margin-top:20px;">
      <div class="card-body p-0">
        <table class="table table-bordered text-center mb-0">
          <thead class="table-light">
            <tr>
              <th>NO</th>
              <th>제목</th>
              <th>작성시간</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="board" items="${boards}">
              <tr>
                <td>${board.bNum}</td>
                <td class="text-start">
                  <a href="/board/${board.bNum}/detail" class="text-decoration-none text-dark">
                    ${board.bTitle}
                  </a>
                </td>
                <td>${board.bTime}</td>
                <td>${board.bCnt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
  <nav class="mt-4">
  <ul class="pagination justify-content-center">
    <c:if test="${currentPage > 1}">
      <li class="page-item">
        <a class="page-link" href="?page=${currentPage - 1}">이전</a>
      </li>
    </c:if>

    <c:forEach begin="1" end="${totalPage}" var="i">
      <li class="page-item ${i == currentPage ? 'active' : ''}">
        <a class="page-link" href="?page=${i}">${i}</a>
      </li>
    </c:forEach>

    <c:if test="${currentPage < totalPage}">
      <li class="page-item">
        <a class="page-link" href="?page=${currentPage + 1}">다음</a>
      </li>
    </c:if>
  </ul>
</nav>
  

  <!-- Bootstrap JS (선택, 모달이나 드롭다운 등에 필요 시) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <%@ include file="../section/footer.jsp" %>
</body>
</html>
