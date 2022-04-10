<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="d-flex justify-content-center">
	    <div class="chat-name">
		    <div class="d-flex">
			    <input type="text" id="name" class="col-4 chat-nickname form-control bg-white" value="${user.loginId}" disabled> 
			    <button onclick="startChat(this)" id="btn" class="btn btn-outline-primary ml-2">채팅시작</button>
		    </div>
	    
		    <div id="chatDiv">
			    <textArea id="chatContent" cols="100" rows="10" class="form-control my-2 bg-white" style="border: none" readonly></textArea>
			    
			    <div class="d-flex">
				    <input type="text" id="chatMsg" class="form-control col-6" placeholder="메세지를 입력 해주세요">
				    <button onclick="sendMsg()" class="send-btn btn bg-white ml-1"><img src="/static/image/send.png" alt="image" width="20"></button>
				</div>
		    </div>
	    </div>
	    
    </div>
    <div class="d-flex justify-content-center mt-3">
    	<a href="${pageContext.request.contextPath}/couple/home_view"><img src="/static/image/house.png" class="mr-4" height="50"></a>
		<a href="${pageContext.request.contextPath}/timeline/timeline_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
		<a href="${pageContext.request.contextPath}/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
	</div>
    
	<script >
	

	
	$(document).keypress(function(event){
		
		  var keycode = (event.keyCode ? event.keyCode : event.which);
		  if(keycode == '13'){
			  //startChat(this);
			  sendMsg();
		  }
		  

		  
		});
	
	// 채팅 스크롤 하단으로 보내기

	
	
	function sendMsg() {  // 7번
		var msg = {
				cmd : 'msg'
				,msg : $('#chatMsg').val()
				,chatName : chatName
				,id : ${couple.id}
		}
		
		websocket.send(JSON.stringify(msg));
	
		// 아래로 자동 스크롤
		document.getElementById("chatContent").scrollTop = document.getElementById("chatContent").scrollHeight;
	}
	
	
	
	
	var websocket;
	var chatName;
		function startChat(obj){
			
			if (obj.innerText === '종료') {
				
				var msg = {
						cmd : 'close'
						,chatName : chatName
						,id : ${couple.id}
				}
				websocket.send(JSON.stringify(msg));
				//websocket.close(); //
				
				$('#name').attr('disabled',false);
				//$('#chatDiv').css('display','none');
				//obj.innerText = '채팅시작';//
			} else {
				chatName = $('#name').val();
				/* if (!chatName) {
					alert('대화명은 필수 입니다.');
					$('#name').focus();
					return;
				} */
				//    IPv4 주소 localhost 대신에 넣어준다
				websocket = new WebSocket("ws://172.30.2.37/ws/chat"); //1번 ipconfig
				
				websocket.onmessage = function(evt){ // 6번 9번
					var chatMsg = JSON.parse(evt.data); //parse 메소드는 string 객체를 json 객체로 변환
					console.log(chatMsg); 
					$('#chatMsg').focus();
					//console.log(evt);
					if (chatMsg.cmd === 'open') { // 입장 했을 떄
						$('#chatContent').append(chatMsg.chatName+'님이 입장 하셨습니다.\r\n');
					} else if (chatMsg.cmd === 'msg') { // 메세지 썻을 때 이름: 메세지내용
						$('#chatContent').append('[' + chatMsg.chatName + '] :' + chatMsg.msg + '\r\n');
						  clearTextarea();
					} else if (chatMsg.cmd === 'close') {
						$('#chatContent').append(chatMsg.chatName+'님이 퇴장 하셨습니다.\r\n');
						
						if (chatmsg.chatName === chatName) {
							websocket.close();
							obj.innerText = '채팅시작';
							$('#chatDiv').css('display',''); // 3개 지워주기
						}
					
					}
				};
				// 연결이 되었을 때 
				websocket.onopen = function(evt){ // 3번
					console.log(evt);
					var msg = { // json을 문자화 시킴
							cmd : 'open' // 들어왔는지 여부 
							,chatName : chatName
							,id : ${couple.id}
					}
					websocket.send(JSON.stringify(msg)); // 4번 stringify 메소드는 json 객체를 String 객체로 변환
					
					$('#name').attr('disabled',true);
					//$('#chatDiv').css('display','');
					obj.innerText = '종료';
				};
				websocket.onclose = function(evt){
					console.log(evt);
				};
			}
		}
		// 메세지 입력박스 내용 지우기
		    function clearTextarea() {
		        $('#chatMsg').val('');
		    }
		 
		 

	</script>