package org.test.resolver;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.test.exception.MyException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {
        ModelAndView modelAndView = new ModelAndView();
        if (e instanceof MyException) {
            modelAndView.addObject("errorInfo", "自定义异常 222");
        } else if (e instanceof ClassCastException) {
            modelAndView.addObject("errorInfo", "类型转换错误 333");
        } else {
            modelAndView.addObject("errorInfo", e.getMessage());
        }
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
