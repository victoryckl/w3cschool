package org.bjpowernode;

import com.bjpowernode.domain.SysUser;
import com.bjpowernode.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void test01() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService service = (UserService) ctx.getBean("userService");

        SysUser user = new SysUser();
        user.setName("张三");
        user.setAge(25);

        service.addUser(user);
    }
}
