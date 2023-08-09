<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h3>회원별 주문목록</h3>
	<div style="width:700px; border: 1px solid #cccccc; padding:50px">
		<canvas id="myChart"></canvas>
	</div>
</div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<script>

	const ctx = document.getElementById("myChart").getContext("2d");
	const config ={
		type : 'bar', //키(key)는 오타가 나면 안 됨 type, data, label등 얘내가 키임
		data : {
			labels : ['a', 'b', 'c'],
			datasets: [
				{
					label : '테스트',
					data : [10, 20, 30]
				} 
				
			]
		} 
	}
	const chart = new Chart(ctx, config);
	
	
	
	async function changeChart(){
		const url = '${pageContext.request.contextPath}/api/purchase/member.json';
		const headers = {"Content-Type":"application/json"};
		const { data } = await axios.get(url, {headers}); //await) 완료될때 까지 기다렸다가 뒷코드 진행 가능 
		console.log(data);// [{...}, {...}]
		
		let label = []; //빈 배열 생성하기
		let cnt = [];	//빈 배열 생성하기
		
		for(let tmp of data){
			console.log(tmp);
			label.push(tmp.CUSTOMERID); //고객아이디만 추출해서 label 변수에 추가하기
			cnt.push(tmp.CNT); //주문수량만 추출해서 cnt변수에 추가하기
		}
		
		//data값을 config변수로 변경
		//config.data.datasets[1].lable='회원별 주문수량';
		config.data.labels=label;
		config.data.datasets[0].label="회원별 주문수량";
		//config.data.datasets[1].data = [55, 66, 77];
		config.data.datasets[0].data = cnt;
		chart.update();
	}
	
	changeChart(); //함수는 자동으로 호출되지 않기때문에 호출하기 //버튼이 있었을 땐 눌러서 바꼈는데 없앴으니 이 코드로 함수 호출되게끔
	
</script>