package com.wangwei.service;

import com.wangwei.bean.Catalog;

import java.util.List;

public interface CatalogService {

    void add(List<Catalog> list);
    void removeById(List<Integer> list);
    void removeByPid(List<Integer> list);
    Catalog getRoot();
    List<Integer> getById(List list);
}
