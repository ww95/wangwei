package com.wangwei.service;

import com.wangwei.bean.Books;

import java.util.List;

public interface BooksService {
    void add(Books books);
    void edit(Books books);
    void remove(List<Integer> list);
    void removeByType(List<Integer> list);
    Books getById(Integer id);
    List<Books> getAll();
    List<Books> getAllByType(List<Integer> list);
    List<Books> sreachBooks(String sreach);
    List<Books> getByType(Integer pid);
    Integer selectStock();
}
