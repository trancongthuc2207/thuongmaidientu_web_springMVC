package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.OrderDetailsRepository;
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
public class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Autowired
    private OrdersRepository ordersRepository;

    @Override
    public List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrd);
        return null;
    }

    @Override
    public OrderDetails getOrderDetailsByID_Order(long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrder);
        return (OrderDetails) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, Product pro, String idCUs) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Long idOrderWaitting = this.ordersRepository.getID_OrdersByID_WAITTING(params, idCUs);

        if (idOrderWaitting != 0) {
            Product pr = session.get(Product.class,pro.getIdProduct());
            OrderDetails ord = session.get(OrderDetails.class,idOrderWaitting);

            OrderDetailsPK pk = new OrderDetailsPK();
            pk.setIdProduct(pro.getIdProduct());
            pk.setIdOrderDetails(idOrderWaitting);

            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setOrderDetailsPK(pk);
            orderDetails.setAmount(1);
            orderDetails.setProduct(pro);
            orderDetails.setUnitPrice(pro.getUnitPrice());
            try {
                session.getTransaction().begin();
                session.save(pk);
                session.save(orderDetails);
                session.getTransaction().commit();
                return true;
            } catch (Exception ex) {
                session.getTransaction().rollback();
                ex.printStackTrace();
            } finally {
                session.close();
            }
        }
        return false;
    }

}
