<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 상세보기</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

  <!-- 로고 -->
  <div class="text-center my-4">
    <a href="/">
      <img src="/images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
    </a>
  </div>

  <!-- 공지사항 상세보기 카드 -->
  <div class="container">
    <div class="card shadow">
      <div class="card-header bg-dark text-white fw-bold fs-5">
        ${board.bTitle}
      </div>
      <div class="card-body">
        <p class="text-muted mb-2">
          작성자: ${board.mName} &nbsp;|&nbsp; 작성시간: ${board.bTime} &nbsp;|&nbsp; 조회수: ${board.bCnt}
        </p>
        <hr>
        <div style="min-height: 150px;">
          <c:out value="${board.bContent}" escapeXml="false" />
        </div>
      </div>
      <div class="card-footer bg-white text-end">
        <a href="/board" class="btn btn-secondary me-2">목록으로</a>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/board/${board.bNum}/update" class="btn btn-warning me-2">수정</a>
          <a href="/board/${board.bNum}/delete" class="btn btn-danger">삭제</a>
        </sec:authorize>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
