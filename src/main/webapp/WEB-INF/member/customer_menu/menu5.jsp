<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>

	<!-- <a href="insertaddress.do" class="btn btn-light">주소관리</a> -->
	<button type="button" class="btn btn-sm btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
  		주소등록
	</button>
	
	<div class="container">

		<h3 class="mb-4">현재 등록된 주소 목록</h3>
		<table class="table">
			<thead>
				<tr style="background-color:lightgray;">
					<th>번호</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>등록일</th>
					<th>버튼</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach var="obj" items="${list}">
					<tr>
						<td>${obj.no}</td>
						<td>${obj.postcode}</td>
						<td>${obj.address}</td>
						<td>${obj.regdate}</td>
						<td><button onclick="deleteAddress('${obj.no}')" class="btn btn-sm btn-danger">삭제</button></td>					
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>


<form action="insertaddress.do" method="post" id="form5">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">주소등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
			<input type="button" class="btn btn-sm btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="address" id="sample6_address" style="margin-bottom:2px;" placeholder="주소"><br>
			<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">
	        
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-sm btn-primary" onclick="insertAddressAction()">등록</button>
	        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>


	//삭제 버튼 눌렀을 때
	function deleteAddress(no){
		
		if(confirm('삭제할까요?')){
			const form = document.createElement('form');
			form.setAttribute('action', 'deleteAddress.do?no='+no);
			form.setAttribute ('method', "post");
			form.style.display = "none";
			
			document.body.appendChild(form);
			form.submit();
		}
		

	}
	
	
	//등록 버튼 눌렀을 때
	function insertAddressAction(){
		
		const detail = document.getElementById("sample6_detailAddress"); //상세주소
	
		//유효성 검사	
	 	if(detail.value.length <= 0){
			alert('상세주소를 입력하세요');
			detail.focus();
			return false; //함수 종료, 전송하지 않음
		}
	 	
	 	//전송
	 	document.getElementById("form5").submit();
		
	}
	
	
	
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
	

</script>

</body>
