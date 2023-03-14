
package com.anchu.service.impl;

import com.anchu.pojo.Product;
import com.anchu.repository.ProductRepository;
import com.anchu.service.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnChuPC
 */
@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductRepository productRepository;
    
    @Override
    public List<Product> getProducts(Map<String, String> params) {
        return productRepository.getProducts(params);
    }
    
}
