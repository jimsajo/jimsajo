<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>


<c:if test="${not empty sessionScope.mId}">
    <p>${sessionScope.loginUser.mName}님 환영합니다!</p>
    <a href="/logout">로그아웃</a>
</c:if>
	<form name = "myPage" method ="post">
		<div>
			<label for = "inquiry"></label>
			<a href = "/inquiry">1대1 문의</a>
		</div>
		
		<div>
			<label for = "memberUpdate"></label>
			<a href = "/memberUpdate">정보수정</a>
		</div>
		
		<div>
			<label for = "memberDelete"></label>
			<a href = "/memberDelete">회원탈퇴</a>
		</div>
		
		<sec:authorize access="hasRole('ROLE_admin')">
		<div>
			<label for = "package"></label>
			<a href = "/package">상품등록</a>
		</div>
		</sec:authorize>
		
		
	</form>
</body>
</html>