package com.netty.netty.c5;

import com.netty.config.Config;
import com.netty.message.ChatRequestMessage;
import com.netty.message.Message;
import com.netty.protocol.MessageCodecSharable;
import com.netty.protocol.Serializer;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufAllocator;
import io.netty.channel.embedded.EmbeddedChannel;
import io.netty.handler.logging.LoggingHandler;

public class TestSerializer {
    public static void main(String[] args) {
        MessageCodecSharable CODEC = new MessageCodecSharable();
        LoggingHandler LOGGING = new LoggingHandler();
        EmbeddedChannel channel = new EmbeddedChannel(LOGGING, CODEC, LOGGING);

        ChatRequestMessage message = new ChatRequestMessage(1, "zhangsan", "lisi", "你好");
        channel.writeOutbound(message);

        ByteBuf buf = messageToByteBuf(message);
        channel.writeInbound(buf);
    }

    public static ByteBuf messageToByteBuf(Message msg) {
        ByteBuf out = ByteBufAllocator.DEFAULT.buffer();
        out.writeBytes(new byte[]{1, 2, 3, 4});
        out.writeByte(1);
        int serializerType = Config.getAlgorithm().ordinal();
        out.writeByte(serializerType);
        out.writeByte(msg.getMessageType());
        out.writeInt(msg.getSequenceId());
        out.writeByte(0xff);
        Serializer.Algorithm algorithm = Serializer.Algorithm.values()[serializerType];
        byte[] bytes = algorithm.serialize(msg);
        out.writeInt(bytes.length);
        out.writeBytes(bytes);
        return out;
    }
}
