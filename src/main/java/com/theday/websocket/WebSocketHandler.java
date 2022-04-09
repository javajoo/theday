package com.theday.websocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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

    private static List<WebSocketSession> webSocketSessionList = Collections.synchronizedList(new ArrayList<>());

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
       if (cm.getCmd().equals("open")) {
    	   
       } else if (cm.getCmd().equals("chat")) {
    	   
       }
        
        for(WebSocketSession sess: webSocketSessionList) {
            sess.sendMessage(message);
        }
    }
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	webSocketSessionList.add(session); //2번 접속세션 들어감
        log.info("접속 성공 => {}", session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	webSocketSessionList.remove(session);
        log.info("접속 해제=>{}", session);
    }
}