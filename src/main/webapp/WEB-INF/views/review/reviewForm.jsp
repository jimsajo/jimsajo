
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>리뷰 작성</title>
  <script src="${pageContext.request.contextPath}/assets/js/reviewForm.js"></script>
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<body class="bg-light">
<%@ include file="../section/header.jsp" %>
<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="card shadow" style="margin-top:90px;">
        <div class="card-header text-white text-center p-5" style="
			background: url('${pageContext.request.contextPath}/assets/img/header-travel.jpg') center/cover no-repeat;
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
		    <h3 class="mb-2 fw-bold">✈️ <span style="color: #ffffff;">여행 리뷰 작성</span> ✍️</h3>
		    <p class="mb-0">나만의 여행 기록을 남겨보세요!</p>
		  </div>
		</div>

        <div class="card-body" style="margin-top:110px;">
          <form method="post" action="${pageContext.request.contextPath}/review/reviewSave" enctype="multipart/form-data">

            <div class="mb-3">
              <label class="form-label">작성자 ID</label>
              <input type="text" class="form-control" name="mId" value="${sessionScope.loginUser.mId}" readonly>
            </div>

            <div class="mb-3">
              <label class="form-label">제목</label>
              <input type="text" class="form-control" name="rTitle" required>
            </div>

            <div class="mb-3">
              <label class="form-label">내용</label>
              <textarea class="form-control" rows="5" name="rReview" required></textarea>
            </div>

            <div class="mb-3">
              <label class="form-label">여행한 나라</label>
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
              <label class="form-label">패키지 선택</label>
              <select id="pNum" name="pNum" class="form-select" required>
                <option value="">패키지 선택</option>
              </select>
            </div>

            <div class="mb-3">
              <label class="form-label">리뷰 이미지</label>
              <input type="file" class="form-control" name="file" accept="image/*">
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-success"><i class="bi bi-check-circle"></i>리뷰 등록</button>
              <a href="${pageContext.request.contextPath}/review/reviewList" class="btn btn-outline-secondary"><i class="bi bi-list-ul"></i>리뷰 목록</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../section/footer.jsp" %>

</body>
</html>