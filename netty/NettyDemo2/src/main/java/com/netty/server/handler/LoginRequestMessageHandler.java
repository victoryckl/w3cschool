package com.netty.server.handler;

import com.netty.message.LoginRequestMessage;
import com.netty.message.LoginResponseMessage;
import com.netty.server.service.UserService;
import com.netty.server.service.UserServiceFactory;
import com.netty.server.session.SessionFactory;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

@ChannelHandler.Sharable
public class LoginRequestMessageHandler extends SimpleChannelInboundHandler<LoginRequestMessage> {

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, LoginRequestMessage msg) throws Exception {
        String username = msg.getUsername();
        String password = msg.getPassword();
        UserService userService = UserServiceFactory.getUserService();
        boolean login = userService.login(username, password);
        LoginResponseMessage response;
        if (login) {
            SessionFactory.getSession().bind(ctx.channel(), username);
            response = new LoginResponseMessage(msg.getSequenceId(), true, "登录成功");
        } else {
            response = new LoginResponseMessage(msg.getSequenceId(), false, "登录失败");
        }
        ctx.writeAndFlush(response);
    }
}
