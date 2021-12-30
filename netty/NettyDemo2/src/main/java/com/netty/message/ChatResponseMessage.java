package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class ChatResponseMessage extends AbstractResponseMessage {
    private String from;
    private String content;

    public ChatResponseMessage(int sequenceId) {
        setSequenceId(sequenceId);
    }

    public ChatResponseMessage(int sequenceId, boolean success, String reason) {
        super(sequenceId, success, reason);
    }

    public ChatResponseMessage(int sequenceId, String from, String content) {
        super(sequenceId);
        this.from = from;
        this.content = content;
    }

    @Override
    public int getMessageType() {
        return Message.ChatRequestMessage;
    }
}
