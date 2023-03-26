package com.anchu.repository.impl;

import com.anchu.pojo.Product;
import com.anchu.repository.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author AnChuPC
 */
@Repository
@Transactional
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Product> getProducts(Map<String, String> params) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root<Product> root = q.from(Product.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            // Filter by key word
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }

            // Filter by price
            String fromPrice = params.get("fromPrice");
            String toPrice = params.get("toPrice");

            if (fromPrice != null && !fromPrice.isEmpty()) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Double.class),
                        Double.parseDouble(fromPrice));
                predicates.add(p);
            }

            if (toPrice != null && !toPrice.isEmpty()) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Double.class), Double.parseDouble(toPrice));
                predicates.add(p);
            }

            // Filter by category name
            String categoryName = params.get("category");
            if (categoryName != null && !categoryName.isEmpty()) {
                Predicate p = b.equal(root.get("category").get("name").as(String.class), categoryName);
                predicates.add(p);
            }

            // Order by id, name, price
            String order = params.get("order");
            if (order != null && !order.isEmpty()) {
                q.orderBy(b.asc(root.get(order)));
            }
            q.where(predicates.toArray(new Predicate[]{}));
        }

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Product getProductById(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();

        return session.get(Product.class, id);
    }

    @Override
    public boolean addOrUpdateProduct(Product p) {
        Session s = sessionFactory.getObject().getCurrentSession();

        try {
            s.save(p);
            return true;
        } catch (HibernateException err) {
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        Session s = sessionFactory.getObject().getCurrentSession();

        try {
            s.delete(getProductById(id));
            return true;
        } catch (HibernateException err) {
            return false;
        }
    }
    
    
}
