<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패키지 상세보기</title>
</head>
<body>
<a href="/"><img src="/images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<h1>패키지 상세정보</h1>
<p>제목: ${dto.pName}</p>
<p>국가: ${dto.pCountry}</p>
<p>작성일: ${dto.pCreate}</p>
<p>내용:</p>
<div>${dto.pDescription}</div>

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
<br>
<a href="/packagelist">← 목록으로 돌아가기</a>

</body>
</html>
