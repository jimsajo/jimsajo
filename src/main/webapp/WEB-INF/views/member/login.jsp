<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container d-flex justify-content-center mt-5">
  <form action="loginProcess" method="post" class="w-100" style="max-width: 400px;">
    <!-- 로고 -->
    <div class="text-center mb-4">
      <a href="/">
        <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
      </a>
    </div>
    <div class="mb-4 text-center">
  		<h3>Login</h3>
	</div>

    <!-- 아이디 -->
    <div class="mb-4">
      <label for="mId" class="form-label">아이디</label>
      <input type="text" class="form-control form-control-lg" id="mId" name="mId" placeholder="아이디 입력">
    </div>

    <!-- 비밀번호 -->
    <div class="mb-4">
      <label for="mPasswd" class="form-label">비밀번호</label>
      <input type="password" class="form-control form-control-lg" id="mPasswd" name="mPasswd" placeholder="비밀번호 입력">
    </div>

    <!-- 버튼 -->
    <button type="submit" class="btn btn-dark btn-lg w-100">로그인</button>
    <div class="d-flex align-items-center mb-4 mt-3">
  		<hr class="flex-grow-1">
  		<span class="mx-2 text-muted">또는</span>
  		<hr class="flex-grow-1">
	</div>
	<!-- 카카오 로그인 버튼 -->
	<a href="/oauth2/authorization/kakao" 
	   class="btn w-100 d-flex align-items-center justify-content-center gap-2"
	   style="background-color: #FEE500; color: #3C1E1E; height: 50px;">
	   <img src="/images/kakao_login2.png" style = "width : 350px; height : 50px" >
	</a>
  </form> 
</div>

	
</body>
</html>