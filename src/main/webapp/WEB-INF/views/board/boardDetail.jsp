<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 상세보기</title>

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Poppins&family=Raleway&display=swap" rel="stylesheet">

  <!-- Vendor CSS -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="/assets/css/instaReview.css" rel="stylesheet">
  <link href="/assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">

  <%@ include file="../section/header.jsp" %>

  <!-- 공지사항 상세보기 카드 -->
  <div class="container" style="margin-top: 180px; margin-bottom: 100px;">
    <div class="card border-0 shadow-none">
      <div class="card-body">
        <p>
          작성자: 관리자 |
          작성시간: ${board.bTime} |
          조회수: ${board.bCnt}
        </p>
        <hr>
        <p>${board.bContent}</p>

        <div class="text-end mt-4">
          <a href="/board" class="btn btn-secondary">목록으로</a>
          <a href="/board/${board.bNum}/update" class="btn btn-warning">수정</a>
          <a href="/board/${board.bNum}/delete" class="btn btn-danger">삭제</a>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../section/footer.jsp" %>

  <!-- Vendor JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
