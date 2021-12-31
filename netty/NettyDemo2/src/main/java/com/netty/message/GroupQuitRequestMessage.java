package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class GroupQuitRequestMessage extends Message {
    private String groupName;

    private String username;

    public GroupQuitRequestMessage(int sequenceId, String username, String groupName) {
        this.groupName = groupName;
        this.username = username;
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return GroupQuitRequestMessage;
    }
}
