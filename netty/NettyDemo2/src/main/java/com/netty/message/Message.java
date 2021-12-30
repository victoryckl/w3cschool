package com.netty.message;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Data
public abstract class Message implements Serializable {

    //具体数值参考消息编解码器 com.netty.protocol.MessageCodecSharable
    public static final int maxFrameLength = 1024;
    public static final int lengthFieldOffset = 12;
    public static final int lengthFieldLength = 4;

    /**
     * 根据消息类型字节，获得对应的消息 class
     * @param messageType 消息类型字节
     * @return 消息 class
     */
    public static Class<? extends Message> getMessageClass(int messageType) {
        return Message.class;
    }

    private int sequenceId;

    private int messageType;

    public abstract int getMessageType();

    public static final int LoginRequestMessage = 0;
    public static final int LoginResponseMessage = 1;
    public static final int ChatRequestMessage = 2;
    public static final int ChatResponseMessage = 3;
    public static final int GroupCreateRequestMessage = 4;
    public static final int GroupCreateResponseMessage = 5;
    public static final int GroupJoinRequestMessage = 6;
    public static final int GroupJoinResponseMessage = 7;
    public static final int GroupQuitRequestMessage = 8;
    public static final int GroupQuitResponseMessage = 9;
    public static final int GroupChatRequestMessage = 10;
    public static final int GroupChatResponseMessage = 11;
    public static final int GroupMembersRequestMessage = 12;
    public static final int GroupMembersResponseMessage = 13;
    public static final int PingMessage = 14;
    public static final int PongMessage = 15;

    /**
     * 请求类型 byte 值
     */
    public static final int RPC_MESSAGE_TYPE_REQUEST = 101;
    /**
     * 响应类型 byte 值
     */
    public static final int  RPC_MESSAGE_TYPE_RESPONSE = 102;

    private static Map<Integer, Class<? extends Message>> messageClasses = new ConcurrentHashMap<>();

    static {
        messageClasses.put(LoginRequestMessage, LoginRequestMessage.class);
        messageClasses.put(LoginResponseMessage, LoginResponseMessage.class);
    }

}
