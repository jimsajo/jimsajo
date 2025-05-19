<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <!-- CSS 및 JS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/memberUpdate.js"></script>
  <script src="/js/memberDelete.js"></script>
<<<<<<< HEAD
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/css/main.css" rel="stylesheet">
=======
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
</head>
<<<<<<< HEAD
<body class="index-page">

<header id="header" class="header fixed-top">
  <div class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">jimsajo456@gmail.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>010-9435-4524</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
  </div>

  <div class="branding d-flex align-items-center">
    <div class="container position-relative d-flex align-items-center justify-content-between">
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="/" class="active">홈</a></li>
          <li><a href="/packagelist/country?pCountry=Thailand">태국</a></li>
          <li><a href="/packagelist/country?pCountry=Indonesia">인도네시아</a></li>
          <li><a href="/packagelist/country?pCountry=Vietnam">베트남</a></li>
          <li><a href="/packagelist/country?pCountry=Malaysia">말레이시아</a></li>
          <li><a href="/packagelist/country?pCountry=Philippines">필리핀</a></li>
          <li class="dropdown"><a href="#"><span>공지사항</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="/board">공지사항</a></li>
              <li><a href="/reviewList">여행 리뷰</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
    </div>
  </div>
</header>
=======
<body>
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git

<!-- 로고 -->
<div class="text-center mt-4">
  <a href="/">
    <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
  </a>
</div>

<<<<<<< HEAD
<!-- 메인 컨테이너 -->
<div class="container" style="margin-top: 150px;">
=======
<!-- 전체 컨테이너 -->
<div class="container mt-5">
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
  <div class="row d-flex align-items-stretch">
    <!-- 사이드 메뉴 -->
    <div class="col-md-3 h-100">
      <div class="list-group">
        <a href="/payment/paymentList" class="list-group-item list-group-item-action">주문조회</a>
        <sec:authorize access="hasRole('ROLE_user')">
          <a href="/inquiry" class="list-group-item list-group-item-action">1대1 문의하기</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="#" class="list-group-item list-group-item-action">1대1 문의 답변하기</a>
        </sec:authorize>
        <a href="#" class="list-group-item list-group-item-action" data-bs-toggle="modal" data-bs-target="#updateModal">정보수정</a>
        <a href="#" class="list-group-item list-group-item-action" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</a>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/package" class="list-group-item list-group-item-action">상품등록</a>
        </sec:authorize>
        <a href="/logout" class="list-group-item list-group-item-action">로그아웃</a>
      </div>
    </div>

<<<<<<< HEAD
   <div class="col-md-9">
  <sec:authorize access="isAuthenticated()">
    <div class="text-center mt-2 mb-5">
      <h3 class="fw-bold">${sessionScope.loginUser.mName}님, 안녕하세요!</h3>
    </div>
  </sec:authorize>

  <!-- ▶ 주문 내역 섹션 -->
  <sec:authorize access="hasRole('ROLE_USER')">
    <div class="text-center mb-3">
      <h4 class="fw-bold">🛒 내 주문 내역</h4>
    </div>

    <!-- 디버그 : 실제 데이터 확인 -->
    <p>DEBUG: paymentList = ${paymentList}</p>
    <p>DEBUG: 개수 = <c:out value="${paymentList.size()}" default="0"/></p>

    <c:choose>
      <c:when test="${empty paymentList}">
        <p class="text-muted text-center">주문 내역이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <table class="table table-bordered text-center">
          <thead class="table-light">
            <tr>
              <th>주문번호</th>
              <th>주문일자</th>
              <th>총금액</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${paymentList}">
              <tr>
                <td>${p.paymentId}</td>
                <td>${p.paidAt}</td>
                <td>${p.payAmount}</td>
                <td>${p.payStatus}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>
  </sec:authorize>
</div>
=======

    <!-- 메인 콘텐츠 -->
    <div class="col-md-9">
      <sec:authorize access="isAuthenticated()">
        <div class="text-center mt-2 mb-3">
          <h3 class="fw-bold mb-2">
            ${sessionScope.loginUser.mName}님, 안녕하세요!
          </h3>
        </div>
      </sec:authorize>
	  
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
<!-- 회원정보 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 600px; margin: auto;">
    <form method="post" action="/memberUpdateProcess" onsubmit="return validateForm(this)">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title fw-bold" id="updateModalLabel">회원정보 수정</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="mNum" value="${sessionScope.loginUser.mNum}">
          <input type="hidden" name="mId" value="${sessionScope.loginUser.mId}">
          <div class="mb-3"><input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mId}" readonly></div>
          <div class="mb-3"><input type="password" name="currentPasswd" class="form-control" placeholder="기존 비밀번호 입력"></div>
          <div class="mb-3"><input type="password" name="newPasswd" class="form-control" placeholder="새로운 비밀번호 입력"></div>
          <div class="mb-3"><input type="password" name="passwdConfirm" class="form-control" placeholder="비밀번호 확인"></div>
          <div class="mb-3"><input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mName}" readonly></div>
          <div class="mb-3">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="mGender" value="M" <c:if test="${sessionScope.loginUser.mGender == 'M'}">checked</c:if> disabled>
              <label class="form-check-label">남자</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="mGender" value="F" <c:if test="${sessionScope.loginUser.mGender == 'F'}">checked</c:if> disabled>
              <label class="form-check-label">여자</label>
            </div>
          </div>
          <div class="mb-3"><input type="text" name="mTel" class="form-control" value="${sessionScope.loginUser.mTel}"></div>
          <div class="mb-3"><input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mBirth}" readonly></div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">수정 완료</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- 회원탈퇴 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form method="post" action="/memberDeleteCheck">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">비밀번호 확인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
        </div>
        <div class="modal-body">
          <p>탈퇴하시려면 비밀번호를 입력해주세요.</p>
          <input type="password" class="form-control" name="mPasswd" required placeholder="비밀번호">
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger">탈퇴하기</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        </div>
      </div>
    </form>
  </div>
</div>

<<<<<<< HEAD
<!-- JS 알림 -->
=======
<!-- 기존 비밀번호 다르게 입력했을때 프롬포트 창 띄우기 -->
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
<c:if test="${not empty errorMsg}">
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      alert("${errorMsg}");
    });
  </script>
</c:if>

<c:if test="${param.openUpdate eq 'true'}">
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      new bootstrap.Modal(document.getElementById('updateModal')).show();
    });
  </script>
</c:if>

<c:if test="${openPopup}">
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      alert('비밀번호가 성공적으로 변경되었습니다.');
    });
  </script>
</c:if>

</body>
</html>
