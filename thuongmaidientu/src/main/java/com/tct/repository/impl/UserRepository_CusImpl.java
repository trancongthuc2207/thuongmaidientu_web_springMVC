/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository.impl;

import com.tct.pojo.Account;
import com.tct.repository.UserRepository_Cus;
import java.util.ArrayList;
import java.util.List;
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
 * @author ADMIN
 */
@Repository
@Transactional
public class UserRepository_CusImpl implements UserRepository_Cus {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    private final int maxItemsInPage = 10;

    @Override
    public void addUser(Account ac) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (ac.getIdAccount() != null) {
                session.update(ac);
            } else {
                session.save(ac);
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Account getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Account.class, id);
    }

    @Override
    public Account getByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Account WHERE usernameC=:username");
        q.setParameter("username", username);
        return (Account) q.getSingleResult();
    }

    @Override
    public List<Account> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            List<Predicate> predicates = new ArrayList<>();
            Predicate p = builder.equal(root.get("usernameC").as(String.class), username.trim());
            predicates.add(p);
            query.where(predicates.toArray(new Predicate[0]));
        }
        Query q = session.createQuery(query);

        return q.getResultList();
    }


}
