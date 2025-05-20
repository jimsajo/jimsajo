<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
 <jsp:include page="../section/header.jsp"/>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<a href="/"><img src="/images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

	<form name="boardUpdate" method="post" action="/boardUpdate" enctype="multidata/form">
		<input type="hidden" name="bNum" value="${board.bNum}">
		
		<div>
			<label for="bTitle">제목: </label>
			<input type="text" id="bTitle" name="bTitle" value="${board.bTitle}">
		</div>
		
		<div>
			<label for="bContent">내용:</label>
			<textarea id="editor" name="bContent" cols="10" rows="10">${board.bContent}</textarea>
		</div>
		
		<input type="submit" value="수정완료">
	</form>
<script src="../js/CKEditor5.js"></script>
<jsp:include page="../section/footer.jsp"/>
</body>
</html>
