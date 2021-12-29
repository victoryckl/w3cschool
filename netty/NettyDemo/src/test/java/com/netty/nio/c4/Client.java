package com.netty.nio.c4;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

public class Client {
    public static void main(String[] args) throws IOException {
        SocketChannel sc = SocketChannel.open();
        sc.connect(new InetSocketAddress("localhost", 8080));
        SocketAddress address = sc.getLocalAddress();
        sc.write(Charset.defaultCharset().encode("hello 123456789123456789\nworld\n"));
        System.out.println("输入任意键停止运行");
        System.in.read();
        sc.close();//关闭
    }
}
