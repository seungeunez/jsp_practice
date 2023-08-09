<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>

	<div class="container pt-5 mt-5"
		style="width: 800px; margin: 0 auto; padding: 30px; border: 1px solid #efefef;">



		<header>
			<h1>게시판 목록</h1>
		</header>

		<hr />
		
		<div>
			<input type="text" palceholder="검색어 입력..">
			<button>검색</button>
		</div>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
			</thead>

			<tbody id="tbody">

			</tbody>

		</table>


		<div class="position-relative pt-5">
			<ul id="pagination-demo"
				class="pagination position-absolute top-50 start-50 translate-middle"></ul>
			<a href="write.do"
				class="btn btn-primary position-absolute top-50 end-0 translate-middle-y">글쓰기</a>
		</div>


	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
	<script>
	
	
	$(function(){
	
			// 1. restful 호출해서 목록을 받아오는 것.
			async function ajaxBoardList(page){
				// 같은 서버내에서는  http://127.0.0.1:8080/web02 생략가능
				const url = '${pageContext.request.contextPath}/api/board/select.json?page=' + page;
				const headers = {"Content-Type":"application/json"};
				
				/* 시간이 너무 걸려서 이건 쓰지말자 
				axios.get(url, {headers}).then(function(response) { //이부분이 서버쪽에서 데이터를 받아오는 거라 좀 느림
					console.log(response);
					console.log('A');
				});
				console.log('B'); */
				
				const { data } = await axios.get(url, {headers}); //await) 완료될때 까지 기다렸다가 뒷코드 진행 가능
				console.log(data);
				
				// 2.함수를 pages정보를 넘겨서 생성시킴
				initPagination( Number(data.pages) );
				
				const tbody = document.getElementById('tbody');
				tbody.innerHTML = '';
				for(let tmp of data.list) {
					console.log(tmp.no, tmp.title, tmp.writer);
					tbody.innerHTML += 
						`<tr>` + 
							'<td scope="row">'+tmp.no +'</td>' +
							'<td>' + tmp.title + '</td>' +
							'<td>' + tmp.writer + '</td>' +
							'<td>' + tmp.hit + '</td>' +
							'<td>' + tmp.regdate + '</td>' +
						`</tr>`;
				}
			};
			
			ajaxBoardList(1); //얘를 호출하지 않으면 동작하지 않음 (함수 호출시키기)
			
			// 2. 페이지네이션 생성하는 함수
			function initPagination( pages ) {
				$('#pagination-demo').twbsPagination({
					  totalPages	: pages,
					  visiblePages	: 10,
					  first 		: '≪',
					  last 			: '≫',
					  prev 			: '<',
					  next 			: '>',
					  onPageClick	: function (event, page) {
						  // 1번 함수호출				      
						  ajaxBoardList(page);
					  }
				});
			};
		});
	
		</script>


</body>
</html>