<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>물품목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>
	<div class="container">
		<div style="width: 800px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>물품 목록</h3>
			<hr />
			<div style="width:500px; margin-top:10px; margin-bottom:10px">
				<form class="row g-2">

	  				<a href="${pageContext.request.contextPath}/seller/home.do" class="btn btn-light">판매자 홈</a>
	  			
	  				<div class="col-auto">
						<input type="text" name="text" class="form-control" placeholder="검색어" style="width:300px;"/>
					</div>
					<div class="col-auto">
						<input type="submit" class="btn btn-primary" value="검색" />
					</div>
					
				</form>		
			</div>
			
			<table class="table table-sm table-hover">
	  			<thead>
	    			<tr>
						<th scope="col">번호</th>
						<th scope="col">물품명</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">날짜</th>
						<th scope="col">이미지</th>
				    </tr>
	  			</thead>
				<tbody>
					<c:forEach var="obj" items="${list}">
					<tr>
						<td scope="row">${obj.no}</td>
						<td>${obj.name}</td>
						<td>${obj.price}</td>
						<td>${obj.quantity}</td>
						<td>${obj.regdate}</td>
						<td><a href="imagewrite.do?ino=${obj.no}" class="btn btn-primary">이미지 등록</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="write.do" class="btn btn-primary"  style="float:right">물품등록</a>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
	<script>

	</script>
</body>
</html>