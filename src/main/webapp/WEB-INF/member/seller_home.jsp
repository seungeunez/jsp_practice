<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	
	<title>홈페이지(판매자)</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>

	<div class="container">
		<div style="width: 1200px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>판매자 홈페이지</h3>
			
			<hr />
			
			<a href="home.do" class="btn btn-light">홈</a>
			
			<c:if test="${sessionScope.id eq null}"> <!-- 공백조심 공백있으면 오류뜸 / eq는 == -->
				<a href="login.do" class="btn btn-light">로그인</a>
				<a href="join.do" class="btn btn-light">회원가입</a>
			</c:if>
			
			<c:if test="${sessionScope.id ne null}"> <!-- ne는 != -->
				<label>${sessionScope.name}님이 로그인을 하셨습니다.</label>
				<a href="${pageContext.request.contextPath}/item/select.do" class="btn btn-light">물품관리</a>
				<a href="${pageContext.request.contextPath}/purchase/select.do" class="btn btn-light">주문관리</a>
				<a href="#" class="btn btn-light" onclick="logoutAction()">로그아웃</a>
			</c:if>
			
			<hr />	
			
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