package com.bjpowernode.controller;

import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strName = request.getParameter("name");
        String strAge = request.getParameter("age");

        //在代码中创建ApplicationContext的缺点：每次Http请求都会重复创建
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-beans.xml");
        System.out.println("在servlet中创建的容器对象==="+ctx);
        StudentService service = (StudentService) ctx.getBean("studentService");

        Student student = new Student();
        student.setStuname(strName);
        student.setStuage(Integer.valueOf(strAge));

        service.addStudent(student);

        request.getRequestDispatcher("/show.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
