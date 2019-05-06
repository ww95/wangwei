package com.wangwei.service.impl;

import com.wangwei.bean.CarBooks;
import com.wangwei.dao.CarBooksDao;
import com.wangwei.service.CarBooksService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("carBooksService")
public class CarBooksServiceImpl implements CarBooksService {
    @Resource(name = "carBooksDao")
    private CarBooksDao carBooksDao;
    public void add(CarBooks carBooks) {
        carBooksDao.insert(carBooks);
    }

    public void removeOne(Integer id) {
        carBooksDao.deleteOne(id);
    }

    public void removeOne1(Integer id) {
        carBooksDao.deleteOne1(id);
    }

    public void removeAll(Integer usernameId) {
        carBooksDao.deleteAll(usernameId);
    }

    public List<CarBooks> getAll(Integer id) {
        return carBooksDao.selectAll(id);
    }

    public CarBooks getOne(CarBooks carBooks) {
        return carBooksDao.selectOne(carBooks);
    }

    public CarBooks getById(Integer id) {
        return carBooksDao.selectById(id);
    }
}
