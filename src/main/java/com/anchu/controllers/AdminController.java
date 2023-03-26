/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anchu.controllers;

import com.anchu.pojo.Product;
import com.anchu.service.ProductService;
import javax.validation.Valid;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AnChuPC
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    
    @Autowired
    ProductService productService;
    
    @GetMapping(value = "/products")
    private String products(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("products", productService.getProducts(null));
        return "products";
    }
    
    @GetMapping(value = "/products/{productId}")
    private String updateProduct(Model model, @PathVariable(value = "productId") int productId) {
        model.addAttribute("product", productService.getProductById(productId));
        return "products";
    }
    
    @PostMapping(value = "/products")
    private String addProduct(Model model,@ModelAttribute(value = "product") @Valid Product p,
            BindingResult result) {
        if(result.hasErrors())
            return "products";
        
        if(productService.addOrUpdateProduct(p)) {
            return "redirect:/";
        }
        else {
            model.addAttribute("errMsg", "Somethong wrong!!!");
        }
        return "products";
    }
}
