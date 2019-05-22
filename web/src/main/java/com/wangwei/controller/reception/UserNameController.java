package com.wangwei.controller.reception;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwei.bean.*;
import com.wangwei.global.PageNumber;
import com.wangwei.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/username/")
public class UserNameController {
    @Resource(name = "booksService")
    private BooksService booksService;

    @Resource(name = "buyBooksService")
    private BuyBooksService buyBooksService;

    @Resource(name = "collectionBooksService")
    private CollectionBooksService collectionBooksService;

    @Resource(name = "carBooksService")
    private CarBooksService carBooksService;

    @Resource(name = "accountService")
    private AccountService accountService;

    /**
     * 跳转到购买图书页面
     * @param map
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("toBuyBook")
    public String toBuyBook(Map<String,Object> map, @RequestParam Integer id,HttpServletRequest request){
        Books books = booksService.getById(id);
        Integer number = books.getbNumber();
//        System.out.println(number);
        if (number<=0){
            books.setbNumber(0);
            booksService.edit(books);
            map.put("msg","图书已买完");
            return "forward:"+request.getContextPath()+"/detail?bid="+id;
        }
//        System.out.println(number);
        map.put("order",System.currentTimeMillis());
        map.put("book",books);
        return "reception/buyBook";
    }

    /**
     * 购买图书
     * @param map
     * @param buyBook
     * @param session
     * @return
     */
    @RequestMapping("buyBook")
    public String buyBook(Map<String,Object> map,BuyBook buyBook,@RequestParam(required = false) Integer numbers, HttpSession session){
        //图书购买成功
        System.out.println(buyBook.toString());
        Books books = booksService.getById(buyBook.getBId());
        Account account = (Account) session.getAttribute("username");
        buyBook.setUser(account.getId());
        buyBooksService.add(buyBook);
        books.setbNumber(books.getbNumber()-buyBook.getNumber());
        booksService.edit(books);
        //删除购物车里面商品 如果没有就不会删除
        if (null==numbers){
            numbers = 0;
        }
        System.out.println(1==numbers);
        if (1==numbers){
            //购物车中
            carBooksService.removeOne1(books.getbId());
        }
        //收藏中间不删除 以及 从商品详情页不删除

        //返回首页
        map.put("msg","订单支付成功");
        return "forward:/index";
    }

    /**
     * 退出登录
     * @param request
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("username",null);
        return "redirect:/index";
    }

    /**
     * 收藏图书
     * @return
     */
    @RequestMapping("collecttion")
    public String collecttion(@RequestParam Integer id, HttpServletRequest  request){
        Account account = (Account) request.getSession().getAttribute("username");
        Integer usernameId = account.getId();
        CollectionBook collectionBook = new CollectionBook();
        collectionBook.setBooksId(id);
        collectionBook.setUserId(usernameId);
        collectionBooksService.add(collectionBook);
        return "redirect:/detail?bid="+id;
    }

    /**
     * 取消收藏
     * @param map
     * @return
     */
    @RequestMapping("recollecttion")
    private String recollecttion(Map<String,Object> map,@RequestParam Integer id,HttpServletRequest request,@RequestParam Integer bid){
        //根据id进行删除
        collectionBooksService.remove(id);
        return "redirect:/detail?bid="+bid;
    }
    @RequestMapping("recollecttionAll")
    private String recollecttionAll(Map<String,Object> map,HttpServletRequest request,@RequestParam Integer pageNum){
        String[] strings = request.getParameterValues("mobileos");
        for (String string: strings) {
            collectionBooksService.remove(Integer.parseInt(string));
        }
        return "redirect:"+request.getContextPath()+"/username/self-collection?pageNum="+pageNum;
    }

    @RequestMapping("addCar")
    public String addCar(Map<String,Object> map,@RequestParam Integer id,HttpServletRequest request){
//        carBooksService.add();
        Account account = (Account) request.getSession().getAttribute("username");
        Integer usernameId = account.getId();
        CarBooks carBooks = new CarBooks();
        carBooks.setUserid(usernameId);
        carBooks.setBooksid(id);
        carBooksService.add(carBooks);
        return "redirect:/detail?bid="+id;
    }

    /**
     * 清除购物车
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("reAddCarAll")
    public String reAddCarAll(Map<String,Object> map,@RequestParam Integer pageNum,HttpServletRequest request){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        String[] strings = request.getParameterValues("mobileos");
        for (String string:strings){
//            System.out.println(string);
            carBooksService.removeOne(Integer.parseInt(string));
        }
        return "redirect:self-car?pageNum="+pageNum;
    }

    @RequestMapping("reAddCar")
    public String reAddCar(Map<String,Object> map,@RequestParam Integer id,@RequestParam Integer carid,HttpServletRequest request){
        carBooksService.removeOne(carid);
        return "redirect:/detail?bid="+id;
    }
    /**
     * 跳转到个人详情页面
     * @param map
     * @return
     */
    @RequestMapping("self")
    private String self(Map<String,Object> map,HttpSession session,@RequestParam(required = false) Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum=1;
        }
        Account account = (Account) session.getAttribute("username");
        PageHelper.startPage(pageNum,PageNumber.NUMBER02);
        PageInfo pageInfo = PageInfo.of(buyBooksService.getByUserId(account.getId()));
        map.put("pageInfo",pageInfo);
        return "reception/username/index";
    }

    /**
     * 订单详情页
     * @param map
     * @param id
     * @return
     */
    @RequestMapping("self/detail")
    private String detial(Map<String,Object> map,@RequestParam Integer id,@RequestParam(required = false) Integer pageNum){
//        System.out.println(pageNum);
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        BuyBook buyBook = buyBooksService.getById(id);
        map.put("buyBook",buyBook);
        map.put("pageNum",pageNum);
        return "reception/username/detail";
    }

    /**
     * 跳转到购物车详情
     * @param map
     * @param id
     * @param pageNum
     * @param request
     * @return
     */
    @RequestMapping("self/detailCar")
    private String detailCar(Map<String,Object> map,@RequestParam Integer id,@RequestParam(required = false) Integer pageNum,HttpServletRequest request){
//        System.out.println(pageNum);
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        CarBooks carBooks = carBooksService.getById(id);
        map.put("carBook",carBooks);
        map.put("pageNum",pageNum);
        return "reception/username/detailCar";
    }

    /**
     * 跳转到收藏页面详情页
     * @param map
     * @param id
     * @param pageNum
     * @return
     */
    @RequestMapping("self/detailCollection")
    private String detailCollection(Map<String,Object> map,@RequestParam Integer id,@RequestParam(required = false) Integer pageNum){
//        System.out.println(pageNum);
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        CollectionBook collectionBook = collectionBooksService.getById(id);
        map.put("collectionBook",collectionBook);
        map.put("pageNum",pageNum);
        return "reception/username/detailCollection";
    }

    @RequestMapping("self/toEdit")
    private String toEdit(Map<String,Object> map,@RequestParam(required = false) Integer id,@RequestParam Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        BuyBook buyBook = buyBooksService.getById(id);
        map.put("pageNum",pageNum);
        map.put("buyBook",buyBook);
        return "reception/username/commit";
    }

    /**
     * 来控制页数
     * @param map
     * @param buyBook
     * @param pageNum
     * @return
     */
    @RequestMapping("self/edit")
    private String edit(Map<String,Object> map,BuyBook buyBook,@RequestParam Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
//        System.out.println(buyBook.toString());
        buyBooksService.edit(buyBook);
        return "redirect:../self?pageNum="+pageNum;
    }

    @RequestMapping("self/reminder")
    private String reminder(@RequestParam(required = false) Integer id,@RequestParam(required = false) Integer pageNum){
        if (null==id){
            return "";
        }
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        BuyBook buyBook = buyBooksService.getById(id);
        buyBook.setStatus(1);
        buyBooksService.edit(buyBook);
        return "redirect:../self?pageNum="+pageNum;
    }

    /**
     * 签收图书
     * @param id
     * @param pageNum
     * @return
     */
    @RequestMapping("self/sign")
    private String sign(@RequestParam(required = false) Integer id,@RequestParam(required = false) Integer pageNum){
        if (null==id){
            return "";
        }
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        BuyBook buyBook = buyBooksService.getById(id);
        buyBook.setStatus(3);
        buyBooksService.edit(buyBook);
        List<BuyBook> list = buyBooksService.getAll();
        for (BuyBook buyBook1: list
             ) {
//            System.out.println(buyBook1.toString());
        }
        return "redirect:../self?pageNum="+pageNum;
    }

    /**
     * 跳转用户个人页面
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("toInfoManage")
    private String toInfoManage(Map<String,Object> map,HttpServletRequest request){
        Account account = (Account) request.getSession().getAttribute("username");
        map.put("account",account);
        return "reception/username/userdetail";
    }

    /**
     * 跳转到用户修改密码
     * @param map
     * @param account
     * @param request
     * @return
     */
    @RequestMapping("toupdatePwd")
    private String toupdatePwd(Map<String,Object> map,Account account,HttpServletRequest request){
        return "reception/username/updatePassword";
    }

    /**
     * 修改用户信息
     * @param map
     * @param account
     * @param request
     * @return
     */
    @RequestMapping("updateInfo")
    private String updateInfo(Map<String,Object> map,Account account,HttpServletRequest request){
        accountService.update(account);
        request.getSession().setAttribute("username",account);
        return "redirect:self";
    }

    /**
     * 修改密码
     * @param map
     * @param account
     * @param newPassword
     * @param checkedPassword
     * @return
     */
    @RequestMapping("updatePwd")
    private String updatePwd(Map<String,Object> map,Account account, @RequestParam("newPassword")String newPassword, @RequestParam("checkedPassword")String checkedPassword){
        String regex = "[a-zA-Z0-9!@#$%^&*()]{5,12}";
        if(!newPassword.matches(regex)||!checkedPassword.matches(regex)){
            map.put("msg","输入格式不正确，请重新输入");
            return "forward:toupdatePwd";
        }
//        System.out.println(!newPassword.equals(checkedPassword));
        if (!newPassword.equals(checkedPassword)){
            map.put("msg","密码是输入不一致，请重新输入");
            return "forward:toupdatePwd";
        }
        if (newPassword.equals(account.getPassword())){
            map.put("msg","新密码和原密码一致，请重新输入！！！");
            return "forward:toupdatePwd";
        }
        Account a = accountService.getByAccount(account);
        if(!a.getPassword().equals(account.getPassword())){
            map.put("msg","原密码输入错误，请重新输入");
            return "forward:toupdatePwd";
        }
        account.setPassword(newPassword);
        accountService.update(account);
        return "redirect:self";
    }

    /**
     * 跳转到个人购物车
     * @param map
     * @param request
     * @param pageNum
     * @return
     */
    @RequestMapping("self-car")
    private String selfCar(Map<String,Object> map,HttpServletRequest request,@RequestParam(required = false) Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
//        System.out.println("haha");
        Account account = (Account) request.getSession().getAttribute("username");
        PageHelper.startPage(pageNum, PageNumber.NUMBER03);
        PageInfo pageInfo = PageInfo.of(carBooksService.getAll(account.getId()));
        map.put("pageInfo",pageInfo);
        return "reception/username/indexCar";
    }

    /**
     * 跳转到个人收藏
     * @param map
     * @param request
     * @param pageNum
     * @return
     */
    @RequestMapping("self-collection")
    private String selfCollection(Map<String,Object> map,HttpServletRequest request,@RequestParam(required = false) Integer pageNum){
        if (null==pageNum||pageNum==0){
            pageNum = 1;
        }
        Account account = (Account) request.getSession().getAttribute("username");
        PageHelper.startPage(pageNum,PageNumber.NUMBER03);
        PageInfo pageInfo = PageInfo.of(collectionBooksService.getAll(account.getId()));
        map.put("pageInfo",pageInfo);
        return "reception/username/indexCollection";
    }

    /**
     * 忘记密码 跳转到指定页面
     * 如果是在登录页面忘记密码 不需要显示用户名
     * 如果是在登录之后忘记密码 则显示用户名
     */
    @RequestMapping("toForgetPwd")
    public String toForgetPwd(Map<String,Object> map,HttpSession session){
//        Account account = null;
//        account = (Account) session.getAttribute("username");
//        map.put("username",account);
        return "reception/username/forgetPassword";
    }

    /**
     * 修改密码
     */
    @RequestMapping("forgetPwd")
    public String forgetPwd(Map<String,Object> map,Account account){
        /**
         * 判断用户名是否存在
         */
        Account account1 = accountService.isTrue(account);
        if (account1==null){
            map.put("flag",1);
            map.put("msg","用户名不存在，请重新输入！！！");
            return "forward:toForgetPwd";
        }
        accountService.update(account);
        map.put("msg","用户名密码修改成功");
        return "forward:toForgetPwd";
    }

    @RequestMapping("toBuyCar")
    public String toBuyCar(Map<String,Object> map, @RequestParam Integer id,@RequestParam(required = false) Integer pageNum, HttpServletRequest request){
        if (null==pageNum||0==pageNum){
            pageNum = 1;
        }
        //获取购物车东西
        CarBooks carBooks = carBooksService.getById(id);
        //获取商品
        Books books = booksService.getById(carBooks.getBooksid());
        //
        Integer number = books.getbNumber();
//        System.out.println(number);
        if (number<=0){
            books.setbNumber(0);
            booksService.edit(books);
            map.put("msg","图书已买完");
            return "forward:self-car?pageNum="+pageNum;
        }
//        System.out.println(number);
        map.put("order",System.currentTimeMillis());
        map.put("book",books);
        map.put("number",1);
        return "reception/buyBook";
    }

    @RequestMapping("toBuyCollection")
    public String toBuyCollection(Map<String,Object> map, @RequestParam Integer id,@RequestParam(required = false) Integer pageNum, HttpServletRequest request){
        if (null==pageNum||0==pageNum){
            pageNum = 1;
        }
        //获取购物车东西
        CollectionBook collectionBook = collectionBooksService.getById(id);
        //获取商品
        Books books = booksService.getById(collectionBook.getBooksId());
        Integer number = books.getbNumber();
//        System.out.println(number);
        if (number<=0){
            books.setbNumber(0);
            booksService.edit(books);
            map.put("msg","图书已买完");
            return "forward:self-car?pageNum="+pageNum;
        }
//        System.out.println(number);
        map.put("order",System.currentTimeMillis());
        map.put("book",books);
        return "reception/buyBook";
    }
}
