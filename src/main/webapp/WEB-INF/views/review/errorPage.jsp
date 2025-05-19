<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⚠️ ERROR - SYSTEM FAILURE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/errorpage.css" rel="stylesheet">
</head>
<body>
  <div class="error-icon">💥💀</div>
  <div class="glitch-text">SYSTEM ERROR DETECTED</div>

  <div class="error-box mt-4">
    <h2>오류 발생!</h2>
    <p class="lead">${message}</p>
    <a href="/" class="btn btn-danger">😈 돌아가기</a>
  </div>
</body>
</html>
