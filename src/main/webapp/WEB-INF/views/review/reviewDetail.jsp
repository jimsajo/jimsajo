<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

	<h2>리뷰 상세보기</h2>
	<hr>
	<table>
		<tr>
			<td>제목</td>
			<td>${review.rTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${review.mId}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${review.rReview}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${review.rDate}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${review.rCnt}</td>
		</tr>
		<tr>
			<td>국가</td>
			<td>${review.pCountry}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<c:if test="${not empty review.rImage}">
          			<img src="/images/${review.rImage}" style="max-width:300px;">
        		</c:if>
			</td>
		</tr>
		<tr>
        <td>좋아요</td>
        <td>
            <form action="/toggleGood" method="post" style="display:inline;">
                <input type="hidden" name="rNum" value="${review.rNum}">
                <button type="submit" style="border:none; background:none; font-size:20px; cursor:pointer;">
                    <c:choose>
                        <c:when test="${goodByUser}">♥</c:when>
                        <c:otherwise>♡</c:otherwise>
                    </c:choose>
                    좋아요 (${goodCnt})
                </button>
            </form>
        </td>
    </tr>
		
	</table>
	<a href="/updateReview/${review.rNum}">[수정]</a>
  	<a href="/deleteReview/${review.rNum}" onclick="return confirm('삭제하시겠습니까?');">[삭제]</a>
  	<a href="/reviewList">[목록으로]</a>
  	
  	<h3>댓글</h3>
  	<hr>
  	<!-- 댓글/대댓글 출력 -->
	<c:forEach var="comment" items="${comments}">
	    <c:set var="commentItem" value="${comment}" />
	    <jsp:include page="commentItem.jsp" />
  	</c:forEach>

	<!-- 최상위 댓글 작성 -->
	<form action="/commentAdd" method="post" style="margin-top: 20px;">
	    <input type="hidden" name="rNum" value="${review.rNum}">
	    <input type="hidden" name="parentCNum" value="0">
	    <textarea name="cContent" rows="3" cols="50" required placeholder="comment Write here!"></textarea><br/>
	    <button type="submit">댓글 등록</button>
	</form>
  	
</body>
</html>