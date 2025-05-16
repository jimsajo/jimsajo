<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>주문 예약 리스트</title>
</head>
<body>
    <h2>전체 예약 내역</h2>

    <c:choose>
        <c:when test="${empty orderList}">
            <script>
                alert("예약 내역이 없습니다.");
                window.location.href = "/packagelist";
            </script>
        </c:when>
        <c:otherwise>
            <table border="1">
                <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>주문일</th>
                        <th>출발일</th>
                        <th>도착일</th>
                        <th>인원</th>
                        <th>금액</th>
                        <th>회원번호</th>
                        <th>패키지번호</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.oNum}</td>
                            <td>${order.oDate}</td>
                            <td>${order.oStart}</td>
                            <td>${order.oReturn}</td>
                            <td>${order.oPeople}</td>
                            <td>${order.oPrice} 원</td>
                            <td>${order.mNum}</td>
                            <td>${order.pNum}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <br>
    <input type="button" value="Home" onclick="location.href='/'">
    <input type="button" value="리뷰작성하기" onclick="location.href='/review'">
</body>
</html>
