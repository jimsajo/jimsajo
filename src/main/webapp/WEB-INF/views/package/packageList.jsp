<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 리스트</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<h3>국가별 보기</h3>
<ul>
    <li><a href="/packagelist/country?pCountry=Vietnam">베트남</a></li>
    <li><a href="/packagelist/country?pCountry=Philippines">필리핀</a></li>
    <li><a href="/packagelist/country?pCountry=Thailand">태국</a></li>
    <li><a href="/packagelist/country?pCountry=Malaysia">말레이시아</a></li>
    <li><a href="/packagelist/country?pCountry=Indonesia">인도네시아</a></li>
</ul>
<h1>패키지 상품 리스트</h1>

<c:forEach var="dto" items="${packageList}">
    <p>
        <a href="/package/detail/${dto.pNum}">제목: ${dto.pName}</a>
    </p>
    <p>국가: ${dto.pCountry}</p>
    <p>작성일: ${dto.pCreate}</p>
    
    <!-- 썸네일 이미지 표시 -->
  <c:if test="${not empty dto.pImage}">
    <img src="${pageContext.request.contextPath}/uploads/images/${dto.pImage}" alt="썸네일" style="width: 100px; height: 100px;">

</c:if>

    <p>
        <hr>
    </p>
</c:forEach>

</body>
</html>
