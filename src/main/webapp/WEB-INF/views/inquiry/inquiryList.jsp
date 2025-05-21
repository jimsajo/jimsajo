<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<<<<<<< HEAD
<html>
<head>
    <title>문의 목록</title>
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
  <link href="../css/instaReview.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">
</head>
<body class="index-page">
<%@ include file="../section/header.jsp" %>
 	<div class="container mt-5 pt-5">
<h2>문의 목록</h2>
<table border="1" width="700">
    <thead>
        <tr>
            <th>제목</th>
            <th>타입</th>
            <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${dto.iTitle}</td>
                <td>${dto.iType}</td>
                 <td><a href="/inquiry/detail?iNum=${dto.iNum}">상세보기</a></td> <!-- 상세보기 링크 추가 -->
            </tr>
        </c:forEach>
    </tbody>
</table>
<%@ include file="../section/footer.jsp" %>
</body>
</html>
