package com.wangwei.service.impl;

import com.wangwei.bean.CollectionBook;
import com.wangwei.dao.CollectionBooksDao;
import com.wangwei.service.CollectionBooksService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("collectionBooksService")
public class CollectionBooksServiceImpl implements CollectionBooksService {
    @Resource(name = "collectionBooksDao")
    private CollectionBooksDao collectionBooksDao;

    public void add(CollectionBook collectionBook) {
        collectionBooksDao.insert(collectionBook);
    }

    public CollectionBook getOne(CollectionBook collectionBook) {
        return collectionBooksDao.getOne(collectionBook);
    }

    public List<CollectionBook> getAll(Integer usernameId) {
        return collectionBooksDao.getAll(usernameId);
    }

    public void remove(Integer id) {
        collectionBooksDao.delete(id);
    }

    public CollectionBook getById(Integer id) {
        return collectionBooksDao.selectById(id);
    }
}
