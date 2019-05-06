package com.wangwei.dao;

import com.wangwei.bean.Books;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("booksDao")
public interface BooksDao {
    //添加
    void insert(Books books);
    //删除
    void delete(List<Integer> list);
    void deleteByType(List<Integer> list);
    //更新
    void update(Books books);
    //查询一个
    Books selectOne(Integer id);
    //查询所有
    List<Books> selectAll();
    List<Books> selectAllByCatalog(List<Integer> list);
    //模糊查询
    List<Books> sreach(String sreach);
    List<Books> selectByType(Integer id);
    //查询进货总价
    Integer selectStock();
}
