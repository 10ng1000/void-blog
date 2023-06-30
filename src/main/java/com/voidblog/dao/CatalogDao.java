package com.voidblog.dao;

import com.voidblog.domain.Catalog;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CatalogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Catalog record);

    Catalog selectByPrimaryKey(Integer id);

    List<Catalog> queryAll();
    int updateByPrimaryKey(Catalog record);
}