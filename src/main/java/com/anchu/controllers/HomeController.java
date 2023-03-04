/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anchu.controllers;

import com.anchu.pojo.Category;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author admin
 */

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index(Model model) {
        List<Category> categories = new ArrayList<>();
        
        categories.add(new Category(1, "Điện thoại"));
        categories.add(new Category(2, "Laptop"));
        categories.add(new Category(3, "Tablet"));
        model.addAttribute("categories", categories);
        return "index";
    }
}
