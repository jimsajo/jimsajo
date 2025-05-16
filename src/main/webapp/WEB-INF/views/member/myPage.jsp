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
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- JS -->
  <script src="/js/memberDelete.js"></script>
</head>
<body>

<!-- 로고 -->
<div class="text-center mt-4">
  <a href="/">
    <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
  </a>
</div>

<!-- 전체 컨테이너 -->
<div class="container mt-5">
  <div class="row d-flex align-items-stretch">

    <!-- 사이드 메뉴 -->
    <div class="col-md-3 h-100">
      <div class="list-group h100">
        <a href="/payment/paymentList" class="list-group-item list-group-item-action">주문조회</a>
        <sec:authorize access="hasRole('ROLE_user')">
        <a href="/inquiry" class="list-group-item list-group-item-action">1대1 문의하기</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="#" class="list-group-item list-group-item-action">1대1 문의 답변하기</a>
        </sec:authorize>
        <a href="/memberUpdate" class="list-group-item list-group-item-action">정보수정</a>
        <a href="#" class="list-group-item list-group-item-action" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</a>
        <sec:authorize access="hasRole('ROLE_admin')">
          <a href="/package" class="list-group-item list-group-item-action">상품등록</a>
        </sec:authorize>
        <a href="/logout" class="list-group-item list-group-item-action">로그아웃</a>
      </div>
    </div>

    <!-- 메인 콘텐츠 (인삿말 + 문의 내역) -->
    <div class="col-md-9">

    <!-- 인삿말 -->
  	<sec:authorize access="isAuthenticated()">
    	<div class="text-center mt-2 mb-3">
      		<h3 class="fw-bold mb-2">
      	  		${sessionScope.loginUser.mName}님, 안녕하세요!
      		</h3>
    	</div>
  	</sec:authorize>

      <!-- 1:1 문의 내역 (회원용) -->
      <sec:authorize access="hasRole('ROLE_user')">
        <div class="card mb-5">
          <div class="card-header bg-dark text-white text-center fw-bold">
            1대1 문의 내역
          </div>
          <div class="card-body p-0">
            <table class="table table-bordered mb-0 text-center">
              <thead class="table-light">
                <tr>
                  <th>제목</th>
                  <th>타입</th>
                  <th>내용</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="inquiry" items="${list}">
                  <tr>
                    <td>${inquiry.iTitle}</td>
                    <td>${inquiry.iType}</td>
                    <td>${inquiry.iContent}</td>
                    <td>${inquiry.iTime}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </sec:authorize>

      <!-- 1:1 문의 내역 (관리자용) -->
      <sec:authorize access="hasRole('ROLE_admin')">
        <div class="card mt-4">
          <div class="card-header bg-dark text-white text-center fw-bold">
            1대1 문의 내역
          </div>
          <div class="card-body text-center">
            <p class="text-muted">문의 내역이 없습니다</p>
          </div>
        </div>
      </sec:authorize>
      
      <!--예약 내역확인 -->
      <sec:authorize access="hasRole('ROLE_user')">
        <div class="card">
          <div class="card-header bg-dark text-white text-center fw-bold">
          		예약 내역
          </div>
          <div class="card-body p-0">
            <table class="table table-bordered mb-0 text-center">
              <thead class="table-light">
                <tr>
                  <th>#</th>
                  <th>#</th>
                  <th>#</th>
                  <th>#</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="#" items="#">
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </sec:authorize>
    </div> 

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

</body>
</html>
