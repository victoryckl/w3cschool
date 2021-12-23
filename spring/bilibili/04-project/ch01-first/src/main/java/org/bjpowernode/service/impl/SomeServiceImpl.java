package org.bjpowernode.service.impl;

import org.bjpowernode.service.SomeService;

public class SomeServiceImpl implements SomeService {

    public SomeServiceImpl() {
        System.out.println("构造方法 SomeServiceImpl");
    }

    @Override
    public void doSome() {
        System.out.println("执行了doSome方法");
    }
}
