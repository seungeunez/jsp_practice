<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8' />
<meta http-equiv='X-UA-Compatible' content='IE=edge' />
<title>물품 등록</title>
<meta name='viewport' content='width=device-width, initial-scale=1' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
</style>
</head>

<body>
	<div class="container">
		<div style="width: 800px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>물품 이미지 등록</h3>
			<hr />
			<!-- <form action="/write.do" method="post">와는 전혀 다르다 /의 이미는 127.0.0.1:8080/write.do가 되고, /를 빼면 마지막이라고 인식함 -->
			<!-- <form action="/write.do" method="post"> => 127.0.0.1:8080/write.do -->
			<!-- <form action="write.do" method="post"> => 127.0.0.1:8080/web02/item/write.do -->
			
			<!-- enctype="multipart/form-data", 이 방식은 <form> 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용함 / controller에 @MultipartConfig도 필요함-->
			<form id="form" action="imagewrite.do" method="post" enctype="multipart/form-data"> <!-- submit했을 때 action의 주소가 내가 가고자 하는 주소여야함-->
				<div class="row">
					<div class="col-sm">
						<div class="form-floating mb-2">
						
							<!-- name을 쓰는 이유는 주소창에 name뜨는게 걔네다 controller에서 request.getParameter ="name속성값"을 주고 -->
							<!-- id는 css에서 쓰는 document.getElementById("id속성값")이다. -->
		                    <input type="text" name="ino" id="ino" style="background-color:#efefef;" value="${ino}" class="form-control" readonly/>
		                    <label for="ino" class="form-label">물품번호</label> 
		                </div>
		          
		                <div class="form-floating mb-2">
		                	<img src="${pageContext.request.contextPath}/resources/images/default.png" id="img" style="width:100px; height:100px; cursor:pointer;" onclick="clickImage()"/>
		                    <input  type="file" name="file" id="file" class="form-control" style="display:block;" onchange="imageChange(this)" /> <!-- 변화에 대한 정보까지가 this를 써줘야함 -->
		                </div>
	
						<div>
							<input type="button" value="등록" class="btn btn-primary" style="float:right" onclick="insertImageItem()" />
							<a href="select.do" class="btn btn-success">목록으로</a>
						</div>
	
					</div>
				</div>
			</form>
			<hr />
			<form id="form1" action="imagewritebatch.do?ino=${ino}" method="post" enctype="multipart/form-data">
				<c:forEach var="idx" begin="1" end="3" step="1">
	             	<img src="${pageContext.request.contextPath}/resources/images/default.png" 
	             	 class="imgs" style="width:50px; height:50px; cursor:pointer;"/>
	                 <input type="file" name="file[]" onchange="imageChangeBatch(this, '${idx-1}')" />
	                 <br/>
				</c:forEach>
				<input type="button" value="일괄등록" onclick="insertImageBatch()" class="btn btn-primary" style="float:right">
				<a href="select.do" class="btn btn-success">목록으로</a>
			</form>
			
			<hr />
			<c:forEach var="no" items="${imageNo}">
				${no} 
				<img src="${pageContext.request.contextPath}/item/image?no=${no}" style="width:100px; height:100px" />
				<button onclick="itemUpdateModal('${no}', '${ino}')" >수정</button> <!-- 이미지 번호, 물품 번호 -->
				<button onclick="itemImageDelete('${no}', '${ino}')">삭제</button> <!-- ino = itemno -->
				<br />
			</c:forEach>
		</div>
	</div>
	
	<!-- 이미지 수정 모달창 (얘는 위치 신경안써도 됨!)-->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="imageupdate.do" method="post" enctype="multipart/form-data">
			<div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">이미지 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        이미지 번호 <input type="text" name="imageNo" id="modal_image_no" style="background-color:#efefef; margin-bottom:10px;" readonly /> <br />
			        현재 이미지 <img src="" style="width:100px; height:100px; padding-bottom:10px;" id="modal_image_src" /> <br />
			        <input type="hidden" name="ino" value="${ino}" /> 
			        변경 이미지 <input type="file" name="file" id="modal_image_file" />
			      </div>
			      <div class="modal-footer">
			      	<input type="submit" class="btn btn-primary" value="이미지 변경"></input> <!-- button으로 되어 있으면 전송이 안됨 form태그 내부에 있어서 그런듯-->
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			     </div>
			  </div>
			</div>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script> <!-- 얘가 먼저 와야함 -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<script>
	
	
		function itemUpdateModal(no, ino) {
			const imageNo = document.getElementById("modal_image_no");
			const imageSrc = document.getElementById("modal_image_src");
			const imageFile = document.getElementById("modal_image_file");
			
			//모달 창이 뜨기전에 나와야함
			imageNo.value = no;
			imageSrc.src = '${pageContext.request.contextPath}/item/image?no='+no;
			
			//모달창  띄우기
			const modal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
			modal.show();
		}
	
		function itemImageDelete(no, ino){ // (삭제할 이미지번호, 물품번호)
			const ret = confirm('삭제할까요?');
			if(ret === true){
				
				//<form action="imagedelte.do" method="post" style="display:none;">
				var form = document.createElement("form");
				form.setAttribute("action", "imagedelete.do");
				form.setAttribute("method", "post");
				form.style.display="none";
				
				
				//<input type="hidden" name="imageno" value="삭제할번호" />
				var input = document.createElement("input");
				input.setAttribute("type", "hidden");
				input.setAttribute("name", "imageno");
				input.setAttribute("value", Number(no)); // typescript
				
				//<input type="hidden" name="ino" value="삭제할번호" />
				var input1 = document.createElement("input");
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "ino");
				input1.setAttribute("value", Number(ino));
				
				//form태그에 추가
				form.appendChild(input);
				form.appendChild(input1);
				
				//body태그에 추가
				document.body.appendChild(form);
				
				//form 전송
				form.submit();
			}
		}
	
		//document.getElementById("아이디"); id가 일치하는 1개 찾기  (id값은 고유해야 함) 
		//document.getElementsByName("name값"); name값이 일치하는 n개 찾기
		//document.getElementesByClassName("class값"); class값이 일치하는 n개 찾기
		//document.getElementsByTagName("img"); 태그가 img인 n개 찾기
		

		const imgs = document.getElementsByClassName("imgs"); // <img src class="imgs" />
		const files = document.getElementsByName("file[]"); // <input type="file" name="file[]" />
		
		//이미지 여러개 첨부했을 때 취소했을 때
		function imageChangeBatch(e, idx){ //첨푸한파일정보, type=file의 위치(0부터)
			
			if(e.files.length > 0){ // 첨부했을 때
				imgs[ Number(idx)].src=URL.createObjectURL(e.files[0]); // 가상의 url정보를 생성해서 추가함
			}
			else{ //첨부했다가 첨부취소했을 때의 경우
				imgs[ Number(idx)].src="${pageContext.request.contextPath}/resources/images/default.png";
			}
		}
		
		
		//이미지 여러개 등록 유효성 검사
		function insertImageBatch(){
			
			var chk = 0;
			for(let i=0; i<files.length; i++){ //files전체 반복
				if(files[i].value.length <= 0){// 첨부하지 않은 것을 발견하면
					alert('이미지 첨부하세요');  //알림창 표시
					chk = 1;
					break; //반복문 종료
				}
			}
			if(chk === 0){ //if문을 한 번도 수행하지 않았다면 
				//form1 전송
				document.getElementById("form1").submit();
			
		
			}
			
		}
		 
	
		
		function clickImage(){ //파일선택을 누르지 않고 이미지 클릭했을 때 파일 선택할 수 있게
			document.getElementById("file").click();
		}
	
		
		function imageChange(e){
			
			const img = document.getElementById("img");
			console.log(e.files);
			
			if(e.files.length > 0){ // 첨부했을 때
				//console.log(URL.createObjectURL(e.files[0]));
			
				//가상의 url은 파일을 첨부할 때 크롬에서 blob:http://1.237.... 
				img.src = URL.createObjectURL(e.files[0]); //가상의 url정보를 생성해서 추가함 (이미지 뜨게 함!)
				
			}
			else{ //첨부했다가 첨부취소했을 때의 경우
				img.src = "${pageContext.request.contextPath}/resources/images/default.png";
			}
			
		}
		
		
	 	// 이미지 하나 유효성 검사
		function insertImageItem(input) {
			
			//유효성 검사 한 후
			const file = document.getElementById("file");
			
			if(file.value.length <= 0){
				alert('이미지를 등록해주세요');
				// file.focus(); 
				return false;
			}
			
			//form 태그 전송
			document.getElementById("form").submit();
	   	
		}
	 	
	 	
	 	
		
		
		
		
		
		
	</script>
</body>
</html>