<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>리뷰 작성</title>
		<script>
		  window.onload = function () {
		    document.getElementById("pCountry").addEventListener("change", loadMyPackagesByCountry);
		  };
		
		  function loadMyPackagesByCountry() {
		    const country = document.getElementById("pCountry").value;
		
		    if (!country) {
		      document.getElementById("pNum").innerHTML = "<option value=''>패키지 선택</option>";
		      return;
		    }
		
		    const xhr = new XMLHttpRequest();
		    xhr.open("GET", "/api/orderedPackagesByCountry?country=" + encodeURIComponent(country), true);
		    xhr.onreadystatechange = function () {
		      if (xhr.readyState === 4 && xhr.status === 200) {
		        const packageSelect = document.getElementById("pNum");
		        packageSelect.innerHTML = "<option value=''>패키지 선택</option>";
		        const packages = JSON.parse(xhr.responseText);
		        packages.forEach(pkg => {
		          const option = document.createElement("option");
		          option.value = pkg.pNum;
		          option.text = pkg.pName + " (" + pkg.pCountry + ")";
		          packageSelect.appendChild(option);
		        });
		      }
		    };
		    xhr.send();
		  }
		</script>

  </head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

  <h2>리뷰 작성</h2>
  <form name="reviewForm" method="post" action="${pageContext.request.contextPath}/review/reviewSave" enctype="multipart/form-data">
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
      <select id="pCountry" name="pCountry" onchange="loadMyPackagesByCountry()" required>
        <option value="">선택하세요</option>
        <option value="Vietnam">베트남</option>
        <option value="Thailand">태국</option>
        <option value="Malaysia">말레이시아</option>
        <option value="Indonesia">인도네시아</option>
        <option value="Philippines">필리핀</option>
      </select>
    </p>
    
    <p>
	  패키지 선택:
	  <select id="pNum" name="pNum" required>
	    <option value="">패키지 선택</option>
	  </select>
	</p>

    <p>
      리뷰 이미지:
      <input type="file" name="file" accept="image/*">
    </p>
    <p><input type="submit" value="리뷰 등록하기"></p>
    <a href="${pageContext.request.contextPath}/review/reviewList">리뷰 목록으로 가기</a>
  </form>
</body>
</html>