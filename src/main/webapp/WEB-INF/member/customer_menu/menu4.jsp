<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1' />

<title>홈페이지(고객용)</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />

</head>

<body>
	
	<div class="container">
	<form action="deletepurchase.do" method="post" id="form4">
		<h3 class="mb-4 pt-3">주문 내역</h3>
		

		<table class="table table-hover">
			<thead>
				<tr style="background-color:lightgray;">
					<th>주문번호</th>
					<th>주문수량</th>
					<th>주문일자</th>
					<th>고객아이디</th>
					<th>고객명</th>
					<th>물품번호</th>
					<th>물품명</th>
					<th>물품가격</th>
					<th>주문금액</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="total" value="${0}" /> <!-- 변수 만들기 (반복문 전에) 주문금액 총 합계 구하려고  -->
				<c:forEach var="obj" items="${list}">
					<tr>
						<th scope="row"><input type="checkbox" name="chk[]" value="${obj.no}" />${obj.no}</th>
						<td><fmt:formatNumber value="${obj.cnt}" pattern="#,###" /></td>
						<td><fmt:formatDate value="${obj.regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td>${obj.customerid}</td>
						<td>${obj.name}</td>
						<td>${obj.itemno}</td>
						<td>${obj.itemname}</td>
						<td> 
							<fmt:formatNumber value="${obj.itemprice}" pattern="#,###" />
						</td>
						<td>
							<fmt:formatNumber value="${obj.cnt * obj.itemprice}" pattern="#,###" />
						</td>
						<c:set var="total" value="${total + (obj.cnt * obj.itemprice)}" />
					</tr>
				</c:forEach>
				<tr>
					<th colspan="8">합계</th>
					<td>
						<fmt:formatNumber value="${total}" pattern="#,###" />
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" class="btn btn-sm btn-danger" value="주문취소" onclick="deletePurchaseAction()"/>

	</form>
	</div>

<script>
	function deletePurchaseAction(){
		
		//태그 중에서 name값이 chk[]인것을 n개 찾음
		const chk = document.getElementsByName("chk[]");
		
		let isCheck = 0;
		for(let i=0; i<chk.length; i++){ //찾은 개수만큼 반복함
			if(chk[i].checked === true) { //체크된게 있다면
				isCheck = 1;
				break;
			}
		}
		//체크 된것이 있는지 확인. 1개라도 체크했다면 전송하기	
		if(isCheck === 1){
			if(confirm('주문을 취소할까요?')) {
				document.getElementById("form4").submit();
			}
			
		}else{
			alert('항목을 체크하세요');
			return false;
		}
	}
		

</script>

</body>
</html>