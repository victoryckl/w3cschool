package com.bjpowernode.service.impl;

import com.bjpowernode.service.SomeService;

public class SomeServiceImpl implements SomeService {
    @Override
    public void doSome(String name, Integer age) {
        System.out.println("执行业务方法doSome()");
    }

    @Override
    public String doOther() {
        System.out.println("执行业务方法 doOther");
        return "abcd";
    }

    @Override
    public String doSome2() {
        System.out.println("执行业务方法 doSome2");
        return "good";
    }


}
