<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jimsajo.Dto.CommentDto" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 들여쓰기</title>
</head>
<body>
<%
    int depth = Integer.parseInt(request.getParameter("depth")); //댓글 들여쓰기
    CommentDto comment = (CommentDto) request.getAttribute("comment");
    boolean isParent = (comment.getParentCNum() == 0);
%>

<div style="margin-left: <%= depth * 30 %>px; border-left: 1px solid #ccc; padding-left: 10px; margin-top: 10px;">
    <p><b><%= comment.getMId() %>:</b> <%= comment.getCContent() %> (<%= comment.getCCreate() %>)</p>

    <!-- 수정 폼 -->
    <form action="/commentUpdate" method="post">
        <input type="hidden" name="cNum" value="<%= comment.getCNum() %>">
        <input type="hidden" name="rNum" value="<%= comment.getRNum() %>">
        <textarea name="cContent" rows="2" required><%= comment.getCContent() %></textarea>
        <button type="submit">수정</button>
    </form>

    <!-- 삭제 -->
    <a href="/commentDelete/<%= comment.getCNum() %>/<%= comment.getRNum() %>/<%= isParent %>"
       onclick="return confirm('<%= isParent ? "댓글과 대댓글을 모두 삭제하시겠습니까?" : "이 대댓글을 삭제하시겠습니까?" %>');">
       삭제
    </a>

    <!-- 대댓글 작성 -->
    <form action="/commentAdd" method="post" style="margin-top: 5px;">
        <input type="hidden" name="rNum" value="<%= comment.getRNum() %>">
        <input type="hidden" name="parentCNum" value="<%= comment.getCNum() %>">
        <input type="text" name="cContent" placeholder="답글 입력" required>
        <button type="submit">답글</button>
    </form>
</div>

<!-- 대댓글 들여쓰기 출력 -->
<c:forEach var="child" items="${comment.replies}">
    <jsp:include page="commentItem.jsp">
        <jsp:param name="depth" value="${depth + 1}" />
        <jsp:param name="comment" value="${child}" />
    </jsp:include>
</c:forEach>
</body>
</html>