package com.bjpowernode.service.impl;

import com.bjpowernode.domain.SysUser;
import com.bjpowernode.dao.UserDao;
import com.bjpowernode.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(SysUser user) {
        userDao.insertUser(user);
    }
}
