<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jimsajo.Dto.CommentDto" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 댓글</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

<div style="margin-left: ${commentItem.depth * 30}px; border-left: 1px solid #ccc; padding: 10px; margin-top: 10px;">

    <p>
        <strong>${commentItem.mId}</strong>
        <span style="font-size: small;">(${commentItem.cCreate})</span>
    </p>

    <p>${commentItem.cContent}</p>

    <!-- 본인 댓글이면 수정/삭제 가능 -->
    <c:if test="${loginUser != null && loginUser.mNum == commentItem.mNum}">
        <form action="/commentUpdate" method="post" style="margin-bottom: 5px;">
            <input type="hidden" name="cNum" value="${commentItem.cNum}" />
            <input type="hidden" name="rNum" value="${commentItem.rNum}" />
            <textarea name="cContent" rows="2" cols="50" required>${commentItem.cContent}</textarea><br/>
            <button type="submit">수정</button>
        </form>

        <a href="/commentDelete/${commentItem.cNum}/${commentItem.rNum}/${commentItem.parentCNum == 0}"
           onclick="return confirm('${commentItem.parentCNum == 0 ? "댓글과 대댓글을 모두 삭제하시겠습니까?" : "대댓글을 삭제하시겠습니까?"}');">
            삭제
        </a>
    </c:if>

    <!-- 대댓글 작성 폼 -->
    <c:if test="${loginUser != null}">
        <form action="/commentAdd" method="post" style="margin-top: 10px;">
            <input type="hidden" name="rNum" value="${commentItem.rNum}" />
            <input type="hidden" name="parentCNum" value="${commentItem.cNum}" />
            <input type="text" name="cContent" placeholder="답글을 입력하세요" required />
            <button type="submit">답글</button>
        </form>
    </c:if>
</div>
</body>
</html>