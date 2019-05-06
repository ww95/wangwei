package com.wangwei.controller.reception;

import com.wangwei.bean.*;
import com.wangwei.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class FrontEndController {

    @Resource(name = "catalogService")
    private CatalogService catalogService;

    @Resource(name = "booksService")
    private BooksService booksService;

    @Resource(name = "accountService")
    private AccountService accountService;

    @Resource(name = "collectionBooksService")
    private CollectionBooksService collectionBooksService;

    @Resource(name = "carBooksService")
    private CarBooksService carBooksService;

    @Resource(name = "buyBooksService")
    private BuyBooksService buyBooksService;
    /**
     * 首页相应功能
     * @param map
     * @return
     */
    @RequestMapping("index")
    public String index(Map<String,Object> map){
        List<Books> books = booksService.getAll();
        map.put("hot",books.get(books.size()/2));
        Catalog catalog = catalogService.getRoot();
        map.put("root",catalog);
        map.put("books",books.subList(0,5));
        map.put("renqi",books.subList(5,10));
        map.put("xiaoshou",books.subList(10,15));
//        System.out.println(books.subList(5,10).toString());
//        System.out.println(books.subList(10,15).toString());
        return "reception/index";
    }

    /**
     * 跳转到登录页面
     * @param map
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(Map<String,Object> map){
        //获取root根节点
        List<Books> books = booksService.getAll();
        //获取root根节点
        map.put("hot",books.get(books.size()/2));
        map.put("root",catalogService.getRoot());
        return "reception/login";
    }

    /**
     * 登录功能
     * @param map
     * @param account
     * @return
     */
    @RequestMapping("login")
    public String login(Map<String,Object> map, Account account, HttpSession session){
//        System.out.println(account);
        //查询用户名
        Account account1 = accountService.isTrue(account);
        if(account1==null){
            //表示登录成功
            map.put("msg","用户名不存在，请注册用户名");
            return "forward:toLogin";
        }
        //将查询和原来密码进行对比
        Account trueAcount =  accountService.login(account1,account);
        if (trueAcount==null){
            map.put("msg","用户名或密码错误");
            return "forward:toLogin";
        }
        session.setAttribute("username",account1);
        return "redirect:index";
    }

    /**
     * 跳转注册页面
     * @param map
     * @return
     */
    @RequestMapping("toRegister")
    public String register(Map<String,Object> map){
        List<Books> books = booksService.getAll();
        //获取root根节点
        map.put("hot",books.get(books.size()/2));
        map.put("root",catalogService.getRoot());
        return "reception/register";
    }
    /**
     * 注册功能
     * @param map
     * @param account
     * @return
     */
    @RequestMapping("register")
    public String register(Map<String,Object> map, Account account){
        //获取root根节点
//        System.out.println(account.toString());

        /**
         * 检查用户名是否存在
         */
        Account account1 = accountService.isTrue(account);
        if (account1!=null){
            map.put("msg","用户名已存在，请重新输入");
            return "forward:toRegister";
        }
        accountService.add(account);
        return "reception/login";
    }

    /**
     * 这是商品详情页
     * @param map
     * @param bid
     * @return
     */
    @RequestMapping("detail")
    public String detail(Map<String,Object> map, @RequestParam Integer bid, HttpServletRequest request){
        Integer length = booksService.getAll().size();
        map.put("booksDemo",booksService.getAll().subList(length-6,length-1));
        System.out.println(booksService.getById(bid).toString());
        map.put("book",booksService.getById(bid));
        map.put("bookInfo",buyBooksService.getByBookId(bid));
        map.put("root",catalogService.getRoot());
        Account account = (Account) request.getSession().getAttribute("username");
        if (account!=null){
            CollectionBook collectionBook = new CollectionBook();
            collectionBook.setBooksId(bid);
            collectionBook.setUserId(account.getId());
            CarBooks carBooks = new CarBooks();
            carBooks.setUserid(account.getId());
            carBooks.setBooksid(bid);
            System.out.println(collectionBook.toString());
            System.out.println(carBooks.toString());
            map.put("carBook",carBooksService.getOne(carBooks));
            map.put("collection",collectionBooksService.getOne(collectionBook));
        }
        return "reception/single";
    }

    /**
     * 搜索功能
     * 根据作者名称或图书名称来进行搜索
     */
    @RequestMapping("sreach")
    private String sreach(Map<String,Object> map,@RequestParam(required = false) String search){
        if (null==search||"".equals(search.trim())){
            search = "";
        }
//        System.out.println(search);
        List<Books> list = booksService.sreachBooks(search);
        map.put("lists",list);
        List<Books> books = booksService.getAll();
        map.put("hot",books.get(books.size()/2));
        map.put("root",catalogService.getRoot());
        map.put("search",search);
        return "reception/books_list";
    }

    /**
     * 根据分类查询图书
     * @param map
     * @return
     */
    @RequestMapping("sreachByType")
    private String sreachByType(Map<String,Object> map,@RequestParam(required = false) Integer id){
        map.put("lists",booksService.getByType(id));
        List<Books> books = booksService.getAll();
        map.put("hot",books.get(books.size()/2));
        map.put("root",catalogService.getRoot());
        return "reception/books_list";
    }

    @RequestMapping("getBooksAll")
    private String getBooksAll(Map<String,Object> map){
        map.put("lists",booksService.getAll());
        List<Books> books = booksService.getAll();
        map.put("hot",books.get(books.size()/2));
        map.put("root",catalogService.getRoot());
        return "reception/books_list";
    }

    /**
     * 登录页面出现忘记密码
     * @param map
     * @param flag
     * @param session
     * @return
     */
    @RequestMapping("toForgetPwd")
    public String toForgetPwd(Map<String,Object> map,@RequestParam(required = false) Integer flag,HttpSession session){
        //flag默认是1
        if (flag==null){
            flag = 0;
        }
        Account account = null;
        if (flag==0){

        }else{
            account = (Account) session.getAttribute("username");
        }
        map.put("account",account);
        return "reception/forgetPassword";
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
        if (account==null){
            map.put("msg","用户名不存在，请注册用户");
            return "forward:toForgetPwd";
        }
        //存在就修改密码
        accountService.update(account);
        //查询用户名在登录页面
        map.put("account",accountService.isTrue(account));
        return "forward:toLogin";
    }
}
