<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Parallax Scrolling Web</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <!--1. BootStrap용 CSS CDM 추가-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    
    <!--현재 페이지용 css 외부 링크-->    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/parallax.css">

    <!--사이트 탭 아이콘 변경-->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/parallax/ui.ico">


    <!--jQuery 추가-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

    <!--현재 페이지용 js 외부 링크-->
    <script src="${pageContext.request.contextPath}/resources/js/parallax/parallax.js"></script>


    <script>
        //최초
        $(document).ready(function(){
            var image = document.getElementById('hill1');
            $('.contents').css({
                'position' : 'absolute',
                'top' : image.height + 'px'
            });
        });

        //브라우저 사이즈 바뀔때마다
        $(window).resize(function(){
            var image = document.getElementById('hill1');
            console.log('${image.width} x ${image.height}');

            $('.contents').css({
                'position' : 'absolute',
                'top' : image.height + 'px'
            });
        });
    </script>

</head>
<body>

    <!--상단-->
    <header>
        <h2 class="logo">LOGO</h2>
        <nav class="navigation">
            <a href="#" class="active">Home</a>
            <a href="#">About</a>
            <a href="#">Service</a>
            <a href="#">Contact</a>
        </nav>
    </header>

    <!-- section 영역 -->
    <!-- section.parallax>h2#text + tab -->
    <section class="parallax">

        <!--뒤에서 부터 깔리는 느낌이라 맨뒤에 것부터 시작한 거임-->
        <img src="${pageContext.request.contextPath}/resources/images/parallax/hill1.png" id="hill1">   <!-- 맨뒤-->
        <img src="${pageContext.request.contextPath}/resources/images/parallax/hill2.png" id="hill2">
        <img src="${pageContext.request.contextPath}/resources/images/parallax/hill3.png" id="hill3">
        <img src="${pageContext.request.contextPath}/resources/images/parallax/hill4.png" id="hill4">
        <img src="${pageContext.request.contextPath}/resources/images/parallax/hill5.png" id="hill5">
        <img src="${pageContext.request.contextPath}/resources/images/parallax/tree.png" id="tree">
        
        <h2 id="text">Parallax WebSite</h2>
        <img src="${pageContext.request.contextPath}/resources/images/parallax/leaf.png" id="leaf">
        <img src="${pageContext.request.contextPath}/resources/images/parallax/plant.png" id="plant">  <!-- 맨앞 -->

    </section>

    <section class="contents">
        <h2>Parallax Scrolling Web</h2>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae debitis dolore nihil fugiat repudiandae ea natus eveniet nostrum! Accusantium nemo voluptate iusto ullam nam. Eligendi magni doloremque, rem exercitationem similique laboriosam voluptas eaque accusantium? Obcaecati optio rem magnam facere. Quisquam quis facilis alias minima adipisci soluta voluptate distinctio recusandae aliquam, sequi at vero suscipit quidem excepturi earum esse ad inventore officia voluptas fuga! At veritatis esse a earum autem obcaecati quos natus ratione aperiam. Illo officia blanditiis iure, voluptates laboriosam facilis, doloribus dignissimos vitae accusamus voluptatum nostrum nam dicta perferendis ullam, quibusdam consequatur quo fuga repellendus ipsam nihil reiciendis eveniet. Asperiores similique commodi quisquam vel fugiat sint labore corporis exercitationem harum. Repudiandae nisi recusandae quam culpa cupiditate? Fuga ea molestias quam quaerat, magnam nesciunt culpa, dolores debitis dicta architecto, quidem adipisci expedita ex ut deleniti nisi! Earum ea dolorem vel! Illo vel officiis corporis quo, similique porro, dolorum voluptatum suscipit reprehenderit fuga accusamus illum perspiciatis repellendus? Ea laboriosam distinctio suscipit quia quaerat modi debitis nemo, ducimus laudantium similique totam sit. Nam voluptatem magni repellendus quia! Vel nulla doloremque voluptatum dolore asperiores doloribus autem facere. Perferendis velit vitae mollitia a optio? Rerum repudiandae cum delectus? Unde atque maxime non tempore reprehenderit alias molestias vel consectetur cupiditate autem! Necessitatibus eaque quibusdam rem, consectetur nostrum porro odit quaerat cumque eos quasi excepturi asperiores animi atque. Provident, enim quasi ducimus vel totam voluptatibus reprehenderit ipsum placeat repellat ratione modi nemo, quae soluta distinctio. Sapiente optio asperiores molestiae obcaecati sint cumque molestias porro veritatis dolores deserunt temporibus, ipsum velit ex iste soluta expedita magni, necessitatibus fugiat modi nam, neque corrupti? Quod, dolorum. Ab eos harum, est tempore, reiciendis nesciunt provident, voluptate deserunt magnam quas magni accusantium quod vitae officia sunt dolores culpa temporibus veritatis eaque quasi cupiditate laboriosam maxime. Facilis nulla exercitationem praesentium blanditiis tempore.<br></br>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem, rerum delectus iusto praesentium ex eum neque et quae maiores architecto aliquam dolor tempora sit, rem facere ducimus possimus velit aperiam laborum facilis? Iste voluptate ab voluptatibus rem repudiandae nam, modi dicta adipisci. Nemo rerum doloremque voluptate, fuga harum deserunt, earum quia esse inventore beatae quo nulla maiores natus consequatur nobis laborum ea autem pariatur asperiores. Iusto voluptas, facilis quod nisi obcaecati minus, quis eius voluptate quibusdam exercitationem veritatis quas sed accusamus quia quidem cum provident, ipsam ducimus error mollitia dolores quae? Beatae aperiam nihil natus nesciunt laboriosam iste repellendus error.</p>
    </section>


    <!--하단영역-->
    <!-- <footer>
        <nav>
            <a href="#">Blog</a>
            <span> | </span>
            <a href="#">GitHub</a>
        </nav>
        <p>
            <span>author : Codehal</span> <span>|</span>
            <span>editor : Aerin Shin</span> <span>|</span>        
            <span>e-mail : arin980921@naver.com</span> <span>|</span>        
            <span>Copyright &copy; 2022. Codehal. All Rights Reserved.</span>
        </p> -->




    <!--2. BootStrap용 JS는 body태그 내 맨 아래에 위치해야 함-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>