package com.wangwei.service;

import com.wangwei.bean.CarBooks;

import java.util.List;

public interface CarBooksService {
    void add(CarBooks carBooks);
    void removeOne(Integer id);
    void removeOne1(Integer id);
    void removeAll(Integer usernameId);
    List<CarBooks> getAll(Integer id);
    CarBooks getOne(CarBooks carBooks);

    CarBooks getById(Integer id);
}
