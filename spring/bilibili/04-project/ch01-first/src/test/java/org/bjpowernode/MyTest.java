package org.bjpowernode;

import org.bjpowernode.service.SomeService;
import org.bjpowernode.service.impl.SomeServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    @Test
    public void test01() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
        SomeService service = (SomeService) ctx.getBean("someService");
        service.doSome();
    }
}
