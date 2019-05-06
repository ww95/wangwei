package com.wangwei.controller;

import com.wangwei.bean.Account;
import com.wangwei.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 这是后台没登录操作
 */
@Controller
@RequestMapping("/backstage")
public class DefaultAdminController {

    @Resource(name = "accountService")
    private AccountService accountService;

    /**
     * 退出功能
     * @param account
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/login")
    public String login(Account account, HttpSession session,Map<String,Object> map){
        System.out.println(account);
        Account a = accountService.isTrue(account);
        if(a!=null){
            //登录成功
            if (accountService.login(a,account)!=null){
                session.setAttribute("account",a);
                System.out.println("登录成功"+a.getAccount());
                return "redirect:/backstage/admin/books-list";
            }else{
                map.put("msg","用户名或密码不正确");
                return "forward:toLogin";
            }
        }else{
            map.put("msg","用户名不存在");
            return "forward:toLogin";
        }

    }
    @RequestMapping("/toLogin")
    public String toLogin(Account account, HttpSession session){
        return "/admin/login";
    }
}
