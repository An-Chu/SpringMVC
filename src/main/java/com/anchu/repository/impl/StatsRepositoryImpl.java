package com.anchu.repository.impl;

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.anchu.respository.impl;
//
//import com.anchu.pojo.Category;
//import com.anchu.pojo.OrderDetail;
//import com.anchu.pojo.Product;
//import com.anchu.repository.StatsRepository;
//import java.util.Date;
//import java.util.List;
//import javax.persistence.Query;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Root;
//
//import org.hibernate.Session;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
///**
// *
// * @author admin
// */
//
//@Repository
//@Transactional
//public class StatsRepositoryImpl implements StatsRepository {
//
//    @Autowired
//    private LocalSessionFactoryBean sessionFactory;
//
//    @Override
//    public List<Object[]> statsByCategory() {
//        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
//
//        //select c.name, count(p.id)
//        //from product p 
//        //join category c
//        //on p.category_id = c.id
//        //group by c.name
//        Root<Product> pRoot = query.from(Product.class);
//        Root<Category> cRoot = query.from(Category.class);
//
//        query.multiselect(cRoot.get("name"), builder.count(pRoot.get("id")));
//        query.where(builder.equal(pRoot.get("category"), cRoot.get("id")));
//        query.groupBy(cRoot.get("name"));
//
//        Query q = session.createQuery(query);
//        return q.getResultList();
//
//    }
//
//    @Override
//    public List<Object[]> statsByTopSell() {
//        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
//
////            select p.name, sum(d.num)
////            from product p
////            join order_detail d
////            on p.id = d.product_id
////            group by p.name
////            order by sum(d.product_id) desc
////            limit 5
//        Root<Product> pRoot = query.from(Product.class);
//        Root<OrderDetail> dRoot = query.from(OrderDetail.class);
//
//        query.multiselect(pRoot.get("name"), builder.sum(dRoot.get("num")));
//        query.where(builder.equal(pRoot.get("id"), dRoot.get("product")));
//        query.groupBy(pRoot.get("name"));
//        query.orderBy(builder.desc(builder.sum(dRoot.get("product"))));
//
//        Query q = session.createQuery(query);
//        q.setMaxResults(5);
//        return q.getResultList();
//
//    }
//
//    @Override
//    public List<Object[]> statsRevenue(Date fromDate, Date toDate) {
//        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
//
//        // select p.id, p.name, sum(d.unit_price * d.num)
//        // from product p
//        // join order_detail d
//        // on p.id = d.product_id
//        // group by p.name
//        Root<Product> pRoot = query.from(Product.class);
//        Root<OrderDetail> dRoot = query.from(OrderDetail.class);
//
//        query.multiselect(pRoot.get("id"), pRoot.get("name"), builder.sum(builder.prod(dRoot.get("unitPrice"), dRoot.get("num"))));
//        query.where(builder.equal(pRoot.get("id"), dRoot.get("product")));
//        query.groupBy(pRoot.get("id"));
//
//        Query q = session.createQuery(query);
//        return q.getResultList();
//
//    }
//}
