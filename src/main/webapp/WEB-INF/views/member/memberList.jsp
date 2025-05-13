<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "C" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_admin')">
	<table border = "1">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>생년월일</td>
			<td>가입시간</td>
			<td>역할</td>
		</tr>
		
		<c:forEach var="member" items="${members}">
	    <tr>
	      <td>${member.mNum}</td>
	      <td>${member.mId}</td>
	      <td>${member.mPasswd}</td>
	      <td>${member.mName}</td>
	      <td>${member.mGender}</td>
	      <td>${member.mTel}</td>
	      <td>${member.mBirth}</td>
	      <td>${member.mCreateTime}</td>
	      <td>${member.mRole}</td>
	    </tr>
  		</c:forEach>
	</table>
	</sec:authorize>
</body>
</html>