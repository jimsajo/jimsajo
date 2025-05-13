<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>패키지 결제</title>
  <!-- ✅ 아임포트 SDK 반드시 포함 -->
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
  <h2>패키지 결제</h2>

  <form name="payment-form" id="payment-form" method="post" action="paymentWrite">
    <input type="hidden" id="pNum" value="${package.pNum}" />

    <p><strong>상품명:</strong> <span id="name">${package.pName}</span></p>
    <p><strong>금액:</strong> <span id="amount">${package.pPrice}</span></p>
    <p><strong>국가:</strong> ${package.pCountry}</p>

    <input type="hidden" id="buyer_email" value="${loginUser.mId}@example.com" />
    <input type="hidden" id="buyer_name" value="${loginUser.mName}" />
    <input type="hidden" id="buyer_tel" value="${loginUser.mTel}" />
    
    <button type="button" onclick="requestPay()">결제하기</button> 
	<button type="button" onclick="location.href='paymentList'">결제내역 보기</button>

  </form>

  <script>
    function requestPay() {
      // ✅ 반드시 테스트 상점코드 사용
      IMP.init("imp60842643"); // 아임포트 테스트용 상점 코드

      // ✅ 아임포트 결제 요청
      IMP.request_pay({
        pg: "tosspay.tosstest",           // ✅ PG사 테스트 코드
        pay_method: "card",
        merchant_uid: "order_" + new Date().getTime(),  // 고유 주문번호
        name: document.getElementById("name").innerText,
        amount: parseInt(document.getElementById("amount").innerText),
        buyer_email: document.getElementById("buyer_email").value,
        buyer_name: document.getElementById("buyer_name").value,
        buyer_tel: document.getElementById("buyer_tel").value
      }, function (rsp) {
        if (rsp.success) {
          alert("결제 성공: imp_uid = " + rsp.imp_uid);
          
          // 서버에 결제 검증 요청
          fetch("/api/payment/verify", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ imp_uid: rsp.imp_uid,
                pNum: document.getElementById("pNum").value })
          }).then(res => res.text()).then(alert);
          location.href = "/paymentList"; // 결제 완료 후 내역 보기로 이동
        } else {
          alert("결제 실패: " + rsp.error_msg);
        }
      });
    }
  </script>
</body>
</html>
