package com.wangwei.service.impl;

import com.wangwei.bean.Books;
import com.wangwei.bean.BuyBook;
import com.wangwei.dao.BooksDao;
import com.wangwei.service.BooksService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("booksService")
public class BooksServiceImpl implements BooksService {
    @Resource(name = "booksDao")
    private BooksDao booksDao;
    public void add(Books books) {
        booksDao.insert(books);
    }

    public void edit(Books books) {
        booksDao.update(books);
    }

    public void removeByType(List<Integer> list) {
        booksDao.deleteByType(list);
    }

    public void remove(List list) {

        booksDao.delete(list);
    }

    public Books getById(Integer id) {

        return booksDao.selectOne(id);
    }

    public List<Books> getAll() {

        return booksDao.selectAll();
    }

    public List<Books> getAllByType(List<Integer> list) {
        return booksDao.selectAllByCatalog(list);
    }

    public List<Books> sreachBooks(String sreach) {
        return booksDao.sreach(sreach);
    }

    public List<Books> getByType(Integer pid) {
        return booksDao.selectByType(pid);
    }

    public Integer selectStock() {
        return booksDao.selectStock();
    }
}
