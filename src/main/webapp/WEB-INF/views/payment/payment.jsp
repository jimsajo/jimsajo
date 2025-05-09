<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>토스페이 테스트 결제</title>
  <!-- ✅ 아임포트 SDK 반드시 포함 -->
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
  <h2>결제 테스트 페이지</h2>

  <form name="payment-form" id="payment-form" method="post" action="paymentWrite">
    <label>상품명: <input type="text" id="name" value="테스트 상품" /></label><br/>
    <label>금액: <input type="number" id="amount" value="1" /></label><br/>
    <label>이메일: <input type="email" id="buyer_email" value="test@example.com" /></label><br/>
    <label>이름: <input type="text" id="buyer_name" value="김율무" /></label><br/>
    <label>전화번호: <input type="text" id="buyer_tel" value="010-1234-5678" /></label><br/>
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
        name: document.getElementById("name").value,
        amount: parseInt(document.getElementById("amount").value),
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
            body: JSON.stringify({ imp_uid: rsp.imp_uid })
          }).then(res => res.text()).then(alert);
        } else {
          alert("결제 실패: " + rsp.error_msg);
        }
      });
    }
  </script>
</body>
</html>
