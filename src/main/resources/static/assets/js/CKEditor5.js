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