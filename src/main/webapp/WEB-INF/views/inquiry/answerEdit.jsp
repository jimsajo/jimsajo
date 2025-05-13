<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 수정</title>
</head>
<body>
	<h2>답변 수정</h2>
		<form action="/answer/update" method="post">
		    <input type="hidden" name="aNum" value="${answer.aNum}" />
		    <input type="hidden" name="iNum" value="${answer.iNum}" />
		    
		    <label>답변 내용</label><br/>
		    <textarea name="aContent" rows="6" cols="60" required>${answer.aContent}</textarea><br/><br/>
		
		    <button type="submit">수정 완료</button>
		    <a href="/inquiry/detail?iNum=${answer.iNum}">취소</a>
		</form>
</body>
</html>