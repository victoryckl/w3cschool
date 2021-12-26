package com.bjpowernode.controller;

import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QueryStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stuid = request.getParameter("stuid");


        //在代码中创建ApplicationContext的缺点：每次Http请求都会重复创建
        //ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-beans.xml");
        //使用监听器已经创建好的spring容器对象，从ServletContext中获取
        //Object attr = getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        //if (attr == null) {
        //    System.err.println("get spring context failed");
        //    return;
        //}
        //ApplicationContext ctx = (ApplicationContext) attr;

        //使用spring提供的方法获取
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        
        System.out.println("在servlet中创建的容器对象==="+ctx);

        StudentService service = (StudentService) ctx.getBean("studentService");

        Student student = service.findStudentById(Integer.valueOf(stuid));

        System.out.println("student===" + student);
        System.out.println("servlet request="+request);//这里打印出页面request对象
        request.setAttribute("stu", student);
        request.getRequestDispatcher("/show.jsp").forward(request, response);
    }
}
