<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 수정</title>
  <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Poppins&family=Raleway&display=swap" rel="stylesheet">

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
  <div class="card shadow" style="margin-top:120px;">
    <div class="card-header text-white text-center p-5" style="
      background: url('${pageContext.request.contextPath}/assets/img/moonE.jpg') center/cover no-repeat;
      position: relative;
      border-top-left-radius: 0.5rem;
      border-top-right-radius: 0.5rem;">
      
      <div style="
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        z-index: 1;
        border-top-left-radius: 0.5rem;
        border-top-right-radius: 0.5rem;"></div>

      <div class="position-relative" style="z-index: 2; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); color: #fff;">
        <h3 class="mb-2 fw-bold">✏️ <span style="color: #ffffff;"> 문의 수정하기</span></h3>
      </div>
    </div>

    <div class="card-body">
      <form action="/inquiry/update" method="POST">
        <input type="hidden" name="iNum" value="${inquiry.iNum}">

        <div class="mb-3">
          <label class="form-label">제목</label>
          <input type="text" name="iTitle" class="form-control" value="${inquiry.iTitle}" required>
        </div>

        <div class="mb-3">
          <label class="form-label">문의 유형</label>
          <input type="text" name="iType" class="form-control" value="${inquiry.iType}" required>
        </div>

        <div class="mb-3">
          <label class="form-label">내용</label>
          <textarea id="editor" name="iContent" class="form-control" rows="10">${inquiry.iContent}</textarea>
        </div>

        <div class="mb-3">
          <label class="form-label">작성일</label>
          <input type="text" class="form-control" value="${inquiry.iTime}" disabled>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="submit" class="btn btn-primary">수정하기</button>
          <a href="/inquiry/inquiryList" class="btn btn-outline-secondary">목록으로</a>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="../js/CKEditor5.js"></script>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
