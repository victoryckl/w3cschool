package com.netty.message;

import lombok.Data;
import lombok.ToString;

import java.util.Set;

@Data
@ToString(callSuper = true)
public class GroupMembersResponseMessage extends AbstractResponseMessage {

    private Set<String> members;

    public GroupMembersResponseMessage(int sequenceId, Set<String> members) {
        super(sequenceId, false, null);
        this.members = members;
    }

    @Override
    public int getMessageType() {
        return GroupMembersResponseMessage;
    }
}
