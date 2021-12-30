package com.netty.server;

import com.netty.protocol.MessageCodecSharable;
import com.netty.protocol.ProtocolFrameDecoder;
import com.netty.server.handler.*;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.handler.timeout.IdleStateHandler;
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
        GroupCreateRequestMessageHandler groupCreateHandler = new GroupCreateRequestMessageHandler();
        GroupChatRequestMessageHandler groupChatHandler = new GroupChatRequestMessageHandler();
        GroupJoinRequestMessageHandler groupJoinHandler = new GroupJoinRequestMessageHandler();
        GroupMembersRequestMessageHandler groupMembersHandler = new GroupMembersRequestMessageHandler();
        GroupQuitRequestMessageHandler groupQuitHandler = new GroupQuitRequestMessageHandler();
        QuitHandler quitHandler = new QuitHandler();

        try {
            Channel channel = new ServerBootstrap()
                    .group(boss, worker)
                    .channel(NioServerSocketChannel.class)
                    .childHandler(new ChannelInitializer<NioSocketChannel>() {
                        @Override
                        protected void initChannel(NioSocketChannel ch) throws Exception {
                            ch.pipeline()
                                    .addLast(new ProtocolFrameDecoder()) //协议帧，处理粘包半包问题
                                    .addLast(messageCodec) //编解码： ByteBuf <=> Message

                                    //用来判断是不是 读空闲时间过长 或 写空闲时间过长
                                    // 5s 内如果没有收到 channel 的数据，会触发一个 IdleState#READ_IDLE 事件
                                    .addLast(new IdleStateHandler(5, 0, 0))
                                    // ChannelDuplexHandler可以同时作为入站和出站处理器
                                    .addLast(new ChannelDuplexHandler() {
                                        //用来触发特殊事件，例如 READ_IDLE
                                        @Override
                                        public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
                                            if (evt instanceof IdleStateEvent) {
                                                IdleStateEvent event = (IdleStateEvent) evt;
                                                //触发读空闲事件
                                                if (event.state() == IdleState.READER_IDLE) {
                                                    log.debug("已经 5s 没有读到数据了");
                                                    ctx.channel().close();
                                                }
                                            }
                                            super.userEventTriggered(ctx, evt);
                                        }
                                    })

                                    .addLast(loggingHandler)
                                    .addLast(loginHandler)
                                    .addLast(chatHandler)
                                    .addLast(groupCreateHandler)
                                    .addLast(groupChatHandler)
                                    .addLast(groupJoinHandler)
                                    .addLast(groupMembersHandler)
                                    .addLast(groupQuitHandler)
                                    .addLast(quitHandler);
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
