package com.netty.message;

import lombok.Data;
import lombok.ToString;

import java.util.Set;

@Data
@ToString(callSuper = true)
public class GroupCreateRequestMessage extends Message {
    private String groupName;
    private Set<String> members;

    public GroupCreateRequestMessage(int sequenceId, String groupName, Set<String> members) {
        this.groupName = groupName;
        this.members = members;
        setSequenceId(sequenceId);
    }

    @Override
    public int getMessageType() {
        return GroupCreateRequestMessage;
    }
}
