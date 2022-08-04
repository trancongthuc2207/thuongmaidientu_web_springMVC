/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository.impl;

import com.tct.pojo.TypeProduct;
import com.tct.repository.Type_ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Repository
@Transactional
public class Type_ProductRepositoryImpl implements Type_ProductRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
            
    @Autowired
    private Environment env;
    
    @Override
    public List<TypeProduct> getType_Products() {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<TypeProduct> q = b.createQuery(TypeProduct.class);
        Root root = q.from(TypeProduct.class);
        q.select(root);
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<TypeProduct> getTypeProductId(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<TypeProduct> q = b.createQuery(TypeProduct.class);
        Root root = q.from(TypeProduct.class);
        q.select(root);
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name_product").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }
            String type_Id = params.get("type_Id");
            if (type_Id != null) {
                Predicate p = b.equal(root.get("idTypeProduct"), Integer.parseInt(type_Id));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }
        Query query = session.createQuery(q);
        return query.getResultList();
    }
    
}
