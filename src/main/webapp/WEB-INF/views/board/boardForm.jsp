<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<form name = "form" method = "post" action = "boardSave" enctype = "multidata/form">
		<div>
			<label for ="bTitle">제목: </label>
			<input type = "text" id = "bTitle" name = "bTitle">
		</div>
		<label for = "bContent">내용:</label>
		<textarea id = "bContent" name = "bContent" cols ="10" rows = "10"></textarea>
		<input type = "submit" value = "작성완료">
	</form>
</body>
</html>