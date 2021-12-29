package com.netty.nio.c4;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

import static com.netty.nio.c2.ByteBufferUtil.debugAll;

@Slf4j
public class MultiThreadServer {
    public static void main(String[] args) throws IOException {
        Thread.currentThread().setName("boss");
        ServerSocketChannel ssc = ServerSocketChannel.open();
        ssc.configureBlocking(false);
        Selector boss = Selector.open();
        ssc.register(boss, SelectionKey.OP_ACCEPT);
        ssc.bind(new InetSocketAddress(8080));

        // 创建固定数量的 worker 并初始化
        int workerCount = Runtime.getRuntime().availableProcessors();
        log.debug("workerCount = {}", workerCount);
        Worker[] workers = new Worker[workerCount];
        for (int i = 0; i < workers.length; i++) {
            workers[i] = new Worker("Worker-"+i);
        }
        AtomicInteger index = new AtomicInteger();

        while (true) {
            boss.select();
            Iterator<SelectionKey> iter = boss.selectedKeys().iterator();
            while (iter.hasNext()) {
                SelectionKey key = iter.next();
                iter.remove();
                if (key.isAcceptable()) {
                    SocketChannel sc = ssc.accept();
                    sc.configureBlocking(false);
                    log.debug("connected...{}", sc.getRemoteAddress());

                    // boss 调用 初始化 selector , 启动 worker
                    workers[index.getAndIncrement() % workers.length].register(sc);
                }
            }
        }
    }

    private static class Worker implements Runnable {
        private Thread thread;
        private Selector selector;
        private String name;
        private volatile boolean started = false;

        public Worker(String name) {
            this.name = name;
        }

        public void register(SocketChannel sc) throws IOException {
            if (!started) {
                selector = Selector.open();
                thread = new Thread(this, name);
                thread.start();
                started = true;
            }
            selector.wakeup();//boss线程调用，唤醒worker线程，处理事情
            sc.register(selector, SelectionKey.OP_READ);
        }


        @Override
        public void run() {
            while (true) {
                try {
                    selector.select();//阻塞，如果没有wakeup，会阻塞住sc.register
                    Iterator<SelectionKey> iter = selector.selectedKeys().iterator();
                    while (iter.hasNext()) {
                        SelectionKey key = iter.next();
                        if (key.isReadable()) {
                            ByteBuffer buffer = ByteBuffer.allocate(16);
                            SocketChannel sc = (SocketChannel) key.channel();
                            sc.read(buffer);
                            buffer.flip();
                            debugAll(buffer);
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
