<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>문의 수정</title>
</head>
<body>
<h2>문의 수정</h2>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<form action="/inquiry/update" method="POST">
    <input type="hidden" name="iNum" value="${inquiry.iNum}"> <!-- 문의 번호를 hidden으로 전달 -->
    
    <p><strong>제목:</strong> <input type="text" name="iTitle" value="${inquiry.iTitle}" required></p>
    <p><strong>타입:</strong> <input type="text" name="iType" value="${inquiry.iType}" required></p>
    <p><strong>내용:</strong> <textarea id="editor" name="iContent">${inquiry.iContent}</textarea></p>
    <p><strong>작성일:</strong> ${inquiry.iTime}</p> <!-- 작성일은 수정하지 않음 -->
    
    <button type="submit">수정하기</button>
</form>

<a href="/inquiry/inquiryList">목록으로 돌아가기</a> <!-- 목록으로 돌아가기 링크 추가 -->
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
