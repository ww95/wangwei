package com.wangwei.controller;

import com.wangwei.bean.Catalog;
import com.wangwei.service.BooksService;
import com.wangwei.service.CatalogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 分类控制器
 */
@Controller
@RequestMapping("/backstage/admin")
public class CatalogController {
    @Resource(name = "catalogService")
    private CatalogService catalogService;

    @Resource(name = "booksService")
    private BooksService booksService;

    @RequestMapping("/catalog-list")
    public String list(Map<String, Object> map) {
        map.put("root", catalogService.getRoot());
        return "admin/catalog_list";
    }

    @RequestMapping("/catalog-toAdd")
    public String toAdd(Map<String, Object> map) {
        map.put("root", catalogService.getRoot());
        return "admin/catalog_add";
    }

    @RequestMapping("/catalog-add")
    public String add(Map<String, Object> map, HttpServletRequest request) {
        List<Catalog> list = new ArrayList<Catalog>();
        String[] titles = request.getParameterValues("title");
        String[] pids = request.getParameterValues("pid");
        String[] infos = request.getParameterValues("info");
        for (int i = 0; i < titles.length; i++) {
            Catalog catalog = new Catalog();
            catalog.setTitle(titles[i]);
            catalog.setInfo(infos[i]);
            catalog.setPid(Integer.parseInt(pids[i]));
            list.add(catalog);
        }
        catalogService.add(list);
        return "redirect:catalog-list";
    }

    @RequestMapping("/catalog-remove")
    public String remove(HttpServletRequest request){
        String[] ids = request.getParameterValues("id");
        List<Integer> list = new ArrayList<Integer>();
        for (String id:ids) {
            list.add(Integer.parseInt(id));
        }
        /**
         * 删除图书分类后还要删除图书指定
         * 这个以后实现
         */
//        System.out.println(list.toString());
        List<Integer> integers = catalogService.getById(list);
        catalogService.removeById(list);
        catalogService.removeByPid(list);
        //通过一级分类查询二级分类所有分类id
//        List<Integer> integers = catalogService.getById(list);
        System.out.println(integers.size());
        if (integers.size()!=0){
            System.out.println("删除图书信息");
            booksService.removeByType(integers);
        }
        return "redirect:catalog-list";
    }
}