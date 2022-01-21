package org.test.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.test.domain.Account;

import java.util.List;

public interface AccountMapper extends BaseMapper<Account> {
    void save(Account account);
    List<Account> findAll();
}
