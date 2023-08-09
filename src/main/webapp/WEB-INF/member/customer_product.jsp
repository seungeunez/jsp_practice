<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	
	<title>홈페이지(고객용)</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />

</head>

<body>

	<div class="container">
		<div style="width: 1000px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
		
			<!-- header영역 -->
			<jsp:include page="customer_header.jsp"></jsp:include>	
			
			<!-- 이미지가 하나라도 있으면 실행 -->
			<c:if test="${not empty imageNo}">
				<c:forEach var="no" items="${imageNo}">
					<img src="${pageContext.request.contextPath}/item/image?no=${no}" style="width:200px; height:150px; padding-bottom:1rem;" />
				</c:forEach>
			</c:if>
			
			<!-- 이미지가 없으면 실행 -->
			<c:if test="${empty imageNo}">
				<img src="${pageContext.request.contextPath}/resources/images/default.png" style="width:200px; height:150px; padding-bottom:1rem;" />
			</c:if>
			
			<p>${obj.no}</p>
			<p>${obj.name}</p>
			<p>${obj.content}</p>
			<p>가격 ${obj.price}</p>
			
			<form id="form" action="purchase.do" method="post">
				<input type="hidden" name="itemno" value="${obj.no}" />
				<select name="cnt">
					<c:forEach var="idx" begin="1"  end="1000" step="1">
						<option value="${idx}">${idx}</option>
					</c:forEach>
				</select>
					<input type="submit" class="btn btn-sm btn-light" value="주문하기"  style="margin-left:4px" />
			</form>
			
		</div>
	</div>

	<script>
	
		

	</script>

</body>
</html>