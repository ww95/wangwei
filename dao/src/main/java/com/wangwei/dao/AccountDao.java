package com.wangwei.dao;

import com.wangwei.bean.Account;
import org.springframework.stereotype.Repository;

@Repository("accountDao")
public interface AccountDao {
    //查询用户登录
    Account selectByAccount(Account account);
    //更新个人信息
    void update(Account account);

    //根据cookie信息查询信息
    Account selectByCookie(String cookie);

    //根据id查询
    Account selectById(Integer id);

    void insert(Account account);
}
