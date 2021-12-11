package domain.server;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

public class ChatModel {
    private String type;
    private String name;
    private String msg;

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

    public ChatModel(String type, String name, String msg) {
        this.type = type;
        this.name = name;
        this.msg = msg;
    }

    public String toJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(this);
    }
}
