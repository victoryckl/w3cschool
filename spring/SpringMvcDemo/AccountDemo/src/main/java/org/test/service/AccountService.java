package org.test.service;

import org.test.domain.Account;

import java.util.List;

public interface AccountService {
    String save(Account account);
    List<Account> findAll();

    String transfer(String from, String to, double amount);
}
