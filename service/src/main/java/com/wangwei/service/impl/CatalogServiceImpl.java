package com.wangwei.service.impl;

import com.wangwei.bean.Catalog;
import com.wangwei.dao.CatalogDao;
import com.wangwei.service.CatalogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("catalogService")
public class CatalogServiceImpl implements CatalogService {


    @Resource(name = "catalogDao")
    private CatalogDao catalogDao;
    public void add(List<Catalog> list) {

        catalogDao.insert(list);
    }

    public void removeById(List<Integer> list) {
        catalogDao.deleteById(list);
    }

    public void removeByPid(List<Integer> list) {

        catalogDao.deleteByPid(list);
    }

    public Catalog getRoot() {
        return catalogDao.getRoot(1);
    }

    public List<Integer> getById(List list) {
        return catalogDao.getById(list);
    }
}
