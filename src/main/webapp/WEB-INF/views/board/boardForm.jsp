<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
</head>
<body>
    <form name="form" method="post" action="boardSave" enctype="multipart/form-data">
        <div>
            <label for="bTitle">제목: </label>
            <input type="text" id="bTitle" name="bTitle">
        </div>
        <label for="bContent"></label>
        <textarea id="bContent" name="bContent" placeholder="내용을 입력하세요."></textarea>

        <input type="submit" value="작성완료">
    </form>

    <!-- CKEditor5 로드 및 적용 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
    <script>
        ClassicEditor
        .create(document.querySelector('#bContent'), {  // id를 'bContent'로 수정
            ckfinder: {
                uploadUrl: '/api/upload-board-image'  // 업로드 URL 수정 (게시판 이미지 업로드 경로)
            },
            toolbar: ['heading', '|', 'bold', 'italic', '|', 'link', 'imageUpload']  // 툴바 설정
        })
        .catch(error => {
            console.error(error);
        });
    </script>
</body>
</html>
