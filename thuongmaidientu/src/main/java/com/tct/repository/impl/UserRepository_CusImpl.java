/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository.impl;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.Orders;
import com.tct.pojo.ShopStore;
import com.tct.repository.OrdersRepository;
import com.tct.repository.UserRepository_Cus;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
 * @author ADMIN
 */
@Repository
@Transactional
public class UserRepository_CusImpl implements UserRepository_Cus {
    @Autowired
    private OrdersRepository ordersRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    private final int maxItemsInPage = 10;

    @Override
    public boolean addUser(Account ac) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {

            int leftLimit = 97; // letter 'a'
            int rightLimit = 122; // letter 'z'
            int len = 15;
            Random random = new Random();
            StringBuilder buffer = new StringBuilder(len);
            for (int i = 0; i < len; i++) {
                int randomLimitedInt = leftLimit + (int)
                        (random.nextFloat() * (rightLimit - leftLimit + 1));
                buffer.append((char) randomLimitedInt);
            }
            String generatedString = buffer.toString();

            if (ac.getIdAccount() != null && ac.getIdPos().getIdPosition() == 2) {
                Customers cus = new Customers();
                cus.setNameC("Khách hàng");
                cus.setIdAcc(ac.getIdAccount());
                cus.setIdCustomer(generatedString.substring(10,generatedString.length()));
                cus.setVipPos(99);

                ac.setStt("actived");

                Orders ordersNew = new Orders();
                ordersNew.setStatus("WAITTING");
                ordersNew.setCustomer(cus);
                ordersNew.setTotalMoney(Long.parseLong("0"));
                ordersNew.setIdOrders(this.ordersRepository.getID_max() + 1);

                session.save(ordersNew);
                session.save(ac);
                session.save(cus);
                return true;
            }
            if (ac.getIdAccount() != null && ac.getIdPos().getIdPosition() == 3) {
                ShopStore store = new ShopStore();
                store.setNameStore("SHOP BÁN HÀNG");
                store.setIdAcc(ac);
                store.setIdShopStore(generatedString);
                store.setDateBegin(new Date());

                ac.setStt("actived");

                session.save(ac);
                session.save(store);
                return true;
            }
            if (ac.getIdAccount() != null && ac.getIdPos().getIdPosition() == 4) {
                Customers cus = new Customers();
                cus.setNameC("Nhân viên");
                cus.setIdAcc(ac.getIdAccount());
                cus.setIdCustomer(generatedString.substring(10,generatedString.length()));
                cus.setVipPos(99);

                ac.setStt("wait");

                session.save(ac);
                session.save(cus);
                return true;
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
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

    @Override
    public int getID_max() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Account o ORDER BY o.idAccount DESC");
        Account account = (Account) query.getResultList().get(0);
        return account.getIdAccount();
    }

    @Override
    public boolean updateUser(Account user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Account account = session.get(Account.class,user.getIdAccount());
        account.setPasswordC(user.getPasswordC());

        try{
            session.update(account);
        }
        catch (Exception e) {

        }
        return false;
    }


}
