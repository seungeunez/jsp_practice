<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>401 에러</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <!-- 1. Bootstrap용 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">

    <!-- font Awesome 아이콘 CSS CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--현재 페이지용 CSS 외부 링크-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>

<body>
    <div id="layoutError">
        <div id="layoutError_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mt-4">
                                <h1 class="display-1">401</h1>
                                <p class="lead">리소스에 대한 액세스가 허용되지 않습니다</p>
                                <a href="index.html">
                                    <i class="fas fa-arrow-left me-1"></i>
                                    메인화면으로
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutError_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid py-4">
                    <div class="d-flex justify-content-between align-items-center small">
                        <div class="text-muted me-2">Copyright &copy; PKNU 2023.</div>
                        <div>
                            <a href="#"> Privacy Policy </a> &middot; <a href="#"> Terms &amp; Conditions </a>
                            <!--&middot; 점이고 &amp; & 임-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>
</html>