package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.AccountDTO;
import domain.server.ChatModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.interfaces.IAccountService;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@ServerEndpoint(value = "/echo.do")
public class WebSocketController {
    public static IAccountService userService;

    private static final List<Session> sessionList = new ArrayList<Session>();

    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);

    private static final Map<String, ChatModel> userList = new HashMap<>();

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

    private void sendAllSessionToMessage(String json) {
        try {
            for (Session session : WebSocketController.sessionList) {
//                if (!self.getId().equals(session.getId())) {
                session.getBasicRemote().sendText(json);
//                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    static int cnt = 0;

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ChatModel chatModel = objectMapper.readValue(message, ChatModel.class);
        switch (chatModel.getCmd()) {
            case "enter_user":
//                session.getBasicRemote().sendText(new ChatModel("setname", null, "익명" + cnt++, null, null).toJson());
                try {
                    AccountDTO dto = userService.getAccount(chatModel.getEmail());
                    chatModel.setName(dto.getName());
                    userList.put(session.getId(), chatModel.clone());
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
//                session.getBasicRemote().sendText(chatModel.toJson());
                chatModel.setMsg(chatModel.getName() + " 님이 입장하셨습니다.");

            case "msg":
                sendAllSessionToMessage(chatModel.toJson());
                break;
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
        try {
            ChatModel user = userList.get(session.getId());
            user.setMsg(user.getName() + " 님이 퇴장하셨습니다.");
            sendAllSessionToMessage(user.toJson());
            userList.remove(session.getId());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
