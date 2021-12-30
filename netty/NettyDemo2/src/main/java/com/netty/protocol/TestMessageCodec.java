package com.netty.protocol;

import com.netty.message.LoginRequestMessage;
import com.netty.message.LoginResponseMessage;
import com.netty.message.Message;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufAllocator;
import io.netty.channel.embedded.EmbeddedChannel;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;

public class TestMessageCodec {
    public static void main(String[] args) throws Exception {
        LoggingHandler LOGGING_HANDLER = new LoggingHandler(); //@Sharable
        //MessageCodec MESSAGE_CODEC = new MessageCodec(); // must be not @Sharable
        MessageCodecSharable MESSAGE_CODEC = new MessageCodecSharable();

        EmbeddedChannel channel = new EmbeddedChannel(
                LOGGING_HANDLER,
                new LengthFieldBasedFrameDecoder(Message.maxFrameLength, Message.lengthFieldOffset,
                        Message.lengthFieldLength, 0, 0),
                MESSAGE_CODEC
        );

        LoginRequestMessage message = new LoginRequestMessage("zhangsan", "123");
        message.setSequenceId(11);
        message.setMessageType(22);
        channel.writeOutbound(message);

        LoginResponseMessage response = new LoginResponseMessage(true, "ok");
        response.setSequenceId(33);
        response.setMessageType(44);
        channel.writeOutbound(response);

        ByteBuf buf = ByteBufAllocator.DEFAULT.buffer();
        new MessageCodec().encode(null, message, buf);
        channel.writeInbound(buf);

        //消息不完整时，或者消息过长，需要用到 LengthFieldBaseFrameDecoder 识别出完整的消息
        ByteBuf buf2 = ByteBufAllocator.DEFAULT.buffer();
        new MessageCodec().encode(null, message, buf2);
        ByteBuf s1 = buf2.slice(0, 100);
        ByteBuf s2 = buf2.slice(100, buf2.readableBytes() - 100);

        s1.retain();//避免被释放掉

        channel.writeInbound(s1); //在writeInbound()中会调研 s1.release()导致buf2/s1/s2被释放
        channel.writeInbound(s2); //第二次，才写完整数据
    }
}
