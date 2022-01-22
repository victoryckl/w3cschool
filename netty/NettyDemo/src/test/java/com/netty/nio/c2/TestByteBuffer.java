package com.netty.nio.c2;

import lombok.extern.slf4j.Slf4j;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

@Slf4j
public class TestByteBuffer {
    public static void main(String[] args) {
        try (FileChannel channel = new FileInputStream("data.txt").getChannel()) {
            ByteBuffer buffer = ByteBuffer.allocate(10);
            while (true) {
                int len = channel.read(buffer);
                if (len == -1) break;
                log.debug("读到的字节数 {}", len);
                buffer.flip();
                while (buffer.hasRemaining()) {
                    byte b = buffer.get();
                    log.debug("实际字节 {}", (char) b);
                }
                buffer.clear();
            }
        } catch (IOException e) {
        }
    }
}
