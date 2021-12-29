package com.netty.netty.c3;

import io.netty.channel.DefaultEventLoop;
import io.netty.channel.EventLoop;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.TimeUnit;

@Slf4j
public class TestEventLoop {
    public static void main(String[] args) {
        //创建事件循环组
        EventLoopGroup group = new NioEventLoopGroup(2);//io事件，普通任务，定时任务
        //EventLoopGroup group2 = new DefaultEventLoop();//普通任务，定时任务

        //获取下一个事件循环事件 (获取下一个thread)
        System.out.println(group.next());
        System.out.println(group.next());
        System.out.println(group.next());

        //执行普通任务
        group.next().submit(() -> {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            log.debug("ok");
        });

        //执行定时任务
        group.next().scheduleAtFixedRate(() -> {
            log.debug("schedule");
        }, 2, 1, TimeUnit.SECONDS);

        log.debug("main");
    }
}
