<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "C" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

	<h3>${board.bTitle}</h3>
	<p>작성자 : ${board.mName} | 작성시간 : ${board.bTime} | 조회수 : ${board.bCnt}</p>
	<hr/>
	 <div>내용 : ${board.bContent}</div></p>
	 
	 <sec:authorize access="hasRole('ROLE_admin')">
	 <a href="/board/${board.bNum}/update">수정</a>
	 <a href="/board/${board.bNum}/delete">삭제</a>
	 </sec:authorize>
	 <a href="/board">목록으로</a>
</body>
</html>