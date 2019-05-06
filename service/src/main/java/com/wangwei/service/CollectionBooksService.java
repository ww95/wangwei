package com.wangwei.service;

import com.wangwei.bean.CollectionBook;

import java.util.List;

public interface CollectionBooksService {
    void add(CollectionBook collectionBook);
    CollectionBook getOne(CollectionBook collectionBook);
    List<CollectionBook> getAll(Integer usernameId);
    void remove(Integer usernameId);

    CollectionBook getById(Integer id);
}
