package com.bjpowernode;

import com.bjpowernode.dao.StudentDao;
import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
    @Test
    public void test01() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        String names[] = ctx.getBeanDefinitionNames();
        for (String name : names) {
            System.out.println("容器对象名称："+name+", "+ctx.getBean(name));
        }
    }

    @Test
    public void test02() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentDao studentDao = (StudentDao) ctx.getBean("studentDao");

        Student stu = new Student();
        stu.setName("李四");
        stu.setAge(25);
        studentDao.insertStudent(stu);
    }

    @Test
    public void Test03() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService studentService = (StudentService) ctx.getBean("studentService");

        Student stu = new Student();
        stu.setName("王五");
        stu.setAge(27);
        studentService.addStudent(stu);
    }

    @Test
    public void test04() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = (StudentService) ctx.getBean("studentService");

        List<Student> students = service.queryStudent();
        System.out.println(students);
    }
}
