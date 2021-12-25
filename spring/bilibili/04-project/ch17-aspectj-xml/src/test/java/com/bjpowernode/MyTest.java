package com.bjpowernode;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void test01() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        BuyGoodsService service = (BuyGoodsService) ctx.getBean("buyService");

        service.buy(1001, 10);
    }
}
