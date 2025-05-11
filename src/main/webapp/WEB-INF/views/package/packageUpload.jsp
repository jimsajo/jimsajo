<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 상품 등록</title>
</head>
<body>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
	<form method="post" action="write">
	나라 : <select name="pCountry" id="pCountry">
    <option value="">-- 선택하세요 --</option>
    <option value="Vietnam">베트남</option>
    <option value="Thailand">태국</option>
    <option value="Indonesia">인도네시아</option>
    <option value="Malaysia">말레이시아</option>
    <option value="Philippines">필리핀</option>
    </select><br>
	제목 : <input type="text" name="pName" placeholder="제목"><br>
	상새내용 : <textarea id="editor" name="pDescription"></textarea>
	<input type="submit" value="작성"><br>
 <a href="/packagelist">← 목록으로 가기</a>
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