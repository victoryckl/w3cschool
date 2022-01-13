package com.maven.test;

import java.io.*;
import java.net.Socket;

public class AppMain2 {
    public static void main(String[] args) throws IOException {
        System.out.println("hello "+AppMain2.class.getName());

        Socket socket = new Socket("localhost", 2022);

        // 要发送给服务器的信息
        OutputStream os = socket.getOutputStream();
        PrintWriter pw = new PrintWriter(os);
        pw.write("客户端发送信息");
        pw.flush();

        socket.shutdownOutput();

        // 从服务器接收的信息
        InputStream is = socket.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String info = null;
        while((info = br.readLine())!=null){
            System.out.println("我是客户端，服务器返回信息："+info);
        }

        br.close();
        is.close();
        os.close();
        pw.close();
        socket.close();

        System.out.println("运行结束");
    }
}
