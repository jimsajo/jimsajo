<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jimsajo.Dto.CommentDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          			<img src="/assets/img/package/${review.rImage}" style="max-width:300px;">
        		</c:if>
			</td>
		</tr>
		<tr>
        <td>좋아요</td>
        <td>
            <form action="${pageContext.request.contextPath}/review/toggleGood" method="post" style="display:inline;">
                <input type="hidden" name="rNum" value="${review.rNum}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
	<a href="${pageContext.request.contextPath}/review/updateReview/${review.rNum}">[수정]</a>
  	<a href="${pageContext.request.contextPath}/review/deleteReview/${review.rNum}" onclick="return confirm('삭제하시겠습니까?');">[삭제]</a>
  	<a href="${pageContext.request.contextPath}/review/reviewList">[목록으로]</a>
  	<hr>
  	<h3>댓글</h3>
		<!-- 댓글 및 대댓글 출력 -->
		<c:forEach var="comment" items="${comments}">
		    <div style="margin-left: ${comment.depth * 30}px; border-left: 1px solid #ccc; padding: 10px; margin-top: 10px;">
		        <strong>${comment.mId}</strong>
		        <span style="font-size: small;">(${comment.cCreate})</span>
		        <p>${comment.cContent}</p>
		
		        <c:if test="${loginUser != null && loginUser.mNum == comment.mNum}">
		            <form action="${pageContext.request.contextPath}/review/commentUpdate"
		                  method="post" style="margin-bottom:5px;">
		                <input type="hidden" name="rNum" value="${comment.rNum}" />
		                <input type="hidden" name="cNum" value="${comment.cNum}" />
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                <textarea name="cContent" rows="2" cols="50" required>${comment.cContent}</textarea><br/>
		                <button type="submit">수정</button>
		            </form>
		            <a href="${pageContext.request.contextPath}/review/commentDelete/${comment.cNum}/${comment.rNum}/${comment.parentCNum == 0}"
		               onclick="return confirm('${comment.parentCNum == 0 ? "댓글과 대댓글을 모두 삭제하시겠습니까?" : "대댓글을 삭제하시겠습니까?"}');">
		                삭제
		            </a>
		        </c:if>
		
		        <c:if test="${loginUser != null}">
		            <form action="${pageContext.request.contextPath}/review/commentAdd"
		                  method="post" style="margin-top:10px;">
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                <input type="hidden" name="rNum" value="${comment.rNum}"/>
		                <input type="hidden" name="parentCNum" value="${comment.parentCNum}" />
		                <input type="text" name="cContent" placeholder="답글을 입력하세요" required/>
		                <button type="submit">답글</button>
		            </form>
		        </c:if>
		    </div>
		</c:forEach>
		
		<!-- 최상위 댓글 작성 -->
		<form action="${pageContext.request.contextPath}/review/commentAdd" method="post" style="margin-top:20px;">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		    <input type="hidden" name="rNum" value="${review.rNum}" />
		    <input type="hidden" name="parentCNum" value="0" />
		    <textarea name="cContent" rows="3" cols="50" required placeholder="댓글을 입력하세요…"></textarea><br/>
		    <button type="submit">댓글 등록</button>
		</form>

  	
</body>
</html>