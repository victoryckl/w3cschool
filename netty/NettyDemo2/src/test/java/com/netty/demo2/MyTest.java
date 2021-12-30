package com.netty.demo2;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MyTest {
    public static void main(String[] args) {
        Map<String, String> map = new ConcurrentHashMap<>();
        map.put("a", "aa");
        map.put("b", "bb");
        map.put("c", "cc");

        System.out.println(map);
        System.out.println("map.putIfAbsent(\"d\", \"dd\") return "+map.putIfAbsent("d", "dd"));
        System.out.println("map.putIfAbsent(\"a\", \"aaaa\") return "+map.putIfAbsent("a", "aaaa"));
        System.out.println(map);

        System.out.println("map.computeIfAbsent(\"e\", (key)->\"ee\") return "+map.computeIfAbsent("e", (key)->"ee"));
        System.out.println("map.computeIfAbsent(\"c\", (key)->\"cccc\") return " + map.computeIfAbsent("c", (key)->"cccc"));
        System.out.println(map);

        map.computeIfPresent("f", (key, old) -> "ff");
        map.computeIfPresent("b", (key, old) -> "bbbb");
        System.out.println(map);
    }
}
