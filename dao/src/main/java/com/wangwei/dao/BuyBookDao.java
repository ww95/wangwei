package com.wangwei.dao;

import com.wangwei.bean.BuyBook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("buyBookDao")
public interface BuyBookDao {
    void insert(BuyBook buyBook);
    BuyBook selectOne(Integer id);
    List<BuyBook> selectAll();
    List<BuyBook> selectSuccess();
    void update(BuyBook buyBook);
    List<BuyBook> selectByUserId(Integer userId);
    List<BuyBook> selectByBookId(Integer BookId);
    Integer selectSale();

    List<BuyBook> selectGroup();
}
