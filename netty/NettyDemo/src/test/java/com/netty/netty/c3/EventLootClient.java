package com.netty.netty.c3;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringEncoder;
import lombok.extern.slf4j.Slf4j;

import java.net.InetSocketAddress;

@Slf4j
public class EventLootClient {
    public static void main(String[] args) throws InterruptedException {
        ChannelFuture channelFuture = new Bootstrap()
                .group(new NioEventLoopGroup())
                .channel(NioSocketChannel.class)
                .handler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel ch) throws Exception {
                        ch.pipeline().addLast(new StringEncoder());
                    }
                })
                //connect()是异步非阻塞的，main thread发起调用，实际是Nio thread中进行连接
                .connect(new InetSocketAddress("localhost", 8080));

        //使用sync方法同步处理结果
        /*channelFuture.sync();//等待nio thread中connect()完成
        Channel channel = channelFuture.channel();
        log.debug("{}", channel);
        channel.writeAndFlush("hello");*/

        //使用 addListener 方法异步处理结果
        channelFuture.addListener(new ChannelFutureListener() {
            @Override //connect完成后，在nio thread中调用
            public void operationComplete(ChannelFuture channelFuture) throws Exception {
                Channel channel = channelFuture.channel();
                log.debug("{}", channel);
                channel.writeAndFlush("hello");
            }
        });
    }
}
