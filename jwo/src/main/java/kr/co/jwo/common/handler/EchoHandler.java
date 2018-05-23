package kr.co.jwo.common.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		for(WebSocketSession sess: sessionList) {
//			sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
			sess.sendMessage(new TextMessage("내이름은 조원오다 : "+message.getPayload()));
//			sess.sendMessage(new TextMessage( + " : "+message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}