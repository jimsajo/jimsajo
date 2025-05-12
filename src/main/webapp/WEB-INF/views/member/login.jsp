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

	<c:if test="${not empty error}">
    	<p style="color:red;">${error}</p>
	</c:if>
	
</body>
</html>