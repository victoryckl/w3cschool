package com.netty.nio.c2;

import java.nio.ByteBuffer;

import static com.netty.nio.c2.ByteBufferUtil.debugAll;

public class TestByteBufferReadWrite {
    public static void main(String[] args) {
        ByteBuffer buffer = ByteBuffer.allocate(10);
        buffer.put((byte) 0x61);
        debugAll(buffer);
        buffer.put(new byte[] {(byte) 0x62, (byte) 0x63, (byte) 0x64});
        debugAll(buffer);


        buffer.flip();
        System.out.println(buffer.get());
        debugAll(buffer);
        buffer.compact();
        debugAll(buffer);
        buffer.put(new byte[] {(byte) 0x65, (byte) 0x66});
        debugAll(buffer);
    }
}
