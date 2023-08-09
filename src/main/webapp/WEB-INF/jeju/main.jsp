<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name="author" content="TakSeungeun">
    <meta name="description" content="HTML + CSS + 자바스크립트 웹 표준의 정석(특별 부록)을 참조해서 웹사이트 만들기">
    <title>Dream Jeju</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jeju.css">
</head>
<body>
    <div id="container">
    	<!-- header영역 jsp 소환-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--이미지 슬라이드 쇼 영역-->
        <div id="slideShow">
            <div id="slides">
                <img src="${pageContext.request.contextPath}/resources/images/jeju/photo-1.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/jeju/photo-2.jpg" alt="">
                <img src="${pageContext.request.contextPath}/resources/images/jeju/photo-3.jpg" alt="">
                <button id="prev">&lang;</button>
                <button id="next">&rang;</button>
            </div>

        </div>
        <!--컨텐츠 영역-->
        <div id="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">공지사항</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">갤러리</label>

                <!--공지사항-->
                <div id="notice" class="tabContent">
                    <h2>공지사항 내용입니다.</h2>
                    <ul>
                        <li>사무실을 이전했습니다.</li>
                        <li>[참가 모집] 카약 체험에 초대합니다.</li>
                        <li>[참가 모집] 여름 방학 기간, 오름 체험단을 모집합니다.</li>
                        <li>겨울, 추천 여행지</li>
                        <li>가을, 추천 여행지</li>
                    </ul>
                </div>

                <!--갤러리-->
                <div id="gallery" class="tabContent">
                    <h2>갤러리 내용입니다.</h2>
                    <ul>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-1.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-2.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-3.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-1.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-2.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/jeju/img-3.jpg"></li>
                    </ul>
                </div>
            </div>
            
            <!--퀵 링크 영역-->
            <div id="links">
                <ul>
                    <li>
                        <a href="#">
                            <span id="quick-icon1"></span>
                            <p>평화 기행</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon2"></span>
                            <p>힐링 워크숍</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon3"></span>
                            <p>문의하기</p>
                        </a>
                    </li>
                </ul>

            </div>
        </div>
        <!--footer영역 jsp 소환-->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>


    <script src="${pageContext.request.contextPath}/resources/js/slideshow.js"></script>
</body>
</html>