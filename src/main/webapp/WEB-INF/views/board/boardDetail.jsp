<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="jakarta.tags.core" %>
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
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ include file="../section/header.jsp" %>
 

  <!-- 공지사항 상세보기 카드 -->
<<<<<<< HEAD
  <div class="container" style="margin-top: 180px; margin-bottom: 100px;">
  <div class="card" style="border: none; box-shadow: none;">
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
=======
  <div class="container">
    <div class="card shadow">
      <div class="card-header bg-dark text-white fw-bold fs-5">
        ${board.bTitle}
      </div>
      <div class="card-body">
        <p class="text-muted mb-2">
          작성자: ${board.mName} &nbsp;|&nbsp; 작성시간: ${board.bTime} &nbsp;|&nbsp; 조회수: ${board.bCnt}
        </p>
        <hr>
        <div style="min-height: 150px;">
        	${board.bContent}
        </div>
      </div>
      <div class="card-footer bg-white text-end">
        <a href="/board" class="btn btn-secondary me-2"><i class="bi bi-list-ul"></i>목록으로</a>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/board/${board.bNum}/update" class="btn btn-warning me-2"><i class="bi bi-list-ul"></i>수정</a>
          <a href="/board/${board.bNum}/delete" class="btn btn-danger">삭제</a>
        </sec:authorize>
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
      </div>
    </div>
  </div>
</div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
