package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class GroupMembersRequestMessage extends Message {
    private String groupName;

    public GroupMembersRequestMessage(int sequenceId, String groupName) {
        this.groupName = groupName;
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return GroupMembersRequestMessage;
    }
}
