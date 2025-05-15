<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

	<h2>리뷰 목록</h2>
	<hr>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>국가</th>
		</tr>
		<c:forEach var="rw" items="${reviews}">
			<tr>
				<td>${rw.rNum}</td>
				<td>${rw.mId}</td>
				<td><a href="/reviewDetail/${rw.rNum}">${rw.rTitle}</a></td>
				<td>${rw.rDate}</td>
				<td>${rw.rCnt}</td>
				<td>${rw.pCountry}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/review">리뷰쓰기</a>
</body>
</html>