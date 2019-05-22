package com.wangwei.service;


import com.wangwei.bean.Account;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AccountService {
    Account login(Account account,Account lodAccount);
    void update(Account account);
    void updateByid(Account account);
    Account getByAccount(Account account);
    void add(Account account);
    //判断用户名是否存在
    Account isTrue(Account account);

    List<Account> getAll();
}
