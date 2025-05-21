<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="/assets/css/main.css" rel="stylesheet">

<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>

<style>
  .form-container {
    max-width: 800px;
    margin: 180px auto 100px;
    padding: 30px;
    background-color: #ffffff;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    border-radius: 12px;
  }
  .form-container h2 {
    font-weight: 600;
    margin-bottom: 30px;
    text-align: center;
  }
  .form-container label {
    font-weight: 500;
  }
</style>
</head>
<body>
<%@ include file="../section/header.jsp" %>


<!-- 수정 폼 -->
<div class="form-container">
  <h2>공지사항 수정</h2>
  <form name="boardUpdate" method="post" action="/boardUpdate" enctype="multipart/form-data">
    <input type="hidden" name="bNum" value="${board.bNum}">

    <div class="mb-3">
      <label for="bTitle" class="form-label">제목</label>
      <input type="text" class="form-control" id="bTitle" name="bTitle" value="${board.bTitle}" required>
    </div>

    <div class="mb-3">
      <label for="bContent" class="form-label">내용</label>
      <textarea id="editor" name="bContent" rows="10">${board.bContent}</textarea>
    </div>

    <div class="text-end">
      <input type="submit" class="btn btn-primary" value="수정완료">
      <a href="/board/${board.bNum}/detail" class="btn btn-secondary">취소</a>
    </div>
  </form>
</div>

<script>
  let editor;

  ClassicEditor
    .create(document.querySelector('#editor'))
    .then(newEditor => {
      editor = newEditor;
    })
    .catch(error => {
      console.error(error);
    });

  // 에디터 데이터 → textarea로 동기화
  document.querySelector("form[name='boardUpdate']").addEventListener("submit", function () {
    document.querySelector("#editor").value = editor.getData();
  });
</script>

<%@ include file="../section/footer.jsp" %>
</body>
</html>
