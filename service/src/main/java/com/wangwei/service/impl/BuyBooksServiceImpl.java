package com.wangwei.service.impl;

import com.wangwei.bean.BuyBook;
import com.wangwei.dao.BuyBookDao;
import com.wangwei.service.BuyBooksService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("buyBooksService")
public class BuyBooksServiceImpl implements BuyBooksService {
    @Resource(name = "buyBookDao")
    private BuyBookDao buyBookDao;
    public void add(BuyBook buyBook) {
        buyBookDao.insert(buyBook);
    }

    public BuyBook getById(Integer id) {
        return buyBookDao.selectOne(id);
    }

    public List<BuyBook> getAll(BuyBook buyBook) {
        return buyBookDao.selectAll();
    }

    public void edit(BuyBook buyBook) {
        buyBookDao.update(buyBook);
    }

    public List<BuyBook> getByUserId(Integer userId) {
        return buyBookDao.selectByUserId(userId);
    }

    public List<BuyBook> getByBookId(Integer id) {
        return buyBookDao.selectByBookId(id);
    }

    public List<BuyBook> getAll() {
        return buyBookDao.selectAll();
    }

    public List<BuyBook> getSuccess() {
        return buyBookDao.selectSuccess();
    }

    public Integer selectSale() {
        return  buyBookDao.selectSale();
    }

    public List<BuyBook> getAllByGroup() {
        return buyBookDao.selectGroup();
    }
}
