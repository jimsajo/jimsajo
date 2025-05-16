<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 예약 주문</title>
<script>
  // 인원 수 입력 시 총 금액 자동 계산
  function calculateTotal() {
    const pricePerPerson = parseInt(document.getElementById("price").value);
    const people = parseInt(document.getElementById("people").value);
    const total = isNaN(pricePerPerson * people) ? 0 : pricePerPerson * people;
    document.getElementById("oPrice").value = total;
    document.getElementById("totalPriceDisplay").innerText = total.toLocaleString() + " 원";
  }
</script>
</head>
<body>
  <h2>패키지 예약</h2>

  <form method="post" action="/orders/submit">
    <!-- 패키지 번호 전달 -->
    <input type="hidden" name="pNum" value="${packageDto.pNum}" />
    <!-- 기본 가격 보존용 hidden -->
    <input type="hidden" id="price" value="${packageDto.pPrice}" />

    <p>상품명: ${packageDto.pName}</p>
    <p>1인당 가격: <strong>${packageDto.pPrice} 원</strong></p>

    <label>출발일: <input type="date" name="oStart" required /></label><br/>
    <label>도착일: <input type="date" name="oReturn" required /></label><br/>
    <label>인원수: <input type="number" name="oPeople" value="1" id="people" min="1" required onchange="calculateTotal()" /></label><br/>

    <p>총 결제 금액: <strong id="totalPriceDisplay">0 원</strong></p>
    <!-- 서버로 보낼 총 금액 -->
    <input type="hidden" id="oPrice" name="oPrice" value="0" />
	<input type="submit" value="결제 페이지로 이동">
    <input type="button" onclick="location.href='/packagelist'" value="더 많은 패키지 둘러보기">
  </form>
</body>
</html>
