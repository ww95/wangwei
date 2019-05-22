package com.wangwei.dao;

import com.wangwei.bean.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("accountDao")
public interface AccountDao {
    //查询用户登录
    Account selectByAccount(Account account);
    //更新个人信息
    void update(Account account);
    void updateByid(Account account);

    //根据所有用户
    List<Account> selectAll();

    //根据id查询
    Account selectById(Integer id);

    void insert(Account account);
}
