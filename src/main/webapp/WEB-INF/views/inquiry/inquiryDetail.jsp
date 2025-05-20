<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>문의 상세보기</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<h2>문의 상세보기</h2>

<!-- 문의 내용 출력 -->
<c:if test="${not empty inquiry}">
    <p><strong>제목:</strong> ${inquiry.iTitle}</p>
    <p><strong>타입:</strong> ${inquiry.iType}</p>
    <p><strong>내용:</strong> ${inquiry.iContent}</p> <!-- iContent 필드가 있다고 가정 -->
    <p><strong>작성일:</strong> ${inquiry.iTime}</p> <!-- 작성일 필드 추가 여부 확인 필요 -->

    <!-- 수정 및 삭제 버튼 추가 -->
    <a href="/inquiry/edit?iNum=${inquiry.iNum}">수정</a>
    <a href="/inquiry/delete?iNum=${inquiry.iNum}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
</c:if>

<!-- 문의가 없을 경우 -->
<c:if test="${empty inquiry}">
    <p>문의 내용이 없습니다.</p>
</c:if>

<hr>
<h3>답변 목록</h3>
	<c:forEach var="ans" items="${answerList}">
	        <p><strong>작성자:</strong> ${ans.mId}</p>
	        <p>${ans.aContent}</p>
	        <p><small>${ans.aTime}</small></p>
	        
	        <!-- 로그인한 사용자가 관리자일 경우 수정/삭제 표시 -->
	        <c:if test="${loginUser != null && loginUser.mRole eq 'admin'}">
	            <a href="/answer/edit?aNum=${ans.aNum}">수정</a>
	            <a href="/answer/delete?aNum=${ans.aNum}&iNum=${inquiry.iNum}"
	               onclick="return confirm('답변을 삭제하시겠습니까?');">삭제</a>
	        </c:if>
	</c:forEach>

	<!-- 관리자만 답변 작성 가능 -->
	<c:if test="${loginUser != null && loginUser.mRole eq 'admin'}">
	    <h3>답변 작성</h3>
	    <form action="/answer/add" method="post">
	        <input type="hidden" name="iNum" value="${inquiry.iNum}" />
	        <textarea name="aContent" rows="5" cols="50" required></textarea><br/>
	        <button type="submit">답변 등록</button>
	    </form>
	</c:if>

<a href="/inquiry/inquiryList">목록으로 돌아가기</a> <!-- 목록으로 돌아가기 링크 추가 -->

</body>
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
</html>
