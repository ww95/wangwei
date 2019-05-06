package com.wangwei.service.impl;

import com.wangwei.bean.Account;
import com.wangwei.dao.AccountDao;
import com.wangwei.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource(name = "accountDao")
    private AccountDao accountDao;
    //用户登录
    public Account login(Account account,Account lodAccount) {
        if (!lodAccount.getPassword().equals(account.getPassword())){
            //用户名和密码不正确
            return null;
        }

        //用户信息为真
        return account;
    }

    public void update(Account account) {
        accountDao.update(account);
    }

    public Account getByCookie(String cookie) {
        return accountDao.selectByCookie(cookie);
    }

    public Account getByAccount(Account account) {
        return accountDao.selectByAccount(account);
    }

    public void add(Account account) {
        accountDao.insert(account);
    }

    //判断用户名是否为空
    public Account isTrue(Account account) {
        return accountDao.selectByAccount(account);
    }
}
