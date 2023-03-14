/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.anchu.service;

import com.anchu.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author AnChuPC
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params);
}
