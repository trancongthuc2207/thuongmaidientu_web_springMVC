package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.OrderDetailsRepository;
import com.tct.repository.OrdersRepository;
import com.tct.repository.ShopProductRepository;
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
    @Autowired
    private ShopProductRepository shopProductRepository;

    @Override
    public List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrd);
        return null;
    }

    @Override
    public List<OrderDetails> getOrderDetailsByID_Order(Map<String, String> params, int page, long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrder);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }
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
                    if (this.shopProductRepository.checkAmount_book(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), orderDetails.getAmount())) {
                        session.save(orderDetails);
                        this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), orderDetails.getAmount());
                        return true;
                    } else
                        return false;
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
                    if (this.shopProductRepository.checkAmount_book(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), orderDetails.getAmount())) {
                        session.save(orderDetails);
                        this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), orderDetails.getAmount());
                        return true;
                    } else
                        return false;
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
        if (idDetail != 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Product pr = session.get(Product.class, idProd);
            Orders ord = session.get(Orders.class, idDetail);
            OrderDetailsPK pk = new OrderDetailsPK();
            pk.setIdProduct(pr.getIdProduct());
            pk.setIdOrderDetails(ord.getIdOrders());

            OrderDetails orderDetails = session.get(OrderDetails.class, pk);
            int sl_stamp = orderDetails.getAmount();

            Query q = session.createQuery("UPDATE OrderDetails set amount=:amount WHERE orderDetailsPK=:idPK");
            q.setParameter("idPK", pk);
            q.setParameter("amount", amount);
            try {
                if (sl_stamp != amount) {
                    if (amount > sl_stamp) {
                        if (this.shopProductRepository.checkAmount_book(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), amount)) {
                            q.executeUpdate();
                            this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), amount - sl_stamp);
                            return true;
                        }
                    } else if (amount < sl_stamp) {
                            q.executeUpdate();
                            this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), -(sl_stamp - amount));
                            return true;
                    }
                }
                return false;
            } catch (Exception ex) {
                return false;
            }
        }
        return false;
    }

    @Override
    public boolean deletePro(long idDetail, int idProd) {
        if (idDetail != 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Product pr = session.get(Product.class, idProd);
            Orders ord = session.get(Orders.class, idDetail);
            OrderDetailsPK pk = new OrderDetailsPK();
            pk.setIdProduct(pr.getIdProduct());
            pk.setIdOrderDetails(ord.getIdOrders());

            OrderDetails orderDetails = session.get(OrderDetails.class, pk);
            this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), (-orderDetails.getAmount()));
            try {
                session.delete(orderDetails);
            } catch (Exception ex) {
                session.getTransaction().rollback();
                return false;
            }
        }
        return false;
    }

    @Override
    public int countOrderDetailsById_Order(long idOr) {
        if (idOr != 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Query query = session.createQuery("from OrderDetails where orderDetailsPK.idOrderDetails=:id");
            query.setParameter("id", idOr);

            return query.getResultList().size();
        }
        return 0;
    }

    @Override
    public long totalOfOrderWatting(long idOr) {
        if (idOr != 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Query query = session.createQuery("from OrderDetails where orderDetailsPK.idOrderDetails=:id");
            query.setParameter("id", idOr);
            List<OrderDetails> lst = query.getResultList();
            long sum = 0;
            for (OrderDetails c : lst) {
                sum += (c.getAmount() * c.getUnitPrice());
            }
            return sum;
        }
        return 0;
    }

}
