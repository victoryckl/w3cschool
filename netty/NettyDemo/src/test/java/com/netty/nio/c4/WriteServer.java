package com.netty.nio.c4;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.nio.charset.Charset;
import java.util.Iterator;

@Slf4j
public class WriteServer {
    public static void main(String[] args) throws IOException {
        ServerSocketChannel ssc = ServerSocketChannel.open();
        ssc.configureBlocking(false);
        Selector selector = Selector.open();
        ssc.register(selector, SelectionKey.OP_ACCEPT);
        ssc.bind(new InetSocketAddress(8080));
        log.debug(WriteServer.class.getName() +" started");

        while (true) {
            selector.select();
            Iterator<SelectionKey> iter = selector.selectedKeys().iterator();
            while (iter.hasNext()) {
                SelectionKey key = iter.next();
                iter.remove();
                if (key.isAcceptable()) {
                    SocketChannel sc = ssc.accept();
                    sc.configureBlocking(false);
                    SelectionKey scKey = sc.register(selector, 0, null);
                    scKey.interestOps(SelectionKey.OP_READ);
                    //向客户端写入大量数据
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < 700000; i++) {
                        sb.append('a');
                    }
                    ByteBuffer buffer = Charset.defaultCharset().encode(sb.toString());

                    //返回值表示写入的字节数
                    int write = sc.write(buffer);
                    System.out.println(write);

                    //判断是否有剩余内容
                    if (buffer.hasRemaining()) {
                        //关注可写事件
                        scKey.interestOps(scKey.interestOps() + SelectionKey.OP_WRITE);
                        //key.interestOps(SelectionKey.OP_WRITE | key.interestOps());
                        //把未写完的buffer保存到key中
                        scKey.attach(buffer);
                    }
                } else if (key.isWritable()) {
                    ByteBuffer buffer = (ByteBuffer) key.attachment();
                    SocketChannel sc = (SocketChannel) key.channel();
                    int write = sc.write(buffer);
                    System.out.println(write);
                    if (!buffer.hasRemaining()) {
                        key.attach(null); // 需要清除buffer
                        //不再关注可写事件
                        //key.interestOps( (~SelectionKey.OP_WRITE) & key.interestOps());
                        key.interestOps(key.interestOps() - SelectionKey.OP_WRITE);
                    }
                }

            }
        }
    }
}
