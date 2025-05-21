<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>문의 목록</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/instaReview.css" rel="stylesheet">

  <link href="/assets/css/main.css" rel="stylesheet">

  <c:set var="currentCountry" value="${param.pCountry}" />
</head>
<body>
<%@ include file="../section/header.jsp"%>

<br><br><br><br>
<div class="container" style="margin-top: 120px; margin-bottom:120px;">
    <div class="card shadow">
      <div class="card-header bg-dark text-white text-center fs-5 fw-bold">
        문의목록
      </div>
      <div class="card-body p-0">
        <table class="table table-bordered text-center mb-0">
          <thead class="table-light">
            <tr>
              <th>문의종류</th>
              <th>제목</th>
              <th>작성시간</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${list}">
              <tr>
                <th class="text-center" >
                  <a href="/inquiry/detail?iNum=${dto.iNum}" class="text-decoration-none text-dark">
                    ${dto.iTitle}
                  </a>
                </th>
                <td>${dto.iType}</td>
                <td>${dto.iTime}</td>
                
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
<%@ include file="../section/footer.jsp"%>
</body>
</html>
