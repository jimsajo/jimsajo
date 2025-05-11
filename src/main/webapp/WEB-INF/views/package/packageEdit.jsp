<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패키지 수정</title>
</head>
<body>
 <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
    <h1>패키지 수정</h1>

    <form action="/package/update" method="post">
        <input type="hidden" name="pNum" value="${dto.pNum}">
        제목: <input type="text" name="pName" value="${dto.pName}"><br>
        국가: <input type="text" name="pCountry" value="${dto.pCountry}"><br>
        상새내용 : <textarea id="editor" name="pDescription">${dto.pDescription}</textarea><br>
        <input type="submit" value="수정 완료">
    </form>
    
    <script>
	  ClassicEditor
	    .create(document.querySelector('#editor'), {
	      ckfinder: {
	        uploadUrl: '/upload-image' // Spring Boot 업로드 API
	      }
	    })
	    .catch(error => {
	      console.error(error);
	    });
	</script>
</body>
</html>
