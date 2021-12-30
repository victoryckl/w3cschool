package com.netty.client;

import com.netty.message.*;
import com.netty.protocol.MessageCodecSharable;
import com.netty.protocol.ProtocolFrameDecoder;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import lombok.extern.slf4j.Slf4j;

import java.net.InetSocketAddress;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;

@Slf4j
public class ChatClient {
    public static void main(String[] args) {
        NioEventLoopGroup group = new NioEventLoopGroup();
        LoggingHandler loggingHandler = new LoggingHandler(LogLevel.DEBUG);
        MessageCodecSharable messageCodec = new MessageCodecSharable();
        CountDownLatch WAIT_FOR_LOGIN = new CountDownLatch(1);
        AtomicBoolean LOGIN = new AtomicBoolean(false);
        try {
            Channel channel = new Bootstrap()
                .group(group)
                .channel(NioSocketChannel.class)
                .handler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel ch) throws Exception {
                        ch.pipeline().addLast(new ProtocolFrameDecoder())
                            //.addLast(loggingHandler)
                            .addLast(messageCodec)
                            .addLast("client handler", new ChannelInboundHandlerAdapter() {
                                @Override
                                public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
                                    log.debug("msg: {}", msg);
                                    if (msg instanceof LoginResponseMessage) {
                                        LoginResponseMessage response = (LoginResponseMessage) msg;
                                        LOGIN.set(response.isSuccess());
                                        WAIT_FOR_LOGIN.countDown();//唤醒system in线程
                                    }
                                }

                                @Override
                                public void channelActive(ChannelHandlerContext ctx) throws Exception {
                                    //负责接收用户在控制台的输入，负责向服务器发送消息
                                    new Thread(() -> {
                                        Scanner scanner = new Scanner(System.in);
                                        System.out.println("请输入用户名");
                                        String username = scanner.nextLine();
                                        System.out.println("请输入密码");
                                        String password = scanner.nextLine();

                                        LoginRequestMessage message = new LoginRequestMessage(username, password);
                                        ctx.writeAndFlush(message);

                                        try {
                                            WAIT_FOR_LOGIN.await();
                                        } catch (InterruptedException e) {
                                            e.printStackTrace();
                                        }
                                        if (!LOGIN.get()) {
                                            ctx.channel().close();
                                            return;
                                        }
                                        while (true) {
                                            System.out.println("==================================");
                                            System.out.println("send [username] [content]");
                                            System.out.println("gsend [group name] [content]");
                                            System.out.println("gcreate [group name] [m1,m2,m3...]");
                                            System.out.println("gmembers [group name]");
                                            System.out.println("gjoin [group name]");
                                            System.out.println("gquit [group name]");
                                            System.out.println("quit");
                                            System.out.println("==================================");
                                            String command = null;
                                            try {
                                                command = scanner.nextLine();
                                            } catch (Exception e) {

                                            }

                                            String[] s = command.split(" ");
                                            switch (s[0]) {
                                                case "send":
                                                    ctx.writeAndFlush(new ChatRequestMessage(username, s[1], s[2]));
                                                    break;
                                                case "gsend":
                                                    ctx.writeAndFlush(new GroupChatRequestMessage(username, s[1], s[2]));
                                                    break;
                                                case "gcreate":
                                                    Set<String> set = new HashSet<>(Arrays.asList(s[2].split(",")));
                                                    ctx.writeAndFlush(new GroupCreateRequestMessage(s[1], set));
                                                    break;
                                                case "gmembers":
                                                    ctx.writeAndFlush(new GroupMembersRequestMessage(s[1]));
                                                    break;
                                                case "gjoin":
                                                    ctx.writeAndFlush(new GroupJoinRequestMessage(username, s[1]));
                                                    break;
                                                case "gquit":
                                                    ctx.writeAndFlush(new GroupQuitRequestMessage(username, s[1]));
                                                    break;
                                                case "quit":
                                                    ctx.channel().close();
                                                    break;
                                            }
                                        }
                                    }, "system in").start();
                                }
                            });
                    }
                })
                .connect(new InetSocketAddress("localhost", 8080))
                .sync().channel();
            channel.closeFuture().sync();
        } catch (Exception e) {
            log.debug("client error", e);
        } finally {
            group.shutdownGracefully();
        }
    }
}
