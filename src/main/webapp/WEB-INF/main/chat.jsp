<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅</title>
</head>
	<body>
		<input type="text" id="msg" value="내용전송" />
		<input type="button" id="btn" value="전송" onclick="sendMessage()" />
		<div id="output" style="border:1px solid #cccccc;">
		</div>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/mqtt/4.3.7/mqtt.min.js" type="text/javascript"></script>
		<script>
			const mqttOptions = {
					host : '1.234.5.158', //서버주소
					port : 11884, //포트번호
					options : { //옵션사항들
						clear : true,
						reconnectPeriod : 2000, //2초간격으로 접속하기
						clientId : '침입자_물러가라_' + new Date().getTime(), //접속하는 클라이언트 아이디 고유값
						username : 'ds606',
						password : 'ds606'
					}
			}
			
			//서버접속 'ws://1.234.5.158:11884'
			const url = 'ws://'+mqttOptions.host +":"+mqttOptions.port;
			const client  = mqtt.connect(url, mqttOptions.options);
			console.log(client);
			
			client.on('connect', ()=>{	//접속 성공했을 때 호출 됨.
				console.log('success');
			});
			
			client.on('error', ()=>{	// 접속 오류 발생 시 호출됨.
				console.log('error');
			});
			
			client.on('message', (topic, message)=>{ //메시지가 왔을 때 호출됨.
				//Unit8Array => String
				var msg1 = new TextDecoder().decode(message);
				console.log('message', topic, msg1);
				
				output.innerHTML = "["+topic+"]"+msg1+"<br />"+output.innerHTML;
			});
			
			
			//채널열기 구독
			client.subscribe('/pknu/class667/#', {qos:0}, (error, res) =>{	//#은 모든 메시지를 다 받겠다는 뜻
				if(error){
					console.log('subscribe error'); //구독 실패
				}
				else{
					console.log('subscribe success'); //구독 성공
				}
			}); 
			
			
			function sendMessage(){
				const msg = document.getElementById("msg").value;
				
				client.publish('/pknu/class667/침입자_물러가라', msg, 0, error => {
					if(!error){
						console.log('send success');
					}else{
						console.log('send error');
					}
				});
			}
			
		</script>
	</body>
</html>