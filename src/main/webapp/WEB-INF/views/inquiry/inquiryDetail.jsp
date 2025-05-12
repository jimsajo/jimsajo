<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>문의 상세보기</title>
</head>
<body>
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

<a href="/inquiry/inquiryList">목록으로 돌아가기</a> <!-- 목록으로 돌아가기 링크 추가 -->

</body>
</html>
