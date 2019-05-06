package com.wangwei.dao;

import com.wangwei.bean.CarBooks;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("carBooksDao")
public interface CarBooksDao {
    void insert(CarBooks carBooks);
    List<CarBooks> selectAll(Integer id);
    void deleteOne(Integer CarBooksId);
    void deleteOne1(Integer CarBooksId);
    void deleteAll(Integer usernameId);
    CarBooks selectOne(CarBooks carBooks);

    CarBooks selectById(Integer id);
}
