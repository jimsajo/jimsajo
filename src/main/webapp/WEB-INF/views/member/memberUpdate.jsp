<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- ✅ 정보 수정 버튼 -->
<div class="container text-center mt-5">
  <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#memberEditModal">
    정보 수정
  </button>
</div>

<!-- 팝업 창 -->
<div class="modal fade" id="memberEditModal" tabindex="-1" aria-labelledby="memberEditModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="memberEditModalLabel">정보 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        <form method="post" action="/memberUpdateProcess">
          <input type="hidden" name="mNum" value="${member.mNum}">

          <!-- 이메일(ID) -->
          <div class="mb-2">
            <input type="text" name="mId" value="${member.mId}" class="form-control" readonly>
          </div>

          <!-- 기존 비밀번호 -->
          <div class="mb-2">
            <input type="password" name="mPasswd" class="form-control" placeholder="기본 비밀번호 입력" required>
          </div>

          <!-- 새 비밀번호 -->
          <div class="mb-2">
            <input type="password" name="mPasswd" class="form-control" placeholder="비밀번호를 변경 하는 경우 입력하세요">
          </div>

          <!-- 비밀번호 확인 -->
          <div class="mb-2">
            <input type="password" name="mPasswdConfirm" class="form-control" placeholder="비밀번호 확인">
          </div>

          <!-- 이름 -->
          <div class="mb-2">
            <input type="text" value="${member.mName}" class="form-control" readonly>
          </div>

          <!-- 성별 -->
          <div class="mb-3">
            <label class="form-label">성별</label>
            <div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="mGender" value="M" ${member.mGender == 'M' ? 'checked' : ''} disabled>
                <label class="form-check-label">남자</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="mGender" value="F" ${member.mGender == 'F' ? 'checked' : ''} disabled>
                <label class="form-check-label">여자</label>
              </div>
            </div>
          </div>

          <!-- 연락처 -->
          <div class="mb-2">
            <input type="text" name="mTel" value="${member.mTel}" class="form-control" placeholder="연락처" required>
          </div>

          <!-- 제출 버튼 -->
          <div class="d-grid gap-2 mt-3">
            <button type="submit" class="btn btn-primary">수정 완료</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS (모달 작동 필수) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
