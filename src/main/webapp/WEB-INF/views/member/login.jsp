<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- login JS -->
    <script src = "/js/login.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-white">
    <div class="container" style="max-width: 400px;">
        <div class="text-center mb-4">
            <a href="/">
                <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" class="img-fluid" style="height: 150px;">
            </a>
        </div>
        <h3 class="text-center mb-4">Login</h3>
        <form action="loginProcess" method="post" name = "login" onsubmit ="return validateForm()">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="mId" name="mId" placeholder="아이디 입력">
                <label for="mId">아이디</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="mPasswd" name="mPasswd" placeholder="비밀번호 입력">
                <label for="mPasswd">비밀번호</label>
            </div>
            <button type="submit" class="btn btn-dark w-100 mb-3 py-3">로그인</button>
        </form>
        <div class="d-flex align-items-center mb-3">
            <hr class="flex-grow-1 me-2">
            <span class="text-muted">또는</span>
            <hr class="flex-grow-1 ms-2">
        </div>
        <a href="/oauth2/authorization/kakao"
           class="btn w-100 fw-bold text-dark py-3"
           style="background-color: #FEE500;">
            <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
     		alt="카카오 아이콘"
     		style="width: 20px; margin-right: 8px;">
            카카오 로그인
        </a>
    </div>
</body>
</html>
