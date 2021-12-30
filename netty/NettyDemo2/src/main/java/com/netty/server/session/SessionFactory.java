package com.netty.server.session;

public class SessionFactory {
    private static Session session = new SessionMemoryImpl();

    public static Session getSession() {
        return session;
    }
}
