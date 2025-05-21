<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>패키지 결제</title>
<!-- ✅ 아임포트 SDK 반드시 포함 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
	
<!-- Main CSS File -->
<link href="/assets/css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../section/header.jsp"%>

<br>
	<div class="text-center pt-5 mt-5">
	  <h2 class="fw-bold display-5 text-primary">패키지 결제</h2>
	</div>


	<div class="container d-flex justify-content-center">
		<form name="payment-form" id="payment-form" method="post"
			class="card p-4 shadow w-100 d-block mx-auto" style="max-width: 500px;">

			<!-- 숨겨진 필드 -->
			<input type="hidden" id="pNum" value="${packageDto.pNum}" /> <input
				type="hidden" id="oNum" value="${orderDto.oNum}" /> <input
				type="hidden" id="buyer_name" value="${loginUser.mName}" /> <input
				type="hidden" id="buyer_tel" value="${loginUser.mTel}" />

			<div class="card shadow-sm border-0">
				<div class="card-body">

					<div class="mb-4 text-center">
						<h5 class="card-title">결제 정보</h5>
						<p class="text-muted small">아래 정보를 확인 후 결제를 진행해 주세요.</p>
					</div>

					<ul class="list-group list-group-flush mb-4">
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">상품명</span> <span id="name">${packageDto.pName}</span>
						</li>
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">금액</span> <span><span id="amount">${orderDto.oPrice}</span>
								원</span></li>
						<li class="list-group-item d-flex justify-content-between"><span
							class="fw-bold">국가</span> <span>${packageDto.pCountry}</span></li>
					</ul>

					<div class="d-grid gap-2">
						<button type="button" class="btn btn-primary"
							onclick="requestPay()">💳 결제하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/payment/paymentList'">📄 결제내역
							보기</button>
					</div>

				</div>
			</div>

		</form>
	</div>

	<script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>
  <%@ include file="../section/footer.jsp"%>
</body>
</html>
