package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.server.ChatModel;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@ServerEndpoint(value = "/echo.do")
public class WebSocketController {

    private static final List<Session> sessionList = new ArrayList<Session>();

    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);

    public WebSocketController() {
    }

    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:" + session.getId());
        /*        try {
            final Basic basic = session.getBasicRemote();
//            basic.sendText("채팅방 입장");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }*/
        sessionList.add(session);
//        sendAllSessionToMessage(session, new ChatDTO("", "", ""));
    }

    private void sendAllSessionToMessage(Session self, ChatModel chatDTO) {
        try {
            for (Session session : WebSocketController.sessionList) {
                if (!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(chatDTO.toJson());
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ChatModel chatDTO = objectMapper.readValue(message, ChatModel.class);

        sendAllSessionToMessage(session, chatDTO);
        try {
            final RemoteEndpoint.Basic basic = session.getBasicRemote();
            basic.sendText(chatDTO.toJson());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @OnError
    public void onError(Throwable e, Session session) {

    }

    @OnClose
    public void onClose(Session session) {
        logger.info("Session " + session.getId() + " has ended");
//        sendAllSessionToMessage(session, "server", session.getId() + " 님이 퇴장하셧습니다.");
        sessionList.remove(session);
    }
}
