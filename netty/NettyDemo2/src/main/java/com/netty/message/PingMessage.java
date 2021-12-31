package com.netty.message;

public class PingMessage extends Message {

    public PingMessage(int sequenceId) {
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return PingMessage;
    }
}
