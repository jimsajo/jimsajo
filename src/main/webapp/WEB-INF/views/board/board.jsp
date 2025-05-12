<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
		<table border = "1">
			<tr>
				<td>NO</td>
				<td>제목</td>
				<td>작성시간</td>
				<td>조회수</td>
			</tr>
			
			<c:forEach var = "board" items = "${boards}">
			<tr>
				<td>${board.bNum}</td>
				<td><a href = "/board/${board.bNum}/detail">${board.bTitle}</a></td>
				<td>${board.bTime}</td>
				<td>${board.bCnt}</td>
			</tr>
			</c:forEach>
		</table>
		<a href="/newBoard">글쓰기</a></p>
</body>
</html>