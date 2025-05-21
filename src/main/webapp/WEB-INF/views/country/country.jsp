<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${pCountry} 패키지 리스트</title>
</head>
<body>

 <jsp:include page="../section/header.jsp"/>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

    <h1>${pCountry} 패키지 상품 리스트</h1>
    <c:forEach var="dto" items="${packageList}">
        <p><a href="/package/detail?pNum=${dto.pNum}">제목: ${dto.pName}</a></p>
        <p>작성일: ${dto.pCreate}</p>
        <p>내용:</p>
        <div>${dto.pDescription}</div>
        <hr> 
    </c:forEach>
    <a href="/packagelist">← 목록으로 돌아가기</a>
<jsp:include page="../section/footer.jsp"/>
</body>
</html>
