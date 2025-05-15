<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>문의 작성</title>
<style>

</style>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
    <h2>문의 작성</h2>
	<hr>
    <form  method="post" action="/inquiryList">
        제목: <input type="text" name="iTitle" placeholder="제목"><br>
        유형: <input type="text" name="iType"><br>
    		<textarea id="editor" name="iContent"></textarea>
        <input type="hidden" name="mNum" value="1">
        <input type="submit" value="제출">
    </form>
    <script>
    ClassicEditor
    .create(document.querySelector('#editor'), {
        ckfinder: {
            uploadUrl: '/api/upload-package-image'  // 패키지 업로드 URL 지정 (다른 URL로 수정)
        },
        toolbar: ['heading', '|', 'bold', 'italic', '|', 'link', 'imageUpload']
    })
    .catch(error => {
        console.error(error);
    });

</script>
</body>
</html>
