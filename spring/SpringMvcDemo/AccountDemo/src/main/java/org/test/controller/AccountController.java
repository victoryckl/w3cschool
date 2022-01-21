package org.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.test.domain.Account;
import org.test.exception.MyException;
import org.test.service.AccountService;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/save")
    @ResponseBody
    public String save(Account account) {
        return accountService.save(account);
    }

    @RequestMapping("/list")
    public ModelAndView findAll() {
        List<Account> list = accountService.findAll();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("accountList", list);
        modelAndView.setViewName("accountList");
        return modelAndView;
    }

    @RequestMapping("/transfer")
    public ModelAndView transfer(String from, String to, double amount) {
        ModelAndView modelAndView = new ModelAndView();

        String result = accountService.transfer(from, to, amount);
        if (result != null) {//失败
            modelAndView.addObject("errorInfo", result);
            modelAndView.setViewName("error");
        } else { //成功
            modelAndView.setViewName("redirect:/account/list");
        }
        return modelAndView;
    }

    @RequestMapping("/ex/my")
    public String exceptionMy() {
        throw new MyException("自定义错误哈哈哈");
    }

    @RequestMapping("/ex/cast")
    public String exceptionCast() {
        Object obj = new MyException("xxx");
        String x = (String)obj;
        return null;
    }
}
