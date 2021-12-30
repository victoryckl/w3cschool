package com.netty.server;

import com.netty.protocol.MessageCodecSharable;
import com.netty.protocol.ProtocolFrameDecoder;
import com.netty.server.handler.ChatRequestMessageHandler;
import com.netty.server.handler.LoginRequestMessageHandler;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatServer {
    public static void main(String[] args) {
        NioEventLoopGroup boss = new NioEventLoopGroup();
        NioEventLoopGroup worker = new NioEventLoopGroup();
        LoggingHandler loggingHandler = new LoggingHandler(LogLevel.DEBUG);
        MessageCodecSharable messageCodec = new MessageCodecSharable();
        LoginRequestMessageHandler loginHandler = new LoginRequestMessageHandler();
        ChatRequestMessageHandler chatHandler = new ChatRequestMessageHandler();
        try {
            Channel channel = new ServerBootstrap()
                    .group(boss, worker)
                    .channel(NioServerSocketChannel.class)
                    .childHandler(new ChannelInitializer<NioSocketChannel>() {
                        @Override
                        protected void initChannel(NioSocketChannel ch) throws Exception {
                            ch.pipeline().addLast(new ProtocolFrameDecoder())
                                    .addLast(loggingHandler)
                                    .addLast(messageCodec)
                                    .addLast(loginHandler)
                                    .addLast(chatHandler);
                        }
                    })
                    .bind(8080).sync().channel();
            log.debug("server started");
            channel.closeFuture().sync();
        } catch (InterruptedException e) {
            log.debug("server error", e);
        } finally {
            boss.shutdownGracefully();
            worker.shutdownGracefully();
        }
    }

}
