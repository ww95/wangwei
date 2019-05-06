package com.wangwei.dao;

import com.wangwei.bean.CollectionBook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("collectionBooksDao")
public interface CollectionBooksDao {
    void insert(CollectionBook book);
    List<CollectionBook> getAll(Integer UsernameId);
    CollectionBook getOne(CollectionBook collectionBook);
    void delete(Integer id);

    CollectionBook selectById(Integer id);
}
