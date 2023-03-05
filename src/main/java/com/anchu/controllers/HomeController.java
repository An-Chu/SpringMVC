/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anchu.controllers;

import com.anchu.pojo.Category;
import com.anchu.pojo.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
public class HomeController {

    @RequestMapping("/")
    public String index(Model model, @RequestParam(value = "kw", required = false) String kw) {
        List<Category> categories = new ArrayList<>();
        List<Product> products = new ArrayList<>();

        categories.add(new Category(1, "Điện thoại"));
        categories.add(new Category(2, "Laptop"));
        categories.add(new Category(3, "Tablet"));

        products.add(new Product(1, "Iphone 14", "https://cdn.tgdd.vn/Products/Images/42/250258/iphone-13-1-2.jpg", 23000000L));
        products.add(new Product(2, "Máy tính bảng iPad Pro", "https://cdn.tgdd.vn/Products/Images/522/259650/Slider/Ipad-Pro-M1-YouTube-1020x570.jpeg", 20000000L));
        products.add(new Product(3, "Laptop Asus VivoBook X515EA", "https://cdn.tgdd.vn/Products/Images/44/273248/Slider/vi-vn-asus-vivobook-x515ea-i7-ej1918w-01.jpg", 30000000L));

        products.add(new Product(1, "Iphone 14", "https://cdn.tgdd.vn/Products/Images/42/250258/iphone-13-1-2.jpg", 23000000L));
        products.add(new Product(2, "Máy tính bảng iPad Pro", "https://cdn.tgdd.vn/Products/Images/522/259650/Slider/Ipad-Pro-M1-YouTube-1020x570.jpeg", 20000000L));
        products.add(new Product(3, "Laptop Asus VivoBook X515EA", "https://cdn.tgdd.vn/Products/Images/44/273248/Slider/vi-vn-asus-vivobook-x515ea-i7-ej1918w-01.jpg", 30000000L));

        if (kw != null && !kw.isEmpty()) {
            products = products.stream().filter(p -> p.getName().contains(kw)).collect(Collectors.toList());
        }
        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        return "index";
    }

}
