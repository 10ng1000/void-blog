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

    @PostMapping("/admin/catalog/add")
    public String catalogAdd(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Catalog catalog = new Catalog();
        String id = request.getParameter("id");
        if (id != null) catalog.setId(Integer.parseInt(id));
        catalog.setName(request.getParameter("name"));
        try{
            catalogService.insert(catalog);
            redirectAttributes.addFlashAttribute("success","新建类别成功");
        }catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "新建类别失败");
        }
        return "redirect:/admin/catalog/list";
    }
    @PostMapping("/admin/catalog/delete")
    public String catalogDelete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String id = request.getParameter("id");
        try{
            if (id != null) catalogService.deleteById(Integer.parseInt(id));
            redirectAttributes.addFlashAttribute("success","删除类别成功");
        }catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "删除类别失败");
        }
        return "redirect:/admin/catalog/list";
    }

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
