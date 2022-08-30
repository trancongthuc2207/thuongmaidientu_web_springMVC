/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository.impl;

import com.tct.pojo.Product;
import com.tct.pojo.TypeProduct;
import com.tct.repository.ProductRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");

            Predicate stt = b.equal(root.get("status"), 1);
            predicates.add(stt);

            String type_Id = params.get("type_Id");
            if (type_Id != null) {
                Predicate p = b.equal(root.get("idTypeProduct"), Integer.parseInt(type_Id));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public List<Product> getProductsByType(Map<String, String> params, int page, int type) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        q.select(root);
        
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");

            Predicate stt = b.equal(root.get("status"), 1);
            predicates.add(stt);

            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("nameProduct").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            String tp = params.get("toPrice");
            if (tp != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(tp));
                predicates.add(p);
            }

            String type_Id = params.get("type_Id");
            if (type_Id != null) {
                Predicate p = b.equal(root.get("typeOfProduct"), Integer.parseInt(type_Id));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public int countProduct() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        org.hibernate.query.Query q = session.createQuery("SELECT COUNT(*) FROM Product");
        
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public List<Product> getProductByID(Map<String, String> params, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String ID_Product = params.get("ID_Product");
            if (ID_Product != null) {
                Predicate p = b.equal(root.get("idProduct"), id);
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean updateProductByID_Product(int idPro, String name, Long unitPrice, String decrip,int typePro,String manufac, String image) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        TypeProduct type = session.get(TypeProduct.class,typePro);

        Product pro = session.get(Product.class,idPro);
        pro.setNameProduct(name);
        pro.setUnitPrice(unitPrice);
        pro.setProductDescription(decrip);
        pro.setTypeOfProduct(type);
        pro.setManufacturer(manufac);
        pro.setImage(image);
        pro.setDateCreated(new Date());
        try{
            session.update(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean updateStatusDelete_ProductByID_Product(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Product pro = session.get(Product.class,idPro);
        pro.setStatus(999);
        try{
            session.update(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

}
