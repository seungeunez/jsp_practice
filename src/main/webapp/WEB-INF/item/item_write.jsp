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
			<h3>물품 등록</h3>
			<hr />
			<!-- <form action="/write.do" method="post">와는 전혀 다르다 /의 이미는 127.0.0.1:8080/write.do가 되고, /를 빼면 마지막이라고 인식함 -->
			<!-- <form action="/write.do" method="post"> => 127.0.0.1:8080/write.do -->
			<!-- <form action="write.do" method="post"> => 127.0.0.1:8080/web02/item/write.do -->
			<form id="form" action="write.do" method="post">
				<div class="row">
					<div class="col-sm">
						<div class="form-floating mb-2">
							<!-- name을 쓰는 이유는 주소창에 name뜨는게 걔네다 controller에서 request.getParameter ="name속성값"을 주고 -->
							<!-- id는 css에서 쓰는 document.getElementById("id속성값")이다. -->
		                    <input type="text" name="name" id="name" class="form-control" autofocus required/>
		                    <label for="name" class="form-label">물품명</label> 
		                </div>
	
						<!-- form태그 내 div태그는 정보 전달이 안되기 때문에 textarea로 넘겨서 다른곳으로 정보전달한거였음 (form태그는 textarea, input태그만 정보전달이 되니깐) -->
						<!-- 그런데도 form태그 쓰는 이유는 글 쓰는 공간을 만들기 위해서 쓴거였긔~ -->
						<div style="margin-bottom:5px"> 
		                    <div id="editor" style="height:300px">
								<p>Hello World!</p>
						  		<p><br></p>
							</div>
	                    </div>  
	                    
	                    <textarea name="content" id="content" style="display:none;"></textarea> <!-- 나중에 display:none;으로 바꿀 것 -->
	                     
		                <div class="form-floating mb-2">
		                    <input type="text" name="price" id="price" class="form-control" required />
		                    <label for="price" class="form-label">가격</label> <!-- id 속성값과 for 속성값은 동일하게 줬네 -->
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="text" name="quantity" id="quantity" class="form-control" required />
		                    <label for="quantity" class="form-label">수량</label>
		                </div>
	
						<div>
							<input type="button" value="등록" class="btn btn-primary" style="float:right" onclick="insertItem()" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
		
		
		const toolbarOptions = [
		  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
		  ['blockquote', 'code-block'],

		  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
		  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
		  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
		  [{ 'direction': 'rtl' }],                         // text direction

		  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
		  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

		  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
		  [{ 'font': [] }],
		  [{ 'align': [] }],

		  ['clean']                                         // remove formatting button
		];
		
		// 위쪽에 있는 태그중에서 id가 editor인 것을 찾아서 toolbar는 toolbarOptions의 값으로 대체하고 테마를 snow로 해서 변경
		var quill = new Quill('#editor', {
		  modules: {
		    toolbar: toolbarOptions
		  },
		  theme: 'snow'
		});
		
		//여기 까지가 
		
		function insertItem() {
			
			//물품명 유효성검사 (위에 input태그 내에 적은 required도 유효성 검사임)
			const name = document.getElementById("name");
			
			if(name.value.length <= 0){
				alert('물품명을 입력하세요.');
				name.focus();
				return false;
			}
			
			//가격 유효성 검사
			const price = document.getElementById("price");
			
			if(price.value.length <= 0){
				alert('가격을 입력하세요.');
				price.focus();
				return false;
			}
			
			//수량 유효성 검사
			const quantity = document.getElementById("quantity");
			
			if(quantity.value.length <= 0){
				alert('수량을 입력하세요.');
				quantity.focus();
				return false;
			}

			
			
			// div태그 내용을 textarea로 복사 (div태그의 내용을 전송할 수 있게 변경)
			const divContent = quill.root.innerHTML;
			document.getElementById("content").value = divContent;
			
			// 전송시킴
			document.getElementById("form").submit();
			
		}
	</script>
</body>
</html>