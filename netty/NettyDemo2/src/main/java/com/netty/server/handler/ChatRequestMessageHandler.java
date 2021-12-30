package com.netty.server.handler;

import com.netty.message.ChatRequestMessage;
import com.netty.message.ChatResponseMessage;
import com.netty.server.session.SessionFactory;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

@ChannelHandler.Sharable
public class ChatRequestMessageHandler extends SimpleChannelInboundHandler<ChatRequestMessage> {
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, ChatRequestMessage msg) throws Exception {
        String to = msg.getTo();
        Channel channel = SessionFactory.getSession().getChannel(to);
        ChatResponseMessage response = new ChatResponseMessage(msg.getSequenceId());
        if (channel != null) {//在线
            response.setFrom(msg.getFrom());
            response.setContent(msg.getContent());
            channel.writeAndFlush(response);
        } else {//不在线
            response.setSuccess(false);
            response.setReason("对方用户不存在或者不在线");
            ctx.writeAndFlush(response);
        }
    }
}
