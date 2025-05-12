<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "C" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
	<h3>${board.bTitle}</h3>
	<p>작성자 : ${board.mName} | 작성시간 : ${board.bTime} | 조회수 : ${board.bCnt}</p>
	<hr/>
	 <div>내용 : ${board.bContent}</div></p>
	 
	 
	 <a href="/board/${board.bNum}/update">수정</a>
	 <a href="/board/${board.bNum}/delete">삭제</a>
	 <a href="/board">목록으로</a>
</body>
</html>