package com.wangwei.service;

import com.wangwei.bean.BuyBook;

import java.util.List;

public interface BuyBooksService {
    void add(BuyBook buyBook);
    BuyBook getById(Integer id);
    List<BuyBook> getAll(BuyBook buyBook);
    void edit(BuyBook buyBook);
    List<BuyBook> getByUserId(Integer id);
    List<BuyBook> getByBookId(Integer id);
    List<BuyBook> getAll();
    List<BuyBook> getSuccess();
    Integer selectSale();

    List<BuyBook> getAllByGroup();
}
