<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 태그 선언 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <script src="/js/memberUpdate.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/memberDelete.js"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">

  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">
	<%@ include file="../section/header.jsp"%>
	<div class="container mt-5">
		<div class="card shadow" style="margin-top: 150px; margin-bottom: 50px;">
			<div class="card-header text-white text-center p-5" style="background: url('${pageContext.request.contextPath}/assets/img/moonE.jpg') center/cover no-repeat; position: relative; border-top-left-radius: 0.5rem; border-top-right-radius: 0.5rem;">	
				<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4); z-index: 1; border-top-left-radius: 0.5rem; border-top-right-radius: 0.5rem;"></div>
				<div class="position-relative"
					style="z-index: 2; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); color: #fff;">
					<h3 class="mb-2 fw-bold">
						📬 <span style="color: #ffffff;"> 문의작성 하기</span>
					</h3>
				</div>
			</div>

			<div class="card-body">
				<form method="post" action="/inquiry/write">
					<div class="mb-3">
						<label class="form-label">제목</label> <input type="text"
							name="iTitle" class="form-control" placeholder="제목을 입력하세요"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">문의 유형</label> <input type="text"
							name="iType" class="form-control" placeholder="예: 예약, 결제, 기타"
							required>
					</div>
					<div class="mb-3">
						<label class="form-label">내용</label>
						<textarea id="editor" name="iContent" class="form-control" rows="10"></textarea>
					</div>

					<%-- 로그인한 사용자의 mNum 전달 --%>
					<c:if test="${not empty sessionScope.loginUser}">
						<input type="hidden" name="mNum"
							value="${sessionScope.loginUser.mNum}" />
					</c:if>

					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-success">
							<i class="bi bi-check-circle"></i>제출하기
						</button>
						<a href="/" class="btn btn-outline-secondary">홈으로</a>
						<a href="/inquiry/inquiryList" class="btn btn-primary"><i class="bi bi-list-ul"></i>문의 리스트</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- CKEditor5 로딩 -->
	<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
	<script src="/assets/js/CKEditor5.js"></script>
	<%@ include file="../section/footer.jsp"%>
</body>
</html>
