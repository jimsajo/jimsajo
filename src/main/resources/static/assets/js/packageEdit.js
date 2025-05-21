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