<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- 로고 -->
    <div class="text-center my-4">
        <a href="/">
            <img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;">
        </a>
    </div>

    <!-- 공지사항 작성 폼 -->
    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-dark text-white text-center fw-bold fs-5">
                공지사항 작성
            </div>
            <div class="card-body">
                <form name="form" method="post" action="boardSave" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="bTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="bTitle" name="bTitle" required>
                    </div>

                    <div class="mb-3">
                        <label for="bContent" class="form-label">내용</label>
                        <textarea id="editor" name="bContent" class="form-control" placeholder="내용을 입력하세요."></textarea>
                    </div>

                    <div class="text-end">
                        <input type="submit" value="작성 완료" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- CKEditor5 로드 및 적용 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
    <script>
    ClassicEditor
        .create(document.querySelector('#editor'), {
            ckfinder: {
                uploadUrl: '/api/upload-package-image'
            },
            toolbar: ['heading', '|', 'bold', 'italic', '|', 'link', 'imageUpload']
        })
        .catch(error => {
            console.error(error);
        });
    </script>

    <!-- Bootstrap JS (선택) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
