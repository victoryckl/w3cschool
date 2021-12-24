package com.bjpowernode;

import com.bjpowernode.service.SomeService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void test01() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        SomeService service = (SomeService) ctx.getBean("someService");
        service.doSome("zhangsan", 34);
        String res = service.doOther();
        System.out.println(res);
    }

    @Test
    public void test02() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        SomeService service = (SomeService) ctx.getBean("someService");
        service.doSome2();
    }
}
