<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>패키지 상세보기</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

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
<body class="index-page">
 <%@ include file="../section/header.jsp" %>

		<h1>패키지 상세정보</h1>
			<p>제목: ${dto.pName}</p>
			<p>국가: ${dto.pCountry}</p>
			<p>작성일: ${dto.pCreate}</p>
			<p>내용:</p>
		<div>${dto.pDescription}</div>
		<form method="get" action="/orders/ordersform" class="text-center mt-2">
             <input type="hidden" name="pNum" value="${dto.pNum}" />
	         <button type="submit" class="btn btn-sm btn-primary">예약하기</button>
        </form>

<!-- 관리자만 추천 버튼을 보이도록 처리 -->
	<c:if test="${sessionScope.loginUser.mRole == 'admin'}">
	    <!-- 추천 등록 버튼 -->
	    <form action="/recommend/${dto.pNum}" method="post">
	        <input type="submit" value="추천하기">
	    </form>
	
	
	<!-- 수정 버튼 -->
	<form action="/package/update/${dto.pNum}" method="get">
	    <input type="submit" value="수정">
	</form>
	
	<!-- 삭제 버튼 -->
	<form action="/package/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
	    <input type="hidden" name="pNum" value="${dto.pNum}">
	    <input type="submit" value="삭제">
	</form>
	</c:if>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
