/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.anchu.repository;

import com.anchu.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author AnChuPC
 */
public interface ProductRepository {
    public List<Product> getProducts(Map<String, String> params); 
    public Product getProductById(int id);
    boolean addOrUpdateProduct(Product p);
}
