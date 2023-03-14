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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
public class HomeController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        List<Product> products = productService.getProducts(params);
        List<Category> categories = categoryService.getCategories();
            
        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        return "index";
    }

}
