<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginProcess" method="post">
    	아이디: <input type="text" name="mId" /><br/>
    	비밀번호: <input type="password" name="mPasswd" /><br/>
    	<button type="submit">로그인</button>
	</form>
	
	<hr/>

	<h2>또는 소셜 로그인</h2>
	<a href="${pageContext.request.contextPath}/oauth2/authorization/kakao">
    <img src="https://developers.kakao.com/assets/img/about/logos/kakaologin/kr/kakao_login_medium_wide.png" 
         alt="카카오 로그인"
         style="width: 220px;" />
	</a>
</body>
</html>