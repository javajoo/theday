package com.theday.websocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class WebSocketHandler extends TextWebSocketHandler {

    private static Map<String,List<WebSocketSession>> sessionMap = Collections.synchronizedMap(new HashMap<>());

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ObjectMapper om; // 잭슨 라이브러리 
	
	
	// 보낸 메세지 받을 때 
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload(); //5번 // 8번 // 페이로드는 데이터, 텍스트로만 들어간다.
        log.info("payload : {}",payload);
        ChatMsg cm = om.readValue(payload, ChatMsg.class);
        log.info("cm =>{}", cm);
      
       String id = cm.getId();
       
       if (!sessionMap.containsKey(id)) { // 아이디가 해당채팅방에 없다면 <레이지로딩: 요청시 생성> <-> 프리로딩:(@component... 서버들어가면서 메모리 생성하는거 )
    	   sessionMap.put(id, new ArrayList<>()); // 채팅방 들어갔으면 새로 만들어준다.. 로그인 후 채팅방에 입장 하면 새로 만들어준다. 
    	   // 불필요한 방 미리 만들어놓을 필요 없다.. 요청 왔을때에 만들어준다.
       } 
       List<WebSocketSession> sessionList = sessionMap.get(id);
       if (cm.getCmd().equals("open")) {
    	   sessionList.add(session);
       }
        
        for(WebSocketSession sess: sessionList) {
            sess.sendMessage(message);
        }
    }
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	//webSocketSessionList.add(session); //2번 접속세션 들어감
        log.info("접속 성공 => {}", session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	//webSocketSessionList.remove(session);
    	
    	Iterator<String> it = sessionMap.keySet().iterator();
    	while (it.hasNext()) {
    		String id = it.next();
    		List<WebSocketSession> sessionList = sessionMap.get(id);
    		if (sessionList.contains(session)) {
    			sessionList.remove(session);
    		}
    		for (WebSocketSession ws : sessionList) {
    			ChatMsg cm = new ChatMsg();
    			cm.setCmd("close");
    			
    			session.sendMessage(null);
    		}
    	}
    }
}