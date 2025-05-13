<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
</head>
<body>
  <h2>회원정보 수정</h2>
  
  <form method="post" action="/memberUpdateProcess">
  <input type="hidden" name="mNum" value="${member.mNum}">
    <table>
      <tr>
        <td>아이디</td>
        <td><input type="text" name="mId" value="${member.mId}" readonly></td>
      </tr>
      <tr>
        <td>새 비밀번호</td>
        <td><input type="password" name="mPasswd" placeholder="새 비밀번호 입력" required></td>
      </tr>
      <tr>
        <td>연락처</td>
        <td><input type="text" name="mTel" value="${member.mTel}" required></td>
      </tr>
    </table>
    
    <button type="submit">수정 완료</button>
  </form>
</body>
</html>
