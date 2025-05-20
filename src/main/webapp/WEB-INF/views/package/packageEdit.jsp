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
    <footer id="footer" class="footer position-relative dark-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6">
          <div class="footer-about">
            <a href="/" class="logo sitename">JIMSAJO</a>
            <div class="footer-contact pt-3">
              <p> 12th floor JIMSAJO 627, Jungang-daero, Busanjin-gu, Busan,</p>
              <p>Republic of Korea </p>
              <p class="mt-3"><strong>Phone:</strong> <span>82+ 9435 4524</span></p>
              <p><strong>Email:</strong> <span>jimsajo456@gmail.com</span></p>
            </div>
            <div class="social-links d-flex mt-4">
              <a href=""><i class="bi bi-twitter-x"></i></a>
              <a href=""><i class="bi bi-facebook"></i></a>
              <a href=""><i class="bi bi-instagram"></i></a>
              <a href=""><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">JIMSAJO</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
  <script src="/assets/vendor/aos/aos.js"></script>
  <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="/assets/js/main.js"></script>
</body>
</html>
