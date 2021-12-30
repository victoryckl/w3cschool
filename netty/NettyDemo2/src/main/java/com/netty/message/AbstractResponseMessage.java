package com.netty.message;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public abstract class AbstractResponseMessage extends Message {
    private boolean success;
    private String reason;

    public AbstractResponseMessage() {

    }

    public AbstractResponseMessage(int sequenceId) {
        setSequenceId(sequenceId);
    }

    public AbstractResponseMessage(int sequenceId, boolean success, String reason) {
        this.success = success;
        this.reason = reason;
        setSequenceId(sequenceId);
    }
}
