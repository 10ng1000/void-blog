package com.voidblog.service;

import com.voidblog.domain.Catalog;

import java.util.List;

/*
* 插入，删除，查找记录
* */

public interface CatalogService {
    Catalog selectById (Integer id);
    List<Catalog> queryAll();
    int deleteById (Integer id);
    boolean insert (Catalog catalog);
}
