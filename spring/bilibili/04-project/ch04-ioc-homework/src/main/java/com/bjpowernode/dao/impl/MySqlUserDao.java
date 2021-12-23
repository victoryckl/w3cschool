package com.bjpowernode.dao.impl;

import com.bjpowernode.domain.SysUser;
import com.bjpowernode.dao.UserDao;
import org.springframework.stereotype.Repository;

@Repository("mysqlDao")
public class MySqlUserDao implements UserDao {
    @Override
    public void insertUser(SysUser user) {
        System.out.println("执行了MySqlUserDao.insertUser() "+user);
    }
}
