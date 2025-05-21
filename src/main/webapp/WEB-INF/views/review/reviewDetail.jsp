<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jimsajo.Dto.CommentDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
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
  <link href="${pageContext.request.contextPath}/assets/css/reviewDetail.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">
<%@ include file="../section/header.jsp"%>
 
<div class="position-relative text-center" style="margin-top: 140px; margin-bottom: 20px; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);">
  <h3 class="mb-1 fw-bold" style="color: #00CFFF;">
    📸 내가 쓴 리뷰 보기 🧳
  </h3>
  <p class="mb-0" style="color: #FFB866; font-size: 1rem;">🌴 나만의 여행 이야기를 다시 만나보세요!</p>
</div>

<div class="container">
  <div class="review-container">
    <h1 class="review-title">${review.rTitle}</h1>
    <div class="review-meta">
      ${review.mId} | <fmt:formatDate value="${review.rDate}" pattern="yyyy-MM-dd" /> | 조회수 ${review.rCnt}
    </div>
    <div class="mt-2">
      <span class="badge bg-primary">${review.pCountry}</span>
    </div>
    <div class="review-content">
      <p>${review.rReview}</p>
      <c:if test="${not empty review.rImage}">
        <img src="/assets/img/package/${review.rImage}" class="img-fluid rounded mt-3" style="max-height: 400px;">
      </c:if>
    </div>
    <form action="${pageContext.request.contextPath}/review/toggleGood" method="post" class="mt-4">
      <input type="hidden" name="rNum" value="${review.rNum}">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <button type="submit" class="btn btn-outline-danger">
        <c:choose>
          <c:when test="${goodByUser}">♥</c:when>
          <c:otherwise>♡</c:otherwise>
        </c:choose> 좋아요 (${goodCnt})
      </button>
    </form>

    <div class="btn-area text-end">
      <a href="${pageContext.request.contextPath}/review/updateReview/${review.rNum}" class="btn btn-secondary">수정</a>
      <a href="${pageContext.request.contextPath}/review/deleteReview/${review.rNum}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
      <a href="${pageContext.request.contextPath}/review/reviewList" class="btn btn-outline-primary">목록보기</a>
    </div>
  </div>

  <div class="comment-section">
    <h4 class="fw-bold mb-4">📢 댓글</h4>
    <c:forEach var="comment" items="${comments}">
      <div class="comment ms-${comment.depth * 3}">
        <strong>${comment.mId}</strong>
        <small> (${comment.cCreate})</small>
        <p>${comment.cContent}</p>
        <c:if test="${loginUser != null && loginUser.mNum == comment.mNum}">
          <form action="${pageContext.request.contextPath}/review/commentUpdate" method="post">
            <input type="hidden" name="rNum" value="${comment.rNum}" />
            <input type="hidden" name="cNum" value="${comment.cNum}" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <textarea name="cContent" class="form-control mb-2" required>${comment.cContent}</textarea>
            <button type="submit" class="btn btn-sm btn-success">수정</button>
            <a href="${pageContext.request.contextPath}/review/commentDelete/${comment.cNum}/${comment.rNum}/${comment.parentCNum == 0}" class="btn btn-sm btn-outline-danger ms-1">삭제</a>
          </form>
        </c:if>
        <c:if test="${loginUser != null}">
          <form action="${pageContext.request.contextPath}/review/commentAdd" method="post" class="reply-box">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="rNum" value="${comment.rNum}" />
            <input type="hidden" name="parentCNum" value="${comment.parentCNum}" />
            <input type="text" name="cContent" class="form-control" placeholder="답글을 입력하세요" required>
            <button type="submit" class="btn btn-sm btn-outline-primary mt-2">답글</button>
          </form>
        </c:if>
      </div>
    </c:forEach>

    <form action="${pageContext.request.contextPath}/review/commentAdd" method="post" class="mt-4">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="hidden" name="rNum" value="${review.rNum}" />
      <input type="hidden" name="parentCNum" value="0" />
      <textarea name="cContent" class="form-control" rows="3" placeholder="댓글을 입력하세요…" required></textarea>
      <button type="submit" class="btn btn-primary mt-2">댓글 등록</button>
    </form>
  </div>
</div>


<%@ include file="../section/footer.jsp"%>

</body>
</html>