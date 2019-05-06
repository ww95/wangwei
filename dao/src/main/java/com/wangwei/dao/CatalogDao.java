package com.wangwei.dao;

import com.wangwei.bean.Catalog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 分类的持久层
 */
@Repository("catalogDao")
public interface CatalogDao {
    void insert(List<Catalog> list);
    //删除分类
    void deleteById(List list);
    void deleteByPid(List list);
    //获取根目录
    Catalog getRoot(int id);

    List<Integer> getById(List list);
}
