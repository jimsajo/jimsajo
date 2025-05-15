<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패키지 상품 등록</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

    <!-- CKEditor5 로딩 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>

    <!-- 업로드 폼 -->
    <form method="post" action="/write" enctype="multipart/form-data">
    나라 : 
    <select name="pCountry" id="pCountry">
        <option value="">-- 선택하세요 --</option>
        <option value="Vietnam">베트남</option>
        <option value="Thailand">태국</option>
        <option value="Indonesia">인도네시아</option>
        <option value="Malaysia">말레이시아</option>
        <option value="Philippines">필리핀</option>
    </select><br>

    제목 : <input type="text" name="pName" placeholder="제목"><br>
    가격 : <input type="number" name="pPrice" placeholder="가격"><br>

    상세내용 : <textarea id="editor" name="pDescription"></textarea><br>

    이미지 업로드: 
    <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(event)"><br> <!-- 수정 -->
    <img id="preview" alt="이미지 미리보기" style="max-width: 300px; display: none;"><br>

    <input type="submit" value="업로드"><br>
    <a href="/packagelist">← 목록으로 가기</a>
</form>


    <!-- 이미지 미리보기 스크립트 -->
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var preview = document.getElementById('preview');
                preview.src = reader.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

    <!-- CKEditor5 초기화 및 이미지 업로드 설정 -->
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
