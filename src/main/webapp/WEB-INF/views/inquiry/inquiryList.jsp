<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>문의 목록</title>
</head>
<body>
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
</body>
</html>
