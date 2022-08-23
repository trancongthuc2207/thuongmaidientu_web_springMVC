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

import javax.persistence.EntityTransaction;
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
    public List<OrderDetails> getOrderDetailsByID_Order(long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrder);
        return q.getResultList();
    }

    @Override
    @Transactional
    public boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if (idOrd != 0) {
            Product pr = session.get(Product.class, idPro);
            Orders ord = session.get(Orders.class, idOrd);
            //DiscountCode dis = session.get(DiscountCode.class, "1");
            if (getOrderDetailByPK(ord.getIdOrders(), pr.getIdProduct()).size() == 0) {
                OrderDetailsPK pk = new OrderDetailsPK();
                pk.setIdProduct(pr.getIdProduct());
                pk.setIdOrderDetails(ord.getIdOrders());

                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderDetailsPK(pk);
                orderDetails.setAmount(1);
                orderDetails.setProduct(pr);
                orderDetails.setUnitPrice(pr.getUnitPrice());
                orderDetails.setOrders(ord);
                //orderDetails.setIdDiscount(dis);
                try {
//                session.getTransaction().begin();
                    session.save(orderDetails);
                    return true;
                } catch (Exception ex) {
                    session.getTransaction().rollback();
                    ex.printStackTrace();
                }
            } else {
                OrderDetailsPK pk = new OrderDetailsPK();
                pk.setIdProduct(pr.getIdProduct());
                pk.setIdOrderDetails(ord.getIdOrders());

                OrderDetails orderDetails = session.get(OrderDetails.class, pk);
                int tamp = orderDetails.getAmount();
                orderDetails.setAmount(tamp + 1);
                try {
                    session.save(orderDetails);
                    return true;
                } catch (Exception ex) {
                    session.getTransaction().rollback();
                    ex.printStackTrace();
                    return false;
                }
            }
        }
        return false;
    }

    @Override
    public List<OrderDetails> getOrderDetailByPK(long idOr, int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        ////
        Product pr = session.get(Product.class, idPro);
        Orders ord = session.get(Orders.class, idOr);
        OrderDetailsPK pk = new OrderDetailsPK();
        pk.setIdProduct(pr.getIdProduct());
        pk.setIdOrderDetails(ord.getIdOrders());
        ////
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK=:idPK");
        q.setParameter("idPK", pk);
        return q.getResultList();
    }

    @Override
    public boolean updateAmout_Pro(long idDetail, int idProd, int amount) {
        if(idDetail != 0)
        {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Product pr = session.get(Product.class, idProd);
            Orders ord = session.get(Orders.class, idDetail);
            OrderDetailsPK pk = new OrderDetailsPK();
            pk.setIdProduct(pr.getIdProduct());
            pk.setIdOrderDetails(ord.getIdOrders());

            Query q = session.createQuery("UPDATE OrderDetails set amount=:amount WHERE orderDetailsPK=:idPK");
            q.setParameter("idPK", pk);
            q.setParameter("amount", amount);
            try {
                q.executeUpdate();
            } catch (Exception ex){
                return false;
            }
            return true;
        }
        return false;
    }

}
