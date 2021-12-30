package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class LoginResponseMessage extends AbstractResponseMessage {

    public LoginResponseMessage(int sequenceId, boolean success, String reason) {
        super(sequenceId, success, reason);
    }

    @Override
    public int getMessageType() {
        return Message.LoginResponseMessage;
    }
}
