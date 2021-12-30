package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class GroupJoinRequestMessage extends Message {
    private String groupName;

    private String username;

    public GroupJoinRequestMessage(int sequenceId, String username, String groupName) {
        this.groupName = groupName;
        this.username = username;
        setSequenceId(sequenceId);
    }

    @Override
    public int getMessageType() {
        return GroupJoinRequestMessage;
    }
}
