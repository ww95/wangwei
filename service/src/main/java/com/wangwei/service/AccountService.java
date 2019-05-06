package com.wangwei.service;


import com.wangwei.bean.Account;

public interface AccountService {
    Account login(Account account,Account lodAccount);
    void update(Account account);
    Account getByCookie(String cookie);
    Account getByAccount(Account account);
    void add(Account account);
    //判断用户名是否存在
    Account isTrue(Account account);
}
