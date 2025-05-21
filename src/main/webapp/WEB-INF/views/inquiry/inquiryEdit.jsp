<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>

  <!-- login JS -->
  <script src="/js/login.js"></script>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Flatpickr CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">

  <!-- Favicon -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body>
<%@ include file="../section/header.jsp"%>
<br><br><br><br><br>
<h2>문의 수정</h2>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<form action="/inquiry/update" method="POST">
    <input type="hidden" name="iNum" value="${inquiry.iNum}"> <!-- 문의 번호를 hidden으로 전달 -->
    
    <p><strong>제목:</strong> <input type="text" name="iTitle" value="${inquiry.iTitle}" required></p>
    <p><strong>타입:</strong> <input type="text" name="iType" value="${inquiry.iType}" required></p>
    <p><strong>내용:</strong> <textarea id="editor" name="iContent">${inquiry.iContent}</textarea></p>
    <p><strong>작성일:</strong> ${inquiry.iTime}</p> <!-- 작성일은 수정하지 않음 -->
    <input type="hidden" name="mNum" value="${inquiry.mNum}">
    
    <button type="submit">수정하기</button>
</form>

<a href="/inquiry/inquiryList">목록으로 돌아가기</a> <!-- 목록으로 돌아가기 링크 추가 -->
<script>
    ClassicEditor
    .create(document.querySelector('#editor'), {
        ckfinder: {
            uploadUrl: '/api/upload-package-image'  // 패키지 업로드 URL 지정 (다른 URL로 수정)
        },
        toolbar: ['heading', '|', 'bold', 'italic', '|', 'link', 'imageUpload']
    })
    .catch(error => {
        console.error(error);
    });

</script>

<%@ include file="../section/footer.jsp"%>
</body>
</html>
