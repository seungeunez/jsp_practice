<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<meta name='viewport' content='width=device-width, initial-scale=1' />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div style="width: 500px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>회원가입</h3>
			<hr />
			<form action="join.do" method="post" id="form">
				<div class="row">
					<div class="col-sm">
					
						<div class="form-floating mb-2">
							<input type="text" name="id" id="id" class="form-control" onkeyup="ajaxIDCheck(this)" /> 
							<label for="id" id="lbl_check" class="form-label">아이디</label>
						</div>
	
						<div class="form-floating mb-2">
							<input type="password" name="pw" id="pw" class="form-control"  />  <!-- 암호는 하나만 name값 줌. 유효성 검사 똑같아서 -->
							<label for="pw" class="form-label">암호</label>
						</div>
						
						<div class="form-floating mb-2">
							<input type="password" id="pw1" class="form-control" /> 
							<label for="pw1" class="form-label">암호확인</label>
						</div>
	
						<div class="form-floating mb-2">
							<input type="text" name="name" id="name" class="form-control"  /> 
							<label for="name" class="form-label">이름</label>
						</div>
						
						<div class="form-floating mb-2">
							<input type="number" name="age" id="age" class="form-control" /> 
							<label for="age" class="form-label">나이</label>
						</div>
	
						<div style="padding-top:1rem; display: flex; justify-content: center;">
							<input type="button" value="회원가입" class="btn btn-light" style="float: right" onclick="joinAction()"/>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script>
	
	
		//공통변수 (모든 함수에서 사용가능함)
		var idcheck = 0; // 1이면 사용 가능 0이면 사용불가능 //아이디 중복 확인
		
		
		//회원가입 버튼 눌렀을 때
		function joinAction(){
			
			//전 항목 입력되어있어야 회원가입 가능함
			//아이디 중복 아닌 것은 사용가능함
			//암호와 암호확인이 일치해야 사용가능함
			
			const id = document.getElementById("id");
			const pw = document.getElementById("pw");
			const pw1 = document.getElementById("pw1");
			const name = document.getElementById("name");
			const age = document.getElementById("age");
			
			
			//유효성 검사
			if(id.value.length <= 0){
				alert('아이디를 입력하세요');
				id.focus();
				return false; //함수 종료, 전송하지 않음
			}
			
			if(idcheck === 0) {
				alert('사용가능한 아이디를 입력하세요');
				id.focus();
				return false;
			}
			
			
			if(pw.value.length <= 0){
				alert('비밀번호를 입력하세요');
				pw.focus();
				return false;
			} 
			
			if(pw.value !== pw1.value){
				alert('암호가 일치하지 않습니다');
				pw1.focus();
				return false;
			}
			
			if(name.value.length <= 0){
				alert('이름을 입력하세요');
				name.focus();
				return false;
			}
			
			if(age.value.length <= 0){
				alert('나이를 입력하세요');
				age.focus();
				return false;
			}
			

			//전송
			document.getElementById("form").submit(); //버튼 눌를 때의 id값은 form을 이용하는군..
		}
	
	
		//아이디 중복 체크
		async function ajaxIDCheck(e){
			console.log(e.value);
			
			if(e.value.length > 0){

				//rest api 호출
				const url		='${pageContext.request.contextPath}/api/member/idcheck.json?id='+e.value;
				const headers	={"Content-Type":"application/json"};
				const {data} 	= await axios.get(url, {headers});
				
				//결과값 받기
				console.log(data);
				if(data.ret === 1) { //사용불가
					idcheck = 0;
					document.getElementById("lbl_check").innerText = '사용불가';

				}
				else if(data.ret === 0){//사용가능
					idcheck = 1;
					document.getElementById("lbl_check").innerText = '사용가능';
				}
			}else{
				idcheck = 0;
				document.getElementById("lbl_check").innerText = '아이디';
			}
		}
		
	</script>

</body>
</html>