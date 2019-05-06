package com.wangwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwei.bean.Account;
import com.wangwei.bean.Books;
import com.wangwei.bean.BuyBook;
import com.wangwei.global.PageNumber;
import com.wangwei.service.AccountService;
import com.wangwei.service.BooksService;
import com.wangwei.service.BuyBooksService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 这个是后台管理员更新自己信息
 */
@Controller
@RequestMapping("/backstage/admin")
public class AdminController {
    @Resource(name = "accountService")
    private AccountService accountService;

    @Resource(name = "buyBooksService")
    private BuyBooksService buyBooksService;

    @Resource(name = "booksService")
    private BooksService booksService;

    /**
     * 跳转到修改个人信息页面
     * @return
     */
    @RequestMapping("/update-self")
    public String self(){
        return "admin/admin_detail";
    }

    /**
     * 用户修改个人信息
     * @param account
     * @param session
     * @return
     */
    @RequestMapping("/update-data")
    public String data(Account account,HttpSession session){
        accountService.update(account);
        session.setAttribute("account",accountService.getByAccount(account));
        return "redirect:/backstage/admin/books-list";
    }

    /**
     * 跳转到修改页面
     * @return
     */
    @RequestMapping("/update-password")
    public String password(){
        return "admin/updatePassword";
    }

    /**
     * 用户修改密码
     * @param account
     * @param newPassword
     * @param checkedPassword
     * @param map
     * @return
     */
    @RequestMapping("/update-change-password")
    public String changePassword(Account account, @RequestParam("newPassword")String newPassword, @RequestParam("checkedPassword")String checkedPassword, Map<String,Object> map){
        String regex = "[a-zA-Z0-9!@#$%^&*()]{5,12}";
        if(!newPassword.matches(regex)||!checkedPassword.matches(regex)){
            map.put("msg","输入格式不正确，请重新输入");
            return "forward:update-password";
        }
        System.out.println(!newPassword.equals(checkedPassword));
        if (!newPassword.equals(checkedPassword)){
            map.put("msg","密码是输入不一致，请重新输入");
            return "forward:update-password";
        }
        Account a = accountService.getByAccount(account);
        if(!a.getPassword().equals(account.getPassword())){
            map.put("msg","原密码输入错误，请重新输入");
            return "forward:update-password";
        }
        account.setPassword(newPassword);
        accountService.update(account);
        return "redirect:/backstage/admin/books-list";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.setAttribute("account",null);
        return "forward:/backstage/toLogin";
    }

    /**
     * 管理员中的订单管理
     * @param map
     * @return
     */
    @RequestMapping("/order")
    private String order(Map<String,Object> map,@RequestParam(required = false) Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, PageNumber.NUMBER02);
        /**
         * 获取已支付成功订单
         */
        List<BuyBook> list = buyBooksService.getSuccess();
        PageInfo pageInfo = PageInfo.of(list);
        map.put("pageInfo",pageInfo);
        return "admin/order_list";
    }
    @RequestMapping("/order-manage")
    private String manage(Map<String,Object> map,BuyBook buyBook,@RequestParam(required = false) Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        buyBooksService.edit(buyBook);
        map.put("pageNum",pageNum);
        return "forward:order";
    }
    @RequestMapping("/buyBooks/detail")
    private String buyBooksDetail(Map<String,Object> map,BuyBook buyBook,@RequestParam(required = false) Integer id){
        System.out.println(buyBooksService.getById(id).toString());
        map.put("buyBook",buyBooksService.getById(id));
        return "admin/buy_book_detail";
    }

    /**
     * 查看盈利情况
     * @param map
     * @return
     */
    @RequestMapping("/self-all")
    public String selfAll(Map<String,Object> map,@RequestParam(required = false) Integer pageNum){
        if (pageNum==null||pageNum==0){
            pageNum = 1;
        }
        System.out.println(pageNum);
        List<BuyBook> buyBookList = buyBooksService.getAllByGroup();
        PageHelper.startPage(pageNum,10);
        PageInfo pageInfo = PageInfo.of(booksService.getAll());
        map.put("pageInfo",pageInfo);
        map.put("buyBookList",buyBookList);
        Integer sale=buyBooksService.selectSale();
        Integer Stock=booksService.selectStock();
        map.put("sale",sale);
        map.put("Stock",Stock);
        return "admin/data_list";
    }
}
