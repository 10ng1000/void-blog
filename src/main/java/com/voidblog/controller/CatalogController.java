package com.voidblog.controller;

import com.voidblog.domain.Article;
import com.voidblog.domain.Catalog;
import com.voidblog.service.impl.ArticleServiceImpl;
import com.voidblog.service.impl.CatalogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CatalogController {
    @Autowired
    CatalogServiceImpl catalogService;

    @Autowired
    ArticleServiceImpl articleService;

    @GetMapping("/catalog")
    public ModelAndView CatalogList(){
        List<Catalog> catalogs=catalogService.queryAll();
        List<Article> articles = articleService.queryAll();
        ModelAndView modelAndView=new ModelAndView("/catalog");
        modelAndView.addObject("articles",articles);
        modelAndView.addObject("catalogs",catalogs);
        return modelAndView;
    }
}
