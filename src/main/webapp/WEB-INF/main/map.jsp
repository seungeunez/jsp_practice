<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카카오맵</title>
</head>
	<body>
		<div id="map" style="width:500px; height:400px; border:1px soild #cccc"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab79bab5d5a533d01378134fafa3f774"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(35.11674582573207, 129.0895195873172), //지도의 중심위치 위도, 경도
				level: 3	//지도의 레벨
			};
	
			//실제로 맵이 생성되는 시점
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(35.11674582573207, 129.0895195873172); //위도, 경도

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
		</script>
	</body>
</html>