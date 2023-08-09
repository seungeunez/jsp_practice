<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${obj.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>
	<div class="container">
		<div
			style="width: 700px; border: 1px solid #cccccc; margin: 0px auto; padding: 40px;">
			<div class="mb-3 row">
				<label for="staticEmail" class="col-sm-2 col-form-label">글번호</label>
				<div class="col-sm-10 pt-2">
					<input type="text" class="form-control" value="${obj.no}" readonly />
				</div>
			</div>

			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10 pt-2">${obj.title}</div>
			</div>

			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10 pt-2">${obj.content}</div>
			</div>

			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10 pt-2">${obj.writer}</div>
			</div>

			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">조회수</label>
				<div class="col-sm-10 pt-2">${obj.hit}</div>
			</div>

			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">날짜</label>
				<div class="col-sm-10 pt-2">${obj.regdate}</div>
			</div>

			<div class="mb-3 row">
				<div class="col-sm-10">
					<a class="btn btn-primary" href="select.do">목록으로</a>
					<button class="btn btn-primary" onclick="updateAction()">글수정</button>
		    		<button class="btn btn-primary" onclick="deleteAction()">글삭제</button>

					<c:if test="${pre > 0}">
						<a href="#" class="btn btn-primary" onclick="ajaxUpdateHit('${pre}')">
							이전글
						</a>
					</c:if> 
					
					<%-- <a href="#" class="btn btn-primary" onclick="preBoardOne('${pre}')">이전글</a> --%>

					 <c:if test="${next > 0}">
					 	<a href="#" class="btn btn-primary" onclick="ajaxUpdateHit('${next}')" >
							다음글
						</a>
					</c:if>
					
					<%-- <a href="#" class="btn btn-primary" onclick="nextBoardOne('${next}')">다음글</a> --%>
				</div>
			</div>
			
			

		</div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>

	<script>
	
			
		// 1. restful 호출해서 목록을 받아오는 것.
		async function ajaxUpdateHit(no){
			if(Number(no) == 0){
				alert('이동할 수 없습니다.');
				return false;
			}
			// 1. resful을 이용해서 조회수를 증가
			const url = '${pageContext.request.contextPath}/api/board/updatehit.json?no=' + no;
			const headers = {"Content-Type":"application/json"};
			
			const { data } = await axios.put(url, {}, {headers});
			console.log(data);
			
			if(data.result === 1) {
				// 2.  상세화면페이지로 전환
				window.location.href='selectone.do?no=' + no;
			}
			
			
		}
		
		
		

	
	</script>

</body>
</html>