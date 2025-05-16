<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
</head>
<body>
<a href="/"><img src="images/jimsajo_logo2.png" alt="짐싸조 로고" style="height:150px; width:auto;"></a>


	<div class="alert alert-danger d-flex align-items-center" role="alert">
	<svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
	<div>
	  <h3>${message}</h3>
	  <hr>
	  <a href="/reviewList" class="alert-link">[돌아가기]</a>
	</div>
	</div>
	
  <p><a href="/reviewList">[돌아가기]</a></p>
</body>
</html>