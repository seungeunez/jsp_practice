<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>404 에러</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- 1. Bootstrap용 CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">

<!-- font Awesome 아이콘 CSS CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!--현재 페이지용 CSS 외부 링크-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>

<body>
	<div id="layoutError">
		<div id="layoutError_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="text-center mt-4">
								<img
									src="${pageContext.request.contextPath}/resources/images/admin/error-404-monochrome.svg"
									width="400">
								<p class="lead">페이지를 찾을 수 없습니다</p>
								<a href="index.html"> <i class="fas fa-arrow-left me-1"></i>
									메인화면으로
								</a>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutError_footer">
			<!-- 하단 영역 -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>