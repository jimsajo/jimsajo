<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>문의 상세보기</title>
    <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body>
<%@ include file="../section/header.jsp" %>
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
<%@ include file="../section/footer.jsp" %>
</body>
</html>
