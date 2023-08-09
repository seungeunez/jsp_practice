<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>프레임 애니메이션</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script>
        window.onload = function() {
            var count = 0;
            var running = document.getElementById('running');
            var frames= [
                '${pageContext.request.contextPath}/resources/images/ani/0.png', 
                '${pageContext.request.contextPath}/resources/images/ani/1.png', 
                '${pageContext.request.contextPath}/resources/images/ani/2.png', 
                '${pageContext.request.contextPath}/resources/images/ani/3.png',
                '${pageContext.request.contextPath}/resources/images/ani/4.png',
                '${pageContext.request.contextPath}/resources/images/ani/5.png',
                '${pageContext.request.contextPath}/resources/images/ani/6.png',
                '${pageContext.request.contextPath}/resources/images/ani/7.png',
                '${pageContext.request.contextPath}/resources/images/ani/8.png',
                '${pageContext.request.contextPath}/resources/images/ani/9.png',
                '${pageContext.request.contextPath}/resources/images/ani/10.png',
                '${pageContext.request.contextPath}/resources/images/ani/11.png',
                '${pageContext.request.contextPath}/resources/images/ani/12.png',
                '${pageContext.request.contextPath}/resources/images/ani/13.png',
                '${pageContext.request.contextPath}/resources/images/ani/14.png'
            ];

            setInterval(() => { //타이머 // () => { (익명 람다함수)와 function() { (익명함수)은 같다 둘 중 하나 암꺼나 쓰면 됨
                running.src = frames[ count % frames.length ] // 0 부터 14인덱스까지 무한반복  // 15 / 15 = 0  29/15 = 14 30/15 = 0 
                count += 1;
            }, 10); //50ms에 한 번씩 이미지 체인지
        };
    </script>
</head>
<body>
	<img id="running">
</body>
</html>