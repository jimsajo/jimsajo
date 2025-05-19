<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 목록</title>
  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">



  <!-- 로고 -->
  <div class="text-center my-4">
    <a href="/">
      <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
    </a>
  </div>

  <!-- 공지사항 테이블 -->
  <div class="container">
    <div class="card shadow">
      <div class="card-header bg-dark text-white text-center fs-5 fw-bold">
        공지사항 목록
      </div>
      <div class="card-body p-0">
        <table class="table table-bordered text-center mb-0">
          <thead class="table-light">
            <tr>
              <th>NO</th>
              <th>제목</th>
              <th>작성시간</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="board" items="${boards}">
              <tr>
                <td>${board.bNum}</td>
                <td class="text-start">
                  <a href="/board/${board.bNum}/detail" class="text-decoration-none text-dark">
                    ${board.bTitle}
                  </a>
                </td>
                <td>${board.bTime}</td>
                <td>${board.bCnt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
  <nav class="mt-4">
  <ul class="pagination justify-content-center">
    <c:if test="${currentPage > 1}">
      <li class="page-item">
        <a class="page-link" href="?page=${currentPage - 1}">이전</a>
      </li>
    </c:if>

    <c:forEach begin="1" end="${totalPage}" var="i">
      <li class="page-item ${i == currentPage ? 'active' : ''}">
        <a class="page-link" href="?page=${i}">${i}</a>
      </li>
    </c:forEach>

    <c:if test="${currentPage < totalPage}">
      <li class="page-item">
        <a class="page-link" href="?page=${currentPage + 1}">다음</a>
      </li>
    </c:if>
  </ul>
</nav>
  

  <!-- Bootstrap JS (선택, 모달이나 드롭다운 등에 필요 시) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
