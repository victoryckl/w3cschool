package com.netty.message;

public class PongMessage extends Message {

    public PongMessage(int sequenceId) {
        setSequenceId(sequenceId);
        setMessageType(getMessageType());
    }

    @Override
    public int getMessageType() {
        return PongMessage;
    }
}
