<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	
	<title>홈페이지</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />

</head>

<body>

	<div class="container">
		<div style="width: 1000px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
		
		<a href="${pageContext.request.contextPath}/seller/home.do" class="btn btn-light">홈</a>
		<a href="select.do?menu=1" class="btn btn-sm btn-primary">전체 주문목록</a>
		<a href="select.do?menu=2" class="btn btn-sm btn-primary">회원별 주문목록</a>
		<a href="select.do?menu=3" class="btn btn-sm btn-primary">물품별 주문목록</a>
		<a href="select.do?menu=4" class="btn btn-sm btn-primary">시간대별 주문목록</a>
		<hr />
		
		<c:if test="${param.menu == 1 }">
			<jsp:include page="./purchase_menu/menu1.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 2 }">
			<jsp:include page="./purchase_menu/menu2.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 3 }">
			<jsp:include page="./purchase_menu/menu3.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 4 }">
			<jsp:include page="./purchase_menu/menu3.jsp"></jsp:include>
		</c:if>
			
		</div>
	</div>

	<script>
	
		

	</script>

</body>
</html>