package com.theday.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.theday.websocket.WebSocketHandler;

@Configuration
@EnableWebSocket

public class WebSocketConfig implements WebSocketConfigurer {

    private final WebSocketHandler webSocketHandler;
    
    @Autowired
    public WebSocketConfig(WebSocketHandler webSocketHandler) {
    	this.webSocketHandler = webSocketHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    
        registry.addHandler(webSocketHandler, "ws/chat").setAllowedOrigins("*");
    }
    
    public static void main(String[] args) throws ClassNotFoundException {
    	Class.forName("asdf");
	}
}