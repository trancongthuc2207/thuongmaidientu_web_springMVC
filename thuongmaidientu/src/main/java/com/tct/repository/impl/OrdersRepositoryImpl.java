package com.tct.repository.impl;

import com.tct.pojo.Customers;
import com.tct.pojo.Orders;
import com.tct.repository.OrdersRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class OrdersRepositoryImpl implements OrdersRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;


    @Override
    public List<Orders> getOrders(Map<String, String> params, int page) {
        return null;
    }

    @Override
    public int countOrdersByID_Cus(String idCus) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        //////
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = b.createQuery(Object[].class);
        Root rootOder = query.from(Orders.class);
        Root rootCus = query.from(Customers.class);

        query = query.where(b.equal(rootOder.get("customer"), rootCus.get("idCustomer")));
        query = query.where(b.equal(rootCus.get("idCustomer"), idCus));

        query.multiselect(rootOder.get("idOrders"));
        Query q = session.createQuery(query);

        List<Object[]> lst = q.getResultList();

        return lst.size();
    }

    @Override
    public List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page, String idCus, String status) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        //////
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = b.createQuery(Object[].class);
        Root rootOder = query.from(Orders.class);
        Root rootCus = query.from(Customers.class);
        String ID_Status = params.get("idStatus");

        List<Predicate> predicates = new ArrayList<>();
        ///Dieu kien
        Predicate p = b.equal(rootOder.get("customer"), rootCus.get("idCustomer"));
        Predicate p1 = b.equal(rootCus.get("idCustomer"), idCus);
        Predicate p2 = b.equal(rootOder.get("status"), ID_Status);

        predicates.add(p);
        predicates.add(p1);
        predicates.add(p2);
        query.where(predicates.toArray(new Predicate[predicates.size()]));
        query.multiselect(rootOder.get("idOrders"),rootOder.get("totalMoney"),rootOder.get("timeBooked")
                        ,rootOder.get("status"));

        Query q = session.createQuery(query);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }

        return q.getResultList();
    }

    @Override
    public List<Orders> getProductByID_Shop(Map<String, String> params, int id) {
        return null;
    }

    @Override
    public Long getID_OrdersByID_WAITTING(Map<String, String> params, String idCus) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        //////
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = b.createQuery(Object[].class);
        Root rootOder = query.from(Orders.class);
        Root rootCus = query.from(Customers.class);

        List<Predicate> predicates = new ArrayList<>();
        ///Dieu kien
        Predicate p = b.equal(rootOder.get("customer"), rootCus.get("idCustomer"));
        Predicate p1 = b.equal(rootCus.get("idCustomer"), idCus);
        Predicate p2 = b.equal(rootOder.get("status"), "WAITTING");
        Predicate p3 = b.greaterThan(rootOder.get("idOrders").as(Long.class), 0.0);

        predicates.add(p);
        predicates.add(p1);
        predicates.add(p2);
        predicates.add(p3);
        query.where(predicates.toArray(new Predicate[predicates.size()]));
        query.multiselect(rootOder.get("idOrders"));

        Query q = session.createQuery(query);

        return Long.parseLong(q.getResultList().get(0).toString());
    }
}