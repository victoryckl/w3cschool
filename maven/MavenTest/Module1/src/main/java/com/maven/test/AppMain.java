package com.maven.test;

import java.io.*;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class AppMain {
    public static void main(String[] args) throws IOException {
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
    }
}
