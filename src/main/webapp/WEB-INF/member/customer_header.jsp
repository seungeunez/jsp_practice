<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header>

	<h3>홈 페이지</h3>
			
	<hr />
	
	<a href="home.do" class="btn btn-light">홈</a>
	<a href="mypage.do" class="btn btn-light">마이페이지</a>
	
	<!-- 로그아웃 상태 -->
	<c:if test="${sessionScope.id eq null}"> <!-- 공백조심 공백있으면 오류뜸 / eq는 == -->
		<a href="login.do" class="btn btn-light">로그인</a>
		<a href="join.do" class="btn btn-light">회원가입</a>
	</c:if>
	
	<!-- 로그인 상태-->
	<c:if test="${sessionScope.id ne null}"> <!-- ne는 != -->
		<a href="${pageContext.request.contextPath}/board/select.do" class="btn btn-light">자유게시판</a>
		<label>${sessionScope.name}님이 로그인을 하셨습니다.</label>
				
		<a href="#" class="btn btn-light" onclick="logoutAction()">로그아웃</a>
	</c:if>
	
	<hr />	


</header>