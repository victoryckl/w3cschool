package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class GroupChatRequestMessage extends Message {
    private String content;
    private String groupName;
    private String from;

    public GroupChatRequestMessage(int sequenceId, String from, String groupName, String content) {
        this.content = content;
        this.groupName = groupName;
        this.from = from;
        setSequenceId(sequenceId);
    }

    @Override
    public int getMessageType() {
        return GroupChatRequestMessage;
    }
}
