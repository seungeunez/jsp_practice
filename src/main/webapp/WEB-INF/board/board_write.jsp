<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8' />
<meta http-equiv='X-UA-Compatible' content='IE=edge' />
<title>게시판글쓰기</title>
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
			<h3>게시판글쓰기</h3>
			<hr />
			<div class="row">
				<div class="col-sm">
					<div class="form-floating mb-2">
	                    <input type="text" id="title" class="form-control" autofocus required/>
	                    <label for="title" class="form-label">제목</label>
	                </div>

					<div style="margin-bottom:5px">
	                    <div id="editor" style="height:300px">
						  <p>Hello World!</p>
						  <p>Some initial <strong>bold</strong> text</p>
						  <p><br></p>
						</div>
                    </div>   
	                <div class="form-floating mb-2">
	                    <input type="text" id="writer" class="form-control" required />
	                    <label for="writer" class="form-label">작성자</label>
	                </div>

					<div>
						<input type="submit" value="글쓰기" class="btn btn-primary" style="float:right" onclick="getEditorContent()" />
					</div>
				</div>
			</div>
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
		
		
		function getEditorContent() {
			const title = document.getElementById('title');
			const writer = document.getElementById('writer');
			const content = quill.root.innerHTML; //위쪽에 만든 에디터 객체를 통해서 가져오기
			// const title = document.getElementById('title');
            //const title = document.querySelector('#title');
			
            
            //유효성 검사
            if(title.value.length <= 0){
            	alert('제목을 입력하세요.');
            	title.focus();
            	return false; // 아래쪽 소스코드를 수행하지 않음. 함수가 종료됨
            }
            
            if(writer.value.length < 1){
            	alert('작성자를 입력하세요.');
            	writer.focus();
            	return false; //함수 종료
            }
            
            
            //<form action="write.do" method="post"> 
            // 	<input type="text" name="title" value="실제입력값"></input> 
            // 	<input type="text" name="title" value="실제입력값"></input>
            // 	<input type="text" name="title" value="실제입력값"></input>
            //</form>
            var form = document.createElement("form");
            form.action = "write.do";
            form.method= "post";
            form.style.display = "none"; //창을 넘어갈 때 폼이 떠서 그거 안보이게 해주는 거
            
            // <input type="text" name="title" value="실제입력값"></input>
            var input1 = document.createElement("input");
            input1.type = "text";
            input1.name = "title";
            input1.value = title.value;
   
            form.appendChild(input1);
            
            var input2 = document.createElement("input");
            input2.type = "text";
            input2.name = "content";
            input2.value = content;
   
            form.appendChild(input2);
            
            var input3 = document.createElement("input");
            input3.type = "text";
            input3.name = "writer";
            input3.value = writer.value;
   
            form.appendChild(input3);
            
			/* console.log(title);
			console.log(writer);
			console.log(content); */
			
			document.body.appendChild(form); //body태그 안에 form넣는 거랑 같음
			form.submit();//버튼 누르면 제출
		}
	</script>
</body>
</html>