package com.bjpowernode;

public class NotEnougthException extends  RuntimeException {
    public NotEnougthException() {
        super();
    }

    public NotEnougthException(String message) {
        super(message);
    }
}
