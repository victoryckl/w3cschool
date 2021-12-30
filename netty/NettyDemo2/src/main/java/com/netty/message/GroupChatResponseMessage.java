package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class GroupChatResponseMessage extends AbstractResponseMessage {
    private String from;
    private String content;

    public GroupChatResponseMessage(int sequenceId, boolean success, String reason) {
        super(sequenceId, success, reason);
    }

    public GroupChatResponseMessage(int sequenceId, String from, String content) {
        super(sequenceId);
        this.from = from;
        this.content = content;
    }
    @Override
    public int getMessageType() {
        return GroupChatResponseMessage;
    }
}
