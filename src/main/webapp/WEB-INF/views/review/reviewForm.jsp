<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>리뷰 작성</title></head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

  <h2>리뷰 작성</h2>
  <form name="reviewForm" method="post" action="/reviewSave" enctype="multipart/form-data">
    <p>
      작성자 ID:

      <input type="text" name="mId" value="${sessionScope.loginUser.mId}" readonly>
      
    </p>

    <p>
      제목:
      <input type="text" name="rTitle" required>
    </p>

    <p>
      내용:
      <textarea rows="5" cols="50" name="rReview" required></textarea>
    </p>

    <p>
      여행한 나라:
      <select name="pCountry" id="pCountry" required>
        <option value="">선택하기</option>
        <option value="Vietnam">베트남</option>
        <option value="Thailand">태국</option>
        <option value="Malaysia">말레이시아</option>
        <option value="Indonesia">인도네시아</option>
        <option value="Philippines">필리핀</option>
      </select>
    </p>

    <p>
      리뷰 이미지:
      <input type="file" name="file" accept="image/*">
    </p>
    <input type="hidden" name="pNum" value="1"> <!-- 예: 여행지 ID -->
    <p><input type="submit" value="리뷰 등록하기"></p>
    <a href="/reviewList">리뷰 목록으로 가기</a>
  </form>
</body>
</html>