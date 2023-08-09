<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인(판매자용)</title>
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div style="width: 500px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>로그인(form)</h3>
			<hr />

			
			<!-- <form action="login.do" method="post" id="form"> 상대경로 /web02/customer/바뀌는_곳.do -->
			<!-- <form action="/login.do" method="post" id="form"> 다 바뀜 /를 쓸거면 절대경로를 써라 -->
			<form action="${pageContext.request.contextPath}/seller/login.do" method="post" id="form">
				<div class="row">
					<div class="col-sm">
					
						<div class="form-floating mb-2">
							<input type="text" name="id" id="id" class="form-control" /> 
							<label for="id" class="form-label">아이디</label>
						</div>
	
						<div class="form-floating mb-2">
							<input type="password" name="pw" id="pw" class="form-control"  />  <!-- 암호는 하나만 name값 줌. 유효성 검사 똑같아서 -->
							<label for="pw" class="form-label">암호</label>
						</div>
						
			
						<div style="padding-top:1rem; display: flex; justify-content: center;">
							<input type="button" value="로그인" class="btn btn-primary" style="float: right; margin-right:5px;" onclick="loginAction()"/>
							<a href="join.do" class="btn btn-primary">회원가입</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<hr />
		
		<div style="width: 500px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>로그인(ajax)</h3>
			<hr />
			<div class="row">
				<div class="col-sm">
				
					<div class="form-floating mb-2">
						<input type="text" id="id1" class="form-control" /> 
						<label for="id1" class="form-label">아이디</label>
					</div>

					<div class="form-floating mb-2">
						<input type="password" id="pw1" class="form-control"  />  <!-- 암호는 하나만 name값 줌. 유효성 검사 똑같아서 -->
						<label for="pw1" class="form-label">암호</label>
					</div>
					
					<div style="padding-top:1rem; display: flex; justify-content: center;">
						<input type="button" value="로그인" class="btn btn-primary" style="float: right; margin-right:5px;" onclick="loginAction1()"/>
						<a href="join.do" class="btn btn-primary">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script>
	
		async function loginAction1(){
			const id = document.getElementById("id1");
			const pw = document.getElementById("pw1");
			
			const url 	   = '${pageContext.request.contextPath}/api/seller/login.json';
			const headers  = { "Content-Type": "application/x-www-form-urlencoded" };
			const body 	   = { id : id.value, pw : pw.value, role : role.value };
			const { data } = await axios.post(url, body, {headers});
			console.log(data);
			if(data.ret === 1) {
				alert('로그인 되었습니다.');
				window.location.href='home.do';
			}
			else{
				alert('아이디 또는 암호가 틀립니다.');
			}
		}

	
	

		//로그인 버튼 눌렀을 때
		function loginAction(){
			
			const id = document.getElementById("id");
			const pw = document.getElementById("pw");

			
			//유효성 검사	
		 	if(id.value.length <= 0){
				alert('아이디를 입력하세요');
				id.focus();
				return false; //함수 종료, 전송하지 않음
			}
			

			if(pw.value.length <= 0){
				alert('비밀번호를 입력하세요');
				pw.focus();
				return false;
			} 
				

			//전송
			document.getElementById("form").submit();
		}
	
		 
		
		
	</script>

</body>
</html>