package com.netty.message;

import com.netty.protocol.SequenceIdGenerator;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class ChatRequestMessage extends Message {

    private String content;
    private String to;
    private String from;

    public ChatRequestMessage() {
    }

    public ChatRequestMessage(int sequenceId, String from, String to, String content) {
        this.from = from;
        this.to = to;
        this.content = content;
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return Message.ChatRequestMessage;
    }
}
