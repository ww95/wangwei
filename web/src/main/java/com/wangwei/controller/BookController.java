package com.wangwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwei.bean.Books;
import com.wangwei.global.PageNumber;
import com.wangwei.service.BooksService;
import com.wangwei.service.CatalogService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/admin")
public class BookController {
    @Resource(name = "booksService")
    private BooksService booksService;

    @Resource(name = "catalogService")
    private CatalogService catalogService;

    @RequestMapping("/books-list")
    public String list(Map<String,Object> map, @RequestParam(value = "pageNum",required = false) Integer page){
        if(page==null||page==0){
            page=1;
        }
        PageHelper.startPage(page, PageNumber.NUMBER04);
        PageInfo pageInfo = PageInfo.of(booksService.getAll());
        map.put("pageInfo", pageInfo);
        return "admin/book_list";
    }
    @RequestMapping("/books-toAddNumber")
    public String toAddNumber(Map<String,Object> map, @RequestParam(required = false) Integer pageNum,@RequestParam Integer id){
        if(pageNum==null||pageNum==0){
            pageNum=1;
        }
        map.put("book",booksService.getById(id));
        map.put("pageNum",pageNum);
        return "admin/book_addNumber";
    }

    /**
     * 进过
     * @param map
     * @param books
     * @param pageNum
     * @return
     */
    @RequestMapping("/books-addNumber")
    public String addNumber(Map<String,Object> map,Books books,@RequestParam(required = false) Integer pageNum){
        if(pageNum==null||pageNum==0){
            pageNum=1;
        }
        System.out.println(books.toString());
        //先将库存信息和进货量相加
        Books b = booksService.getById(books.getbId());
        books.setbNumber(b.getbNumber()+books.getbNumber());
        books.setNumber(b.getNumber()+books.getbNumber());
        //计算总价
        books.setTotalJinhuo(books.getbNumber()*b.getbPrice());
        booksService.edit(books);
        return "redirect:books-list?pageNum="+pageNum;
    }
    @RequestMapping("/books-detail")
    public String detail(@RequestParam(value = "id")Integer id,Map<String,Object> map,@RequestParam Integer pageNum){
        map.put("book",booksService.getById(id));
        map.put("pageNum",pageNum);
        return "admin/book_detail";
    }

    @RequestMapping("/books-remove")
    public String remove(HttpServletRequest request,@RequestParam Integer pageNum){
        String[] strings = request.getParameterValues("mobileos");
        List<Integer> list = new ArrayList<Integer>();
        for (String s: strings) {
            list.add(Integer.parseInt(s));
        }
        booksService.remove(list);
        return "redirect:books-list?pageNum="+pageNum;
    }

    /**
     * 跳转到修改页面
     * @param id
     * @param map
     * @param pageNum
     * @return
     */
    @RequestMapping("/books-toEdit")
    public String toEdit(@RequestParam(value = "id")Integer id,Map<String,Object> map,@RequestParam Integer pageNum){
        map.put("root",catalogService.getRoot());
        map.put("book",booksService.getById(id));
        map.put("pageNum",pageNum);
        return "admin/book_edit";
    }

    /**
     * 修改图书信息
     * @param request
     * @return
     * @throws FileUploadException
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/books-edit")
    public String edit(HttpServletRequest request) throws FileUploadException, UnsupportedEncodingException {
        Books books = null;
//        FileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        List<FileItem> list = upload.parseRequest(request);
//        int pageNum = 0;
//        for(FileItem item:list) {
//            if (item.isFormField()) {
//                if (item.getFieldName().equals("pageNum")) {
//                    pageNum = Integer.parseInt(item.getString("UTF-8"));
//                }
//            }
//        }
        try {
            books = this.builderBooks(request);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        System.out.println(books.toString());
        booksService.edit(books);
        return "redirect:books-list";
    }

    /**
     * 图书第一次上架
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/books-add")
    public String add(HttpServletRequest request,Map<String,Object> map){
        Books books = null;
        try {
            books = this.builderBooks(request);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
//        System.out.println(books.toString());
        //计算总价
        books.setTotalJinhuo(books.getbNumber()* books.getbPrice());
        booksService.add(books);
        return "redirect:books-list";
    }
    @RequestMapping("/books-toAdd")
    public String toAdd(Map<String,Object> map){
        map.put("root",catalogService.getRoot());
        return "admin/book_add";
    }
    private Books builderBooks(HttpServletRequest request) throws FileUploadException, IOException {
        Books books = new Books();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> list = upload.parseRequest(request);
        for(FileItem item:list){
            if(item.isFormField()){
                if(item.getFieldName().equals("bName")){
                    books.setbName(item.getString("UTF-8"));
                }
                if(item.getFieldName().equals("bCreate")){
                    books.setbCreate(item.getString("UTF-8"));
                }
                if(item.getFieldName().equals("bInfo")){
                    books.setbInfo(item.getString("UTF-8"));
                }
                if(item.getFieldName().equals("bNumber")){
                    books.setbNumber(Integer.parseInt(item.getString("UTF-8")));
                    books.setNumber(Integer.parseInt(item.getString("UTF-8")));
                }
                if(item.getFieldName().equals("bType")){
                    books.setbType(Integer.parseInt(item.getString("UTF-8")));
                }
                if(item.getFieldName().equals("bPrice")){
                    books.setbPrice(Double.parseDouble(item.getString("UTF-8")));
                }
                if(item.getFieldName().equals("bId")){
                    books.setbId(Integer.parseInt(item.getString("UTF-8")));
                }
                if(item.getFieldName().equals("imagePath")&&books.getbPath()==null){
                    books.setbPath(item.getString("UTF-8"));
                }
                if(item.getFieldName().equals("jinhuo")){
                    books.setJinhuo(Double.parseDouble(item.getString("UTF-8")));
                }
                if(item.getFieldName().equals("zhekou")){
                    books.setZhekou(Double.parseDouble(item.getString("UTF-8")));
                }
            }else{
                if(item.getFieldName().equals("bPath")){
                    if(item.getSize()<=100) continue;
                    //获取项目的绝对路径
                    String rootPath = request.getServletContext().getRealPath("/");
                    String path = item.getName();
                    String type = ".jpg";
                    if(path.indexOf(".")!=-1){
                        type = path.substring(path.lastIndexOf("."));
                    }
                    path = "/download/images/"+System.currentTimeMillis()+type;
                    InputStream inputStream = item.getInputStream();
                    FileOutputStream fileOutputStream = new FileOutputStream(rootPath+path);
                    int len=0;
                    byte[] b = new byte[1024*1024];
                    while ((len=inputStream.read(b))!=-1){
                        fileOutputStream.write(b,0,len);
                    }
                    books.setbPath(path);
                }
            }
        }
        return books;
    }
}
