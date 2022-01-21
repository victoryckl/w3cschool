package org.test.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.test.domain.Account;
import org.test.mapper.AccountMapper;
import org.test.service.AccountService;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public String save(Account account) {

        QueryWrapper<Account> wrapper = new QueryWrapper<>();
        wrapper.eq("name", account.getName());

        Account a2 = accountMapper.selectOne(wrapper);
        if (a2 != null) {
            return "账户已存在";
        }

        accountMapper.save(account);
        return "保存成功";
    }

    @Override
    public List<Account> findAll()
    {
        return accountMapper.findAll();
    }

    @Override
    public String transfer(String from, String to, double amount) {
        if (from == null || from.isEmpty()
                || to == null || to.isEmpty()
                || amount <= 0) {
            return "参数错误";
        }

        QueryWrapper<Account> wrapper = new QueryWrapper<>();
        wrapper.eq("name", from);
        Account fromAccount = accountMapper.selectOne(wrapper);
        if (fromAccount == null) {
            return "账户不存在："+from;
        }
        if (fromAccount.getMoney() < amount) {
            return "账户金额不足："+from;
        }

        QueryWrapper<Account> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("name", to);
        Account toAccount = accountMapper.selectOne(wrapper2);
        if (toAccount == null) {
            return "账户不存在："+to;
        }

        //转出
        Account fAccount = new Account();
        fAccount.setId(fromAccount.getId());
        fAccount.setMoney(fromAccount.getMoney() - amount);
        accountMapper.updateById(fAccount);

        int i = 1/0;//制造异常，测试事务是否回滚

        //转入
        Account tAccount = new Account();
        tAccount.setId(toAccount.getId());
        tAccount.setMoney(toAccount.getMoney()+amount);
        accountMapper.updateById(tAccount);

        return null;
    }

}
