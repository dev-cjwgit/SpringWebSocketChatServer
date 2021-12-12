package domain.server;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

public class ChatModel implements Cloneable {
    private String cmd;
    private String type;
    private String name;
    private String msg;
    private String email;
    private String roomid;

    @Override
    public ChatModel clone() throws CloneNotSupportedException {
        return (ChatModel) super.clone();
    }

    public ChatModel(String cmd, String type, String name, String msg, String email, String roomid) {
        this.cmd = cmd;
        this.type = type;
        this.name = name;
        this.msg = msg;
        this.email = email;
        this.roomid = roomid;
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String roomid) {
        this.roomid = roomid;
    }

    public String getEmail() {
        return email;
    }

    public String getCmd() {
        return cmd;
    }

    public void setCmd(String cmd) {
        this.cmd = cmd;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ChatModel() {
    }

    public String toJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(this);
    }
}
