package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class LoginRequestMessage extends Message {

    private String username;
    private String password;

    public LoginRequestMessage() {
    }

    public LoginRequestMessage(int sequenceId, String username, String password) {
        this.username = username;
        this.password = password;
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return Message.LoginRequestMessage;
    }
}
