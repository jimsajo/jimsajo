<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패키지 상세보기</title>
</head>
<body>
    <h1>패키지 상세정보</h1>
    <p>제목: ${dto.pName}</p>
    <p>국가: ${dto.pCountry}</p>
    <p>작성일: ${dto.pCreate}</p>
    <p>내용:</p>
    <div>${dto.pDescription}</div>
    
    <form action="/package/edit" method="get">
        <input type="hidden" name="pNum" value="${dto.pNum}">
        <input type="submit" value="수정">
    </form>

    <form action="/package/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
        <input type="hidden" name="pNum" value="${dto.pNum}">
        <input type="submit" value="삭제">
    </form>

    <br>
    <a href="/packagelist">← 목록으로 돌아가기</a>
</body>
</html>
