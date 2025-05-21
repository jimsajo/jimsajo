<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>패키지 수정</title>
    
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
    
    <!-- ✅ CKEditor CDN 추가 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body class="bg-light">
<%@ include file="../section/header.jsp" %>
	   <div class="container mt-5">
	   <div class="text-black text-center fs-2 fw-bold" style="margin-top:120px;">
        ✏️ 패키지 수정
   		</div>
	    <div class="card shadow" style="margin-top:20px;">
	      <div class="card-body">
	        <form action="/package/update" method="post" enctype="multipart/form-data">
	          <input type="hidden" name="pNum" value="${dto.pNum}">
	
	          <div class="mb-3">
	            <label class="form-label">제목</label>
	            <input type="text" name="pName" class="form-control" value="${dto.pName}" required>
	          </div>
	
	          <div class="mb-3">
	            <label class="form-label">국가</label>
	            <input type="text" name="pCountry" class="form-control" value="${dto.pCountry}" required>
	          </div>
	
	          <div class="mb-3">
	            <label class="form-label">가격</label>
	            <input type="number" name="pPrice" class="form-control" value="${dto.pPrice}" required>
	          </div>
	
	          <div class="mb-3">
	            <label class="form-label">상세 내용</label>
	            <textarea id="editor" name="pDescription" class="form-control">${dto.pDescription}</textarea>
	          </div>
	
	          <div class="mb-3">
	            <label class="form-label">기존 이미지</label><br>
	            <img src="/assets/img/package/${dto.pImage}" alt="썸네일 이미지" class="img-thumbnail" style="max-width: 200px;">
	          </div>
	
	          <div class="mb-3">
	            <label class="form-label">이미지 수정</label>
	            <input type="file" name="uploadFile" class="form-control" accept="image/*" onchange="previewImage(event)">
	            <img id="preview" class="mt-3" style="max-width: 300px; display: none;" alt="미리보기">
	          </div>
	
	          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	            <button type="submit" class="btn btn-success"><i class="bi bi-check-circle"></i> 수정 완료</button>
	            <a href="/packagelist" class="btn btn-outline-secondary"><i class="bi bi-list-ul"></i> 목록으로</a>
	          </div>
	        </form>
	      </div>
	    </div>
	  </div>
    <script src="/assets/js/packageEdit.js"></script>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
