function requestPay() {
      // ✅ 반드시 테스트 상점코드 사용
      IMP.init("imp44303157"); // 아임포트 테스트용 상점 코드

      // ✅ 아임포트 결제 요청
      IMP.request_pay({
        pg: "kakaopay",           // ✅ PG사 테스트 코드
        pay_method: "card",
        merchant_uid: "order_" + new Date().getTime(),  // 고유 주문번호
        name: document.getElementById("name").innerText,
        amount: parseInt(document.getElementById("amount").innerText),
        buyer_name: document.getElementById("buyer_name").value,
        buyer_tel: document.getElementById("buyer_tel").value
      }, function (rsp) {
        if (rsp.success) {
          alert("결제 성공");
          
          // 서버에 결제 검증 요청
          fetch("/api/payment/verify", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ imp_uid: rsp.imp_uid,
                pNum: document.getElementById("pNum").value,
                oNum: document.getElementById("oNum").value})
          }).then(res => res.text()).then(alert);
          location.href = "/payment/paymentList"; // 결제 완료 후 내역 보기로 이동
        } else {
          alert("결제 실패: " + rsp.error_msg);
        }
      });
    }