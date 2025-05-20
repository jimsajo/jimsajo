// 인원 수 입력 시 총 금액 자동 계산
  function calculateTotal() {
    const pricePerPerson = parseInt(document.getElementById("price").value);
    const people = parseInt(document.getElementById("people").value);
    const total = isNaN(pricePerPerson * people) ? 0 : pricePerPerson * people;
    document.getElementById("oPrice").value = total;
    document.getElementById("totalPriceDisplay").innerText = total.toLocaleString() + " 원";
  }