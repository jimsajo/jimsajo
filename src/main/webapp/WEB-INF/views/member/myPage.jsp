<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Main CSS -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body class="index-page">

<!-- 헤더 -->
<%@include file = "../section/header.jsp" %>

<!-- 전체 레이아웃 컨테이너 -->
<div class="container mt-5 pt-5">
  <div class="row">

    <!-- 사이드 메뉴 -->
    <div class="col-md-3">
      <div class="list-group">
        <sec:authorize access="hasRole('ROLE_user')">
          <a href="/payment/paymentList" class="list-group-item list-group-item-action">주문상세보기</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/orders/orderList" class="list-group-item list-group-item-action">전체주문내역</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_user')">
          <a href="/inquiry" class="list-group-item list-group-item-action">1대1 문의하기</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/newBoard" class="list-group-item list-group-item-action">공지사항 작성</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="#" class="list-group-item list-group-item-action">1대1 문의 답변하기</a>
        </sec:authorize>
        <a href="#" class="list-group-item list-group-item-action" data-bs-toggle="modal" data-bs-target="#updateModal">정보수정</a>
        <sec:authorize access="hasRole('ROLE_user')">
          <a href="#" class="list-group-item list-group-item-action" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/package" class="list-group-item list-group-item-action">상품등록</a>
        </sec:authorize>
        <a href="/logout" class="list-group-item list-group-item-action">로그아웃</a>
        <a href="/review" class="list-group-item list-group-item-action">✍️ 리뷰 작성하기</a>
      </div>
    </div>

    <!-- 메인 콘텐츠 영역 -->
    <div class="col-md-9">

      <!-- 인사말 -->
      <sec:authorize access="isAuthenticated()">
        <div class="text-center mb-4" style="margin-top: 100px;">
          <h3 class="fw-bold">${sessionScope.loginUser.mName}님, 안녕하세요!</h3>
        </div>
      </sec:authorize>

      <!-- 주문 내역 -->
      <sec:authorize access="hasRole('ROLE_user')">
        <div class="text-center mb-3">
          <h4 class="fw-bold">🛒 내 주문 내역</h4>
        </div>
        <c:choose>
          <c:when test="${empty payments}">
            <div class="text-center text-muted fs-5 mb-5">
              주문 내역이 없습니다.
            </div>
          </c:when>
          <c:otherwise>
            <div class="table-responsive mb-5">
              <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                  <tr>
                    <th>상품명</th>
                    <th>출발날짜</th>
                    <th>도착날짜</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="payment" items="${payments}">
                    <tr>
                      <td>${payment.pName}</td>
                      <td>${payment.oStart}</td>
                      <td>${payment.oReturn}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </c:otherwise>
        </c:choose>
      </sec:authorize>
	</div>
<!-- 회원정보 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 600px; margin: auto;">
    <form method="post" action="/memberUpdateProcess" onsubmit = "return validateForm(this)">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title fw-bold" id="updateModalLabel">회원정보 수정</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="mNum" value="${sessionScope.loginUser.mNum}">
          <input type="hidden" name="mId" value="${sessionScope.loginUser.mId}">

          <!-- 아이디 -->
          <div class="mb-3">
            <label class="form-label">아이디</label>
            <input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mId}" readonly>
          </div>

          <!-- 기존 비밀번호 -->
          <div class="mb-3">
            <input type="password" name="currentPasswd" class="form-control" placeholder="기존 비밀번호 입력">
          </div>

          <!-- 새 비밀번호 -->
          <div class="mb-3">
            <input type="password" name="newPasswd" class="form-control" placeholder="새로운 비밀번호 입력">
          </div>

          <!-- 비밀번호 확인 -->
          <div class="mb-3">
            <input type="password" name="passwdConfirm" class="form-control" placeholder="비밀번호 확인">
          </div>

          <!-- 이름 -->
          <div class="mb-3">
            <label class="form-label">이름</label>
            <input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mName}" readonly>
          </div>

          <!-- 성별 -->
          <div class="mb-3">
            <label class="form-label d-block">성별</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="mGender" id="genderM" value="M"
                <c:if test="${sessionScope.loginUser.mGender == 'M'}">checked</c:if> disabled>
              <label class="form-check-label" for="genderM">남자</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="mGender" id="genderF" value="F"
                <c:if test="${sessionScope.loginUser.mGender == 'F'}">checked</c:if> disabled>
              <label class="form-check-label" for="genderF">여자</label>
            </div>
          </div>

          <!-- 연락처 -->
          <div class="mb-3">
            <label class="form-label">연락처</label>
            <input type="text" name="mTel" class="form-control" placeholder="'-'없이 입력해주세요." value="${sessionScope.loginUser.mTel}">
          </div>

          <!-- 생년월일 -->
          <div class="mb-3">
            <label class="form-label">생년월일</label>
            <input type="text" class="form-control bg-light" value="${sessionScope.loginUser.mBirth}" readonly>
          </div>

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
</div>
</div>

<!-- 기존 비밀번호 다르게 입력했을때 프롬포트 창 띄우기 -->
<c:if test="${not empty errorMsg}">
<script>
  window.addEventListener('DOMContentLoaded', function () {
    alert("${errorMsg}");
  });
</script>
</c:if>
<!-- 페이지 로드시 정보수정 모달 자동 오픈 -->
<c:if test="${param.openUpdate eq 'true'}">
<script>
  window.addEventListener('DOMContentLoaded', function () {
    var updateModal = new bootstrap.Modal(document.getElementById('updateModal'));
    updateModal.show();
  });
</script>
</c:if>
<!--비밀번호 변경 후 알림 -->
<c:if test="${openPopup}">
<script>
  window.addEventListener('DOMContentLoaded', function () {
    alert('비밀번호가 성공적으로 변경되었습니다.');
  });
</script>
</c:if>
</body>
</html>
