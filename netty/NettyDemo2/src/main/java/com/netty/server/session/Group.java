package com.netty.server.session;

import java.util.Collections;
import java.util.Set;

/**
 * 聊天组，即聊天室
 */
public class Group {
    // 聊天室名称
    private String name;
    // 聊天室成员
    private Set<String> members;

    public static final Group EMPTY_GROUP = new Group("empty", Collections.emptySet());

    public Group(String name, Set<String> members) {
        this.name = name;
        this.members = members;
    }

    public void addMember(String member) {
        members.add(member);
    }

    public void removeMember(String member) {
        members.remove(member);
    }

    public Set<String> getMembers() {
        return members;
    }
}
