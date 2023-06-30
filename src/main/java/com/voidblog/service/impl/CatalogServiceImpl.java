package com.voidblog.service.impl;

import com.voidblog.dao.CatalogDao;
import com.voidblog.domain.Catalog;
import com.voidblog.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    public CatalogDao catalogDao;
    public Catalog selectById(Integer id) {
        return catalogDao.selectByPrimaryKey(id);
    }

    public int deleteById(Integer id) {
        return catalogDao.deleteByPrimaryKey(id);
    }

    public List<Catalog> queryAll() { return catalogDao.queryAll();}
    public boolean insert(Catalog catalog) {
        return catalogDao.insert(catalog) > 0;
    }
}
