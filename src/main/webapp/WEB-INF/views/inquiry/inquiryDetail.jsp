<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<meta charset="UTF-8">

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
<link href="${pageContext.request.contextPath}/assets/css/reviewDetail.css" rel="stylesheet">
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">

    <title>문의 상세보기</title>

</head>
<body>

<%@ include file="../section/header.jsp"%>
<br><br><br><br><br>
<div class="position-relative text-center" style="margin-top: 40px; margin-bottom: 20px; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);">
  <h3 class="mb-1 fw-bold" style="color: #000;">
    나의 문의 목록
  </h3>
</div>
<div class="container">
  <div class="review-container">
    <h1 class="review-title">${inquiry.iTitle}</h1>  
    <div class="mt-2">
      <span class="badge bg-primary"> ${inquiry.iType}</span>
    </div>
    <div class="review-content">
      <p>${inquiry.iContent}</p>
    </div>
    <div class="btn-area text-end">
      <a href="/inquiry/edit?iNum=${inquiry.iNum}" class="btn btn-secondary">수정</a>
      <a href="/inquiry/delete?iNum=${inquiry.iNum}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
      <a href="/inquiry/inquiryList" class="btn btn-outline-primary">목록보기</a>
    </div>
  </div>

  <div class="comment-section">
    <h4 class="fw-bold mb-4">📢 답변</h4>
    <c:forEach var="ans" items="${answerList}">

        <strong>${ans.mId}</strong>
        <small> (${ans.aTime})</small>
        <p>${ans.aContent}</p>
         <!-- 로그인한 사용자가 관리자일 경우 수정/삭제 표시 -->
	        <c:if test="${loginUser != null && loginUser.mRole eq 'admin'}">
	            <a href="/answer/edit?aNum=${ans.aNum}" class="btn btn-sm btn-success">수정</a>
	            <a href="/answer/delete?aNum=${ans.aNum}&iNum=${inquiry.iNum}"class="btn btn-sm btn-outline-danger ms-1"
	               onclick="return confirm('답변을 삭제하시겠습니까?');">삭제</a>
	        </c:if>
	     </c:forEach>   
        <!-- 관리자만 답변 작성 가능 -->
	<c:if test="${loginUser != null && loginUser.mRole eq 'admin'}">
	    <h3>답변 작성</h3>
	    <form action="/answer/add" method="post">
	        <input type="hidden" name="iNum" value="${inquiry.iNum}" />
	        <textarea name="aContent" class="form-control" rows="3" placeholder="댓글을 입력하세요…" required></textarea>
	        <button type="submit" class="btn btn-primary mt-2">댓글 등록</button>
	    </form>
	</c:if>
</div>
</div>
<%@ include file="../section/footer.jsp" %>

</body>
</html>
