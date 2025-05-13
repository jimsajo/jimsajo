<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>결제 내역</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>

  <h2>결제 내역</h2>
  <table border="1">
    <tr>
      <th>ID</th><th>상품명</th><th>금액</th><th>주문번호</th>
      <th>결제수단</th><th>결제시간</th><th>상태</th><th>취소</th>
    </tr>
    <c:forEach var="payment" items="${payments}">
      <tr>
        <td>${payment.paymentId}</td>
        <td>${payment.pName}</td>
        <td>${payment.payAmount}</td>
        <td>${payment.merchantUid}</td>
        <td>${payment.payMethod}</td>
        <td>
          <c:if test="${not empty payment.paidAt}">
            ${payment.paidAt}
          </c:if>
        </td>
        <td>${payment.payStatus}</td>
        <td>
	      <c:if test="${payment.payStatus eq 'paid'}">
	        <form action="/payment/cancel" method="post" style="display:inline;">
	          <input type="hidden" name="impUid" value="${payment.impUid}" />
	          <input type="hidden" name="amount" value="${payment.payAmount}" />
	          <button type="submit" onclick="return confirm('정말 결제를 취소하시겠습니까?');">결제 취소</button>
	        </form>
	      </c:if>
	    </td>
      </tr>
    </c:forEach>
  </table>
    <button onclick="location.href='/'">홈으로</button>
  	<button onclick="location.href='/packagelist'">패키지 보기</button>
  	<button onclick="history.back()">이전 페이지</button>
</body>
</html>
