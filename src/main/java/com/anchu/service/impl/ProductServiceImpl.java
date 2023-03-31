package com.anchu.service.impl;

import com.anchu.pojo.Product;
import com.anchu.repository.ProductRepository;
import com.anchu.service.ProductService;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnChuPC
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getProducts(Map<String, String> params) {
        return productRepository.getProducts(params);
    }

    @Autowired
    Cloudinary cloudinary;

    @Override
    public Product getProductById(int id) {
        return productRepository.getProductById(id);
    }

    @Override
    public boolean addOrUpdateProduct(Product p) {
        Map response = null;
        if (!p.getFile().isEmpty()) {
            try {
                response = cloudinary.uploader().upload(p.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                if (response != null) {
                    p.setImage(response.get("secure_url").toString());
                }
            } catch (IOException ex) {
                System.out.println("Err: " + ex.getMessage());
            }
        }

        return productRepository.addOrUpdateProduct(p);
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

}
