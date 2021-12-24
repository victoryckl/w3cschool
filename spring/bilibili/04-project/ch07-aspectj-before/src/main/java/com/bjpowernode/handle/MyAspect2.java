package com.bjpowernode.handle;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import java.util.stream.Stream;

@Aspect
public class MyAspect2 {
    @Around(value = "execution(* *..SomeServiceImpl.doSome2(..))")
    public Object around2(ProceedingJoinPoint pjp) throws Throwable {
        System.out.println("around2 method=" + pjp.getSignature());
        Stream.of(new Throwable().getStackTrace()).forEach(System.out::println);
        System.out.println("=======================================================");
        Object result = pjp.proceed(pjp.getArgs());

        return result;
    }

    @Around(value = "execution(* *..SomeServiceImpl.doSome2(..))")
    public Object around3(ProceedingJoinPoint pjp) throws Throwable {
        System.out.println("around3 method=" + pjp.getSignature());
        Stream.of(new Throwable().getStackTrace()).forEach(System.out::println);



        Object result = pjp.proceed(pjp.getArgs());

        return result;
    }
}
