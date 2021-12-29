package com.netty.netty.c3;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.logging.LoggingHandler;
import lombok.extern.slf4j.Slf4j;

import java.nio.charset.Charset;

@Slf4j
public class EventLoopServer {
    public static void main(String[] args) throws InterruptedException {
        //如果读写handler任务耗时较多，可以新建一个EventLoopGroup单独处理，避免阻塞NioEventLoopGroup
        EventLoopGroup group = new DefaultEventLoopGroup();

        new ServerBootstrap()
                //boss 和 worker
                // boos 只负责ServerSocketChannel上的 accept事件
                // worker 只负责 SocketChannel 上的读写事件
                .group(new NioEventLoopGroup(), new NioEventLoopGroup(2))
                .channel(NioServerSocketChannel.class)
                .childHandler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel ch) throws Exception {
                        ch.pipeline().addLast("handler1", new ChannelInboundHandlerAdapter(){
                            @Override                                          //ByteBuf
                            public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
                                ByteBuf buf = (ByteBuf) msg;
                                log.debug(buf.toString(Charset.defaultCharset()));
                                super.channelRead(ctx, msg);
                            }
                        });

                        //handler将运行在指定的group中
                        /*ch.pipeline().addLast(group, "handler2", new ChannelInboundHandlerAdapter() {
                            @Override
                            public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
                                ByteBuf buf = (ByteBuf) msg;
                                log.debug(buf.toString(Charset.defaultCharset()));
                                super.channelRead(ctx, msg);
                            }
                        });*/
                    }
                })
                .bind(8080)
                .sync();
        log.debug("server stated");
    }
}
