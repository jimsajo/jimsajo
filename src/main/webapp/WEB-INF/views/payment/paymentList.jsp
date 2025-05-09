<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>결제 내역</title>
</head>
<body>
  <h2>결제 내역</h2>
  <table border="1">
    <tr>
      <th>ID</th><th>상품명</th><th>금액</th><th>주문번호</th>
      <th>결제수단</th><th>결제시간</th><th>상태</th>
    </tr>
    <c:forEach var="payment" items="${payments}">
      <tr>
        <td>${payment.paymentId}</td>
        <!-- <td>${payment.productName}</td> -->
        <td>${payment.payAmount}</td>
        <td>${payment.merchantUid}</td>
        <td>${payment.payMethod}</td>
        <td>
          <c:if test="${not empty payment.paidAt}">
            ${payment.paidAt}
          </c:if>
        </td>
        <td>${payment.payStatus}</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
