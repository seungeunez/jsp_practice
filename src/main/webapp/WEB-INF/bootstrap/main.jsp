<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="light">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>부트스트랩 앨범페이지 (클로닝)</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!--1. BootStrap용 CSS CDM 추가-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">

<!--3. BootStrap Icon용 CDN-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="icon"
	href="https://getbootstrap.com//docs/5.3/assets/img/favicons/favicon.ico">
<!--사이트 탭 아이콘 변경-->

<!--jQuery 추가-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<!--lightBox가 slim에서는 적용이 안됨-->

<script>
	$(document).ready(function() {
		$('btnLight').addClass('active');

		$('img').css("border-radius", "5px 5px 0 0"); //모든 이미지에 위쪽 테두리 둥근 모서리

		//테마변경
		$('#btnLight').click(function() {
			$('html').attr('data-bs-theme', 'light');
			$(this).addClass('active');
			$('#btnDark').removeClass('active');
		});
		$('#btnDark').click(function() {
			$('html').attr('data-bs-theme', 'dark');
			$(this).addClass('active');
			$('#btnLight').removeClass('active');
		});
	});
</script>
</head>

<body>

	<!--맨 바닥에 테마 Light / Dark 변경 버튼 영역-->
	<div
		class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle"
		style="z-index: 100;">
		<!--"z-index: 100;" 맨 위로 뜨게-->
		<button
			class="btn btn-primary py-2 dropdown-toggle d-flex align-items-center"
			data-bs-toggle="dropdown" id="bd-theme" type="button">
			<!-- data-bs-toggle="dropdown"  넣으니깐 클릭했을 때 Dark Light 뜸-->
			<i class="bi bi-brightness-high-fill"></i>
		</button>
		<ul class="dropdown-menu">
			<li>
				<button id="btnLight" type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="light" aria-pressed="true">
					<i class="bi bi-brightness-high-fill"></i>&nbsp; Light
					<!--&nbsp; 공백주는거임-->
				</button>
			</li>
			<li>
				<button id="btnDark" type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="dark" aria-pressed="false">
					<i class="bi bi-moon-stars-fill"></i>&nbsp; Dark
					<!--&nbsp; 공백주는거임-->
				</button>
			</li>
		</ul>
	</div>

	<!--top 메뉴영역-->
	<header data-bs-theme="dark">
		<div class="collapse text-bg-dark" id="navbarHeader">
			<!--collapse 접히는거-->
			<div class="container">
				<div class="row">
					<div class="col-sm-8 py-3">
						<h4>About</h4>
						<p class="text-body-secondary">Lorem ipsum dolor sit amet
							consectetur adipisicing elit. Totam consectetur quis, dolore
							assumenda laudantium minus esse dolorum sunt deserunt alias illo
							blanditiis, quia accusamus expedita eaque repellendus quos
							exercitationem nesciunt!</p>
					</div>
					<div class="col-sm-4 py-3">
						<h4>Contact</h4>
						<ul class="list-unstyled">
							<!--list-unstyled 리스트 앞 점을 없애줌-->
							<li><a href="#" class="text-white">Twitter</a></li>
							<li><a href="#" class="text-white">Facebook</a></li>
							<li><a href="#" class="text-white">Email me</a></li>
						</ul>
						<p></p>
					</div>
				</div>
			</div>
		</div>

		<!--상단 바 & 버튼-->
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="#" class="navbar-brand d-flex align-items-center"> <i
					class="bi bi-camera"></i>&nbsp; <!--&nbsp; 공백주는거임--> <strong>Album</strong>
				</a>
				<!--#은 자기 페이지로 넘어가는 것-->
				<button type="button" class="navbar-toggler collapsed"
					data-bs-toggle="collapse" data-bs-target="#navbarHeader"
					aria-controls="navbarHeader" aria-expanded="true"
					aria-label="Toggle navigation">
					<!--class앞에 type 넣어야함-->
					<!--navbarHeader를 넣는이유는 collapse로 숨겨진 부분을 드러냈을 때 나오는 부분임-->
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>

	<!--main 영역-->
	<main>
		<section class="py-5 text-center container">
			<div class="row py-5">
				<!--row쓰면 무조건 column 필요함-->
				<div class="col-6 mx-auto">
					<!--x-auto 중앙에 위치, 왼쪽 오른쪽 3개는 버린다는거-->
					<h1 class="fw-light">Album example</h1>
					<p class="lead text-body-secondary">Something short and leading
						about the collection below—its contents, the creator, etc. Make it
						short and sweet, but not too short so folks don’t simply skip over
						it entirely.</p>
					<p>
						<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
							href="#" class="btn btn-secondary my-2">Secondary action</a>
					</p>
				</div>
			</div>
		</section>
		<div class="album py-5 bg-body-tertiary">
			<div class="container">
				<div class="row row-cols-3 g-3">

					<!--col 9개로 구성할 것-->
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<img src="https://via.placeholder.com/400x225" width="100%"
								height="225" focusable="false">
							<div class="card-body">
								<p class="card-text">Lorem ipsum dolor sit amet consectetur,
									adipisicing elit. Voluptas ipsam placeat et cumque cum
									repellendus, eveniet sapiente aliquid.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-primary">View</button>
										<button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
									</div>
									<small class="text-body-secondary">10 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!--footer 영역-->
	<footer class="text-body-secondary py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to Top</a>
			</p>
			<p class="mb-1">Album site &copy; Bootstrap.</p>
			<p class="mb-0">
				<a href="https://getbootstrap.com" target="_blank">Visit the
					hompage</a>
			</p>
		</div>
	</footer>


	<!--2. BootStrap용 JS는 body태그 내 맨 아래에 위치해야 함-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>