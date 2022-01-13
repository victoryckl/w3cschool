package com.maven.test;

import java.io.*;
import java.sql.*;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class AppMain {
    public static void main(String[] args) throws Exception {
        System.out.println("hello "+AppMain.class.getName());

        InputStream inputStream = AppMain.class.getResourceAsStream("/jdbc.properties");
        Properties properties = new Properties();
        properties.load(inputStream);
        inputStream.close();

        Set<Object> keySet = properties.keySet();
        Iterator<Object> it = keySet.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            System.out.println(next + " => " + properties.get(next));
        }

        System.out.println("===============================");
        InputStream inputStream2 = AppMain.class.getResourceAsStream("/app.properties");
        Properties properties2 = new Properties();
        properties2.load(inputStream2);
        inputStream2.close();

        Set<Object> keySet2 = properties2.keySet();
        Iterator<Object> it2 = keySet2.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            System.out.println(next + " => " + properties2.get(next));
        }

        testJdbc();

    }

    private static void testJdbc() throws Exception {
        System.out.println("===============================");

        InputStream inputStream = AppMain.class.getResourceAsStream("/jdbc.properties");
        Properties properties = new Properties();
        properties.load(inputStream);
        inputStream.close();

        String driver = properties.getProperty("jdbc.driver");
        String url = properties.getProperty("jdbc.url");
        String username = properties.getProperty("jdbc.username");
        String password = properties.getProperty("jdbc.pwd");

        Class.forName(driver);//加载数据库驱动
        Connection conn = DriverManager.getConnection(url, username, password);

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from arith_room_tbl limit 10");
        if (rs != null) {
            StringBuilder sb = new StringBuilder();
            while (rs.next()) {
                sb.append(rs.getString("id")).append(',');
                sb.append(rs.getString("battleType")).append(',');
                sb.append(rs.getString("createMs")).append(',');
                sb.append(rs.getString("count")).append(',');
                sb.append(rs.getString("name")).append(',');
                sb.append(rs.getString("status")).append(',');
                sb.append(rs.getString("creater")).append(',');
                sb.append(rs.getString("player")).append(',');
                sb.append('\n');
            }
            rs.close();
            System.out.println(sb);
        }
        stmt.close();
        conn.close();
    }
}
