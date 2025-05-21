<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>패키지 업로드</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">

  <link href="/assets/css/main.css" rel="stylesheet">

  <c:set var="currentCountry" value="${param.pCountry}" />
     <style>
    .ck-editor__editable {
      min-height: 300px; /* 원하는 최소 높이로 조정 */
    }
  </style>
</head>
<body class="index-page">
<%@ include file="../section/header.jsp" %>
    <!-- CKEditor5 로딩 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>

    <!-- 업로드 폼 -->
   <div class="card-body" style="margin: 140px;">
    <form method="post" action="/write" enctype="multipart/form-data">
	    <div class="mb-3">
              <label class="form-label">나라</label>
              <select id="pCountry" name="pCountry" class="form-select" required>
                <option value="">선택하세요</option>
                <option value="Vietnam">베트남</option>
                <option value="Thailand">태국</option>
                <option value="Malaysia">말레이시아</option>
                <option value="Indonesia">인도네시아</option>
                <option value="Philippines">필리핀</option>
              </select>
            </div>
	
	    <div class="mb-3">
              <label class="form-label">제목</label>
              <input type="text" class="form-control" name="pName" required>
            </div>
	    가격 : <input type="number" name="pPrice" placeholder="가격" min="0"><br>
	
	   상세내용 : <textarea id="editor" name="pDescription" class="form-control"></textarea><br>
	

	     <div class="mb-3">
              <label class="form-label">이미지 업로드</label>
              <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(event)" class="form-control"><br> <!-- 수정 -->
            	<img id="preview" alt="이미지 미리보기" style="max-width: 300px; display: none;"><br>
            </div>	
	    <input type="submit" value="업로드"><br>

	</form>
</div>

    <!-- 이미지 미리보기 스크립트 -->
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var preview = document.getElementById('preview');
                preview.src = reader.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
<script src="../js/CKEditor5.js"></script>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
   