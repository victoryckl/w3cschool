package com.bjpowernode.handle;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import java.util.Date;

@Aspect
public class MyAspect {

    @Before(value = "execution(public void com.bjpowernode.service.impl.SomeServiceImpl.doSome(String, Integer))")
    public void myBefore1() {
        System.out.println("前置通知 myBefore1 "+new Date()+" ====================");
    }

    @Before(value = "execution(* *..SomeServiceImpl.do*(..))")
    public void myBefore2(JoinPoint jp) {
        System.out.println("前置通知 myBefore2 "+new Date()+" ====================");

        Object[] args = jp.getArgs();
        for (Object obj:args) {
            System.out.println("获取方法参数： "+obj);
        }
        System.out.println(jp.getSignature());
        System.out.println(jp.getSignature().getName());
    }

    @AfterReturning(value = "execution(* *..SomeServiceImpl.doOther(..))", returning = "res")
    public void myAfterReturning1(Object res) {
        System.out.println("后置通知 myAfterReturning1 "+res);
    }
}
