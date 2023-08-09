<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	
	
	
	
</head>

<body>
	
	<div class="container pt-5 mt-5" style = "width: 800px; margin: 0 auto; padding: 30px; border: 1px solid #efefef; ">


			<header>
				<h1>게시판 목록</h1>
			</header>
		
			<hr/>
			<a href="${pageContext.request.contextPath}/customer/home.do" class="btn btn-sm btn-white">홈으로</a>
			<a href="write.do" class="btn btn-white">글쓰기</a>
			<hr/>
			
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
				
				<tbody>
					<c:forEach var="obj" items="${list}">
						<tr>
							<td scope="row">${obj.no}</td>
							<td><a href="#" onclick="ajaxUpdateHit('${obj.no}')">${obj.title}</a></td>
							<td>${obj.writer}</td> 
							<td>${obj.hit}</td> 
							<td>${obj.regdate}</td> 
						</tr>
					</c:forEach>
					
					</hr>
						
				</tbody>
	
			</table>
			
			
			<div class="position-relative pt-5">
               <ul id="pagination-demo" class="pagination position-absolute top-50 start-50 translate-middle"></ul>
               
            </div>
			
			
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
		
		<script>
		async function ajaxUpdateHit(no){
			// 1. resful을 이용해서 조회수를 증가
			const url = '${pageContext.request.contextPath}/api/board/updatehit.json?no=' + no;
			const headers = {"Content-Type":"application/json"};
			
			/* await axios.get(url, {headers});
			await axios.post(url, body, {headers});
			await axios.put(url, body, {headers});
			await axios.delete(url, {headers:{ }, data:{ }}); */
			
			const { data } = await axios.put(url, {}, {headers});
			console.log(data);
			
			if(data.result === 1) {
				// 2.  상세화면페이지로 전환
				window.location.href='selectone.do?no=' + no;
			}
			
			
		}
		
		
		$(function(){
			$('#pagination-demo').twbsPagination({
				totalPages	: Number('${pages}'),
				visiblePages: 10,
				first		: '≪',
				last		: '≫',
				prev		: '＜',
				next		: '＞',
				initiateStartPageClick : false,
				startPage 	: Number('${param.page}'),
				onPageClick	: function(event, page){
					window.location.href="select.do?page="+page;
				}
			
			});
		});
		

		</script>
	

</body>
</html>