<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>패키지 수정</title>
    <!-- ✅ CKEditor CDN 추가 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

    <h1>패키지 수정</h1>

    <form action="/package/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pNum" value="${dto.pNum}">
        
        제목: <input type="text" name="pName" value="${dto.pName}" required><br>
        국가: <input type="text" name="pCountry" value="${dto.pCountry}" required><br>
        가격 : <input type="number" name="pPrice" value="${dto.pPrice}" placeholder="가격" required><br>
        
        상세내용 : 
        <textarea id="editor" name="pDescription">${dto.pDescription}</textarea><br>

        <!-- ✅ 기존 이미지 썸네일 표시 (경로 /images/로 수정) -->
        <div>
            <img src="${pageContext.request.contextPath}/uploads/images/${dto.pImage}" alt="썸네일 이미지" style="max-width: 200px;">


        </div>

        <!-- 이미지 수정 -->
        <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(event)"><br>
        <img id="preview" alt="이미지 미리보기" style="max-width: 300px; display: none;"><br>

        <input type="submit" value="수정 완료">
    </form>

    <script>
        // ✅ CKEditor 초기화
        ClassicEditor
            .create(document.querySelector('#editor'), {
            	ckfinder: {
            	    uploadUrl: '${pageContext.request.contextPath}/api/upload-package-image'  // API URL로 수정
            	}

            })
            .catch(error => {
                console.error('CKEditor 초기화 실패:', error);
            });

        // 이미지 미리보기
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('preview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
<jsp:include page="../section/footer.jsp"/>
</body>
</html>
