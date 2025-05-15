<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>
</head>
<body>
  <h2>리뷰 수정</h2>
  <form method="post" action="${pageContext.request.contextPath}/review/updateReview" enctype="multipart/form-data">
    <input type="hidden" name="rNum" value="${upReview.rNum}">
    <input type="hidden" name="mNum" value="${sessionScope.loginUser.mNum}">

    <table>
      <tr>
        <td>제목</td>
        <td><input type="text" name="rTitle" value="${upReview.rTitle}" required></td>
      </tr>
      <tr>
        <td>내용</td>
        <td><textarea name="rReview" rows="5">${upReview.rReview}</textarea></td>
      </tr>
      <tr>
        <td>기존 이미지</td>
        <td>
          <c:if test="${not empty upReview.rImage}">
            <img src="/images/${upReview.rImage}" style="max-width:200px;">
          </c:if>
        </td>
      </tr>
      <tr>
        <td>새 이미지</td>
        <td><input type="file" name="rfile" accept="image/*"></td>
      </tr>
      <tr>
        <td>국가</td>
        <td>
          <select name="pCountry" id="pCountry" required>
            <option value="베트남" <c:if test="${upReview.pCountry == '베트남'}">selected</c:if>>베트남</option>
            <option value="태국" <c:if test="${upReview.pCountry == '태국'}">selected</c:if>>태국</option>
            <option value="말레이시아" <c:if test="${upReview.pCountry == '말레이시아'}">selected</c:if>>말레이시아</option>
            <option value="인도네시아" <c:if test="${upReview.pCountry == '인도네시아'}">selected</c:if>>인도네시아</option>
            <option value="필리핀" <c:if test="${upReview.pCountry == '필리핀'}">selected</c:if>>필리핀</option>
          </select>
        </td>
      </tr>
    </table>

    <br/>
    <button type="submit">수정 완료</button>
    <a href="${pageContext.request.contextPath}/review/reviewList">목록으로</a>
  </form>
</body>
</html>
