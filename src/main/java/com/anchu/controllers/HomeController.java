/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anchu.controllers;

import com.anchu.pojo.Category;
import com.anchu.pojo.Product;
import com.anchu.service.CategoryService;
import com.anchu.service.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute
    public void commom(Model model) {
        List<Category> categories = categoryService.getCategories();

        model.addAttribute("categories", categories);
    }

    @RequestMapping({"/", "/product"})
    public String index(Model model, @RequestParam Map<String, String> params) {
        List<Product> products = productService.getProducts(params);

        model.addAttribute("products", products);
        return "index";
    }

    @RequestMapping("/product/{id}")
    public String detail(Model model, @PathVariable(value = "id") String id) {

        model.addAttribute("product", productService.getProductById(Integer.parseInt(id)));

        return "product-detail";
    }

}
