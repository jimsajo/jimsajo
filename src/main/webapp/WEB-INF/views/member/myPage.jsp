<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<form name = "myPage" method ="post" action = memberDelete>
		<div>
			<label for = "inquiry"></label>
			<a href = "#">1대1 문의</a>
		</div>
		
		<div>
			<label for = "memberUpdate"></label>
			<a href = "#">정보수정</a>
		</div>
		
		<div>
			<label for = "memberDelete"></label>
			<a href = "/memberDelete">회원탈퇴</a>
		</div>
	</form>
</body>
</html>