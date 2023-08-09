<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	
	<title>홈페이지(고객용)</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	
	<style>
	
		.grid{
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 1fr;
			column-gap: 10px;
			row-gap: 10px
		}
		
		.item{
			padding: 10px;
			border: 1px solid #cccccc;
			min-height: 300px;
		}
		
		a{
			text-decoration: none;
			color: #111111;
		}
		
		a:hover .item{
			color : red;
			border : 1px solid red;
		}


	</style>
	
</head>

<body>

	<div class="container">
		<div style="width: 1000px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			
			<jsp:include page="customer_header.jsp"></jsp:include>
			
			
			<!-- 홈 화면에 보여지는 사진들 -->
			<div class="grid">
				<c:forEach var="obj" items="${list}">
				<a href="product.do?itemno=${obj.no}">
					<div class="item">
					
					<c:if test="${obj.imageNo != 0}">
						<img src="${pageContext.request.contextPath}/item/image?no=${obj.imageNo}" style="width:100%; height:150px;" />
					</c:if>
					
					<c:if test="${obj.imageNo == 0}">
						<img src="${pageContext.request.contextPath}/resources/images/default.png" style="width:100%; height:150px;" />
					</c:if>
					
						물품명 ${obj.name} <br />
						가격 ${obj.price} <br />
						내용 ${obj.content}<br />
					</div>
				</a>
				</c:forEach>
			
			</div>
			
		</div>
	</div>

	<script>
	
		function logoutAction(){
			
			var form = document.createElement("form");
			
			form.setAttribute("action", "logout.do");
			form.setAttribute("method", "post");
			form.style.display = "none";
			document.body.appendChild(form);
			form.submit();
			
			
		}

	</script>

</body>
</html>