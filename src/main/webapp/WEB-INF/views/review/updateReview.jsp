<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>리뷰 수정</title>
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
<body class="bg-light">
<%@ include file="../section/header.jsp" %>
  <div class="container py-5" style="margin-top: 120px;">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header bg-warning text-white text-center">
            <h3 class="mb-0">📝 리뷰 수정</h3>
          </div>
          <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/review/updateReview" enctype="multipart/form-data">
              <input type="hidden" name="rNum" value="${upReview.rNum}">
              <input type="hidden" name="mNum" value="${sessionScope.loginUser.mNum}">

              <div class="mb-3">
                <label class="form-label">제목</label>
                <input type="text" class="form-control" name="rTitle" value="${upReview.rTitle}" required>
              </div>

              <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" name="rReview" rows="5" required>${upReview.rReview}</textarea>
              </div>

              <div class="mb-3">
                <label class="form-label">기존 이미지</label><br>
                <p>${review.rReview}</p>
                <c:if test="${not empty upReview.rImage}">
                  <img src="/assets/img/package/${review.rImage}" class="img-thumbnail" style="max-width: 200px;">
                </c:if>
              </div>

              <div class="mb-3">
                <label class="form-label">새 이미지 업로드</label>
                <input type="file" class="form-control" name="rfile" accept="image/*">
              </div>

              <div class="mb-4">
                <label class="form-label">여행 국가</label>
                <select class="form-select" name="pCountry" required>
                  <option value="베트남" <c:if test="${upReview.pCountry == '베트남'}">selected</c:if>>베트남</option>
                  <option value="태국" <c:if test="${upReview.pCountry == '태국'}">selected</c:if>>태국</option>
                  <option value="말레이시아" <c:if test="${upReview.pCountry == '말레이시아'}">selected</c:if>>말레이시아</option>
                  <option value="인도네시아" <c:if test="${upReview.pCountry == '인도네시아'}">selected</c:if>>인도네시아</option>
                  <option value="필리핀" <c:if test="${upReview.pCountry == '필리핀'}">selected</c:if>>필리핀</option>
                </select>
              </div>

              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-success">수정 완료</button>
                <a href="${pageContext.request.contextPath}/review/reviewList" class="btn btn-outline-secondary">목록으로</a>
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
