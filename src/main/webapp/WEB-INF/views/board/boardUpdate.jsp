<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<form name="boardUpdate" method="post" action="/boardUpdate" enctype="multidata/form">
		<input type="hidden" name="bNum" value="${board.bNum}">
		
		<div>
			<label for="bTitle">제목: </label>
			<input type="text" id="bTitle" name="bTitle" value="${board.bTitle}">
		</div>
		
		<div>
			<label for="bContent">내용:</label>
			<textarea id="bContent" name="bContent" cols="10" rows="10">${board.bContent}</textarea>
		</div>
		
		<input type="submit" value="수정완료">
	</form>
</body>
</html>
