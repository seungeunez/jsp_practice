<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	
	<title>마이페이지(고객용)</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>

	<div class="container">
		<div style="width: 1200px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>마이페이지</h3>
			<hr />
			
			<a href="home.do" class="btn btn-light">홈</a>
			<a href="mypage.do?menu=1" class="btn btn-light">회원정보수정</a>
			<a href="mypage.do?menu=2" class="btn btn-light">회원비번변경</a>
			<a href="mypage.do?menu=3" class="btn btn-light">회원탈퇴</a>
			<a href="mypage.do?menu=4" class="btn btn-light">주문내역</a>
			<a href="mypage.do?menu=5" class="btn btn-light">주소관리</a>
			<hr />
			
			
			<c:if test="${param.menu == 1}"> <!-- 주소값을 들고오기위해 param이라고 써야함 -->
				<jsp:include page="./customer_menu/menu1.jsp"></jsp:include> <!-- 공백주의 -->
			</c:if>
			
			<c:if test="${param.menu == 2}">
				<jsp:include page="./customer_menu/menu2.jsp"></jsp:include>
			</c:if>
			
			<c:if test="${param.menu == 3}">
				<jsp:include page="./customer_menu/menu3.jsp"></jsp:include>	
			</c:if>
			
			<c:if test="${param.menu == 4}">
				<jsp:include page="./customer_menu/menu4.jsp"></jsp:include>
			</c:if>
			
			<c:if test="${param.menu == 5}">
				<jsp:include page="./customer_menu/menu5.jsp"></jsp:include>
			</c:if>
			
			
		</div>
	</div>

	<script>
	
		//menu1.jsp
		function updateMember(){
			//유효성 검사 
			const name = document.getElementsByName("name")[0];
			const age = document.getElementsByName("age")[0];
			
			if(name.value.length <= 0){
				alert('이름을 입력해주세요');
				name.focus();
				return false;
			}
			
			if(age.value.length <= 0){
				alert('나이를 입력하세요');
				age.focus();
				return false;
			}
			
			// docuemnt.getElementsByTagName("form")[0].submit(); 밑에 두 줄이 이거랑 같은 말임
			const form = document.getElementsByTagName("form");
			form[0].submit();
		}
		
		
		//menu2.jsp
		function updatePW(){
			
			const pw = document.getElementsByName("pw")[0];
			const pw1 = document.getElementsByName("pw1")[0];
			const pw2 = document.getElementsByName("pw2")[0];
			
			if(pw.value.length <= 0){
				alert('비밀번호를 입력해주세요');
				name.focus();
				return false;
			}
			
			if(pw.value === pw1.value ){
				alert('현재비밀번호와 새비밀번호가 같습니다. 바꾸저ㅜ세요');
				pw1.focus();
				return false;
			}
			
			
			if(pw1.value.length <= 0){
				alert('새 비밀번호를 입력해주세요');
				pw1.focus();
				return false;
			}
			
			if(pw2.value.length <= 0){
				alert('새 비밀번호를 입력해주세요');
				pw2.focus();
				return false;
			}
			
			if(pw1.value != pw2.value ){
				alert('새 비밀번호를 다시 확인해주세요');
				pw1.focus();
				return false;
			}
			
			
			
			const form = document.getElementsByTagName("form");
			form[0].submit();
		}
		
		// menu3.jsp
		function deleteMember(){
			const pw = document.getElementsByName("pw")[0];
			
			if(pw.value.length <= 0){
				alert('비밀번호를 입력해주세요');
				name.focus();
				return false;
			}
			
			
			
			const form = document.getElementsByTagName("form");
			form[0].submit();
			
		}

	</script>

</body>
</html>