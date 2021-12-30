package com.netty.server.session;

public class GroupSessionFactory {
    private static GroupSession groupSession = new GroupSessionMomoryImpl();

    public static GroupSession getGroupSession() {
        return groupSession;
    }
}
