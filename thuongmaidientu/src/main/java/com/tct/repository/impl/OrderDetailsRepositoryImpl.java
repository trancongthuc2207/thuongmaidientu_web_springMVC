package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.OrderDetailsRepository;
import com.tct.repository.OrdersRepository;
import com.tct.repository.ProductRepository;
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
import javax.persistence.criteria.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr");
        q.setParameter("idOr", idOrd);
        return q.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetailsByID_Order(Map<String, String> params, int page, long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From OrderDetails WHERE orderDetailsPK.idOrderDetails=:idOr order by dateCreated desc ");
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
                orderDetails.setDateCreated(new Date());
                orderDetails.setStt("1");

                long value_dis = this.productRepository.valueDiscountOfProduct(pr);
                if(value_dis >= 0){
                    orderDetails.setValueDiscount(value_dis);
                }
                //orderDetails.setIdDiscount(dis);
                try {
                    if (this.shopProductRepository.getShopProductByPK(pr.getIdShop().getIdShopStore(), pr.getIdProduct()).get(0).getAmount() > 0) {
                        session.save(orderDetails);
                        this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), 1);
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
                orderDetails.setDateCreated(new Date());
                orderDetails.setStt("1");
                long value_dis = this.productRepository.valueDiscountOfProduct(pr);
                if(value_dis >= 0){
                    orderDetails.setValueDiscount(value_dis);
                }
                int tamp = orderDetails.getAmount();
                orderDetails.setAmount(tamp + 1);
                try {
                    if (this.shopProductRepository.getShopProductByPK(pr.getIdShop().getIdShopStore(), pr.getIdProduct()).get(0).getAmount() > 0) {
                        session.save(orderDetails);
                        this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), 1);
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

            int sldM = amount - sl_stamp;

            Query q = session.createQuery("UPDATE OrderDetails set amount=:amount WHERE orderDetailsPK=:idPK");
            q.setParameter("idPK", pk);
            q.setParameter("amount", amount);
            try {
                int slRemainS_P = this.shopProductRepository.getShopProductByPK(pr.getIdShop().getIdShopStore(), pr.getIdProduct()).get(0).getAmount();
                if (slRemainS_P > 0) {
                    if (sldM > 0) {
                        if (sldM < slRemainS_P) {
                            if (this.shopProductRepository.checkAmount_book(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), sldM)) {
                                q.executeUpdate();
                                this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), amount - sl_stamp);
                                return true;
                            }
                        } else
                            return false;
                    }
                    else if(sldM < 0){
                        q.executeUpdate();
                        this.shopProductRepository.updateAmountPro_booked(pr.getIdShop().getIdShopStore(), pr.getIdProduct(), -(sl_stamp - amount));
                        return true;
                    } else
                        return false;
                } else
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
                sum -= (c.getAmount() * c.getValueDiscount());
            }
            return sum;
        }
        return 0;
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_Shop(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("select o From OrderDetails o, ShopProducts  s WHERE o.orderDetailsPK.idProduct = s.shopProductsPK.idProduct and s.id.idShop=:idS and o.stt = '1' and s.product.status = 1 order by o.orderDetailsPK.idOrderDetails , o.dateCreated ");
        q.setParameter("idS", idShop);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }

        return q.getResultList();
    }

    @Override
    public int countOrderDetailsForShopById_Order(String idShop, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        int sl = 0;
        Query query = session.createSQLQuery("CALL getFullOrderWaittingByIDShop(:idS,:st,:kw_time,:posData)")
                .setParameter("idS", idShop)
                .setParameter("st", stt)
                .setParameter("kw_time", "full")
                .setParameter("posData", 0);
        List<Object[]> lst = query.getResultList();
        sl = lst.size();

        return sl;
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("select o From OrderDetails o, ShopProducts  s WHERE o.orderDetailsPK.idProduct = s.shopProductsPK.idProduct and s.id.idShop=:idS and o.stt = '1' and s.product.status = 1 order by o.orderDetailsPK.idOrderDetails , o.dateCreated ");
        q.setParameter("idS", idShop);

        if (params != null) {
            String kw = params.get("kw");

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String filter = params.get("filter"); ///today, yesterday, moreday
            if (filter != null && !filter.isEmpty() && filter.equals("today")) {
                Query query = session.createSQLQuery("CALL GetOrderToday(:ngay,:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("ngay", new Date())
                        .setParameter("idS", idShop);
                return query.getResultList();
            }

            //YESTERDAY
            if (filter != null && !filter.isEmpty() && filter.equals("yesterday")) {
                Query query = session.createSQLQuery("CALL GetOrderYesterday(:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("idS", idShop);
                return query.getResultList();
            }

            //Moreday
            if (filter != null && !filter.isEmpty() && filter.equals("moreday")) {
                Query query = session.createSQLQuery("CALL GetOrderMoreDay(:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("idS", idShop);
                return query.getResultList();
            }
        }



        return q.getResultList();
    }

    @Override
    public int countOrderDetailsForShopById_OrderToday(String idShop) {
        return 0;
    }

    @Override
    public boolean updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(long idDetail, int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        OrderDetailsPK pk = new OrderDetailsPK();
        pk.setIdOrderDetails(idDetail);
        pk.setIdProduct(idPro);

        OrderDetails orderDetails = session.get(OrderDetails.class, pk);
        orderDetails.setStt("2");
        orderDetails.setDateShopaccept(new Date());
        try {
            session.update(orderDetails);
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("select o From OrderDetails o, ShopProducts  s WHERE o.orderDetailsPK.idProduct = s.shopProductsPK.idProduct and s.id.idShop=:idS and o.stt = '2' and s.product.status = 1 order by o.orderDetailsPK.idOrderDetails, o.dateShopaccept desc ");
        q.setParameter("idS", idShop);

        if (params != null) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String filter = params.get("filter"); ///today, yesterday, moreday
            if (filter != null && !filter.isEmpty() && filter.equals("today")) {
                Query query = session.createSQLQuery("CALL GetOrderAcceptedToDay(:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("idS", idShop);
                return query.getResultList();
            }

            //YESTERDAY
            if (filter != null && !filter.isEmpty() && filter.equals("yesterday")) {
                Query query = session.createSQLQuery("CALL GetOrderAcceptedYesterday(:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("idS", idShop);
                return query.getResultList();
            }

            //Moreday
            if (filter != null && !filter.isEmpty() && filter.equals("moreday")) {
                Query query = session.createSQLQuery("CALL GetOrderAcceptedMoreDay(:idS)")
                        .addEntity(OrderDetails.class)
                        .setParameter("idS", idShop);
                return query.getResultList();
            }
        }


        return q.getResultList();
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderAcceptedToDay_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderAcceptedYesterday_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderAcceptedMoreDay_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderAcceptedAll_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetails(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from OrderDetails order by dateCreated");
        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderToDay_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderYesterday_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderMoreDay_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = params.getOrDefault("kw", "");

        Query query = session.createSQLQuery("CALL GetOrderAll_Kw(:idS,:keyword)")
                .addEntity(OrderDetails.class)
                .setParameter("idS", idShop)
                .setParameter("keyword", kw);

        return query.getResultList();
    }

    @Override
    public int countNotConfirmOrderDetailsForShopById_Order(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("select o From OrderDetails o, ShopProducts  s WHERE o.orderDetailsPK.idProduct = s.shopProductsPK.idProduct and s.id.idShop=:idS and o.stt = '1' and s.product.status = 1");
        query.setParameter("idS", idShop);

        return query.getResultList().size();
    }

    @Override
    public int countProductInOrderWaitting(long idDetail) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        long count = 0;
        if(session
                .createQuery("select sum(o.amount) From OrderDetails o WHERE o.orderDetailsPK.idOrderDetails=:idO and o.stt = '1'", Long.class)
                .setParameter("idO", idDetail)
                .getSingleResult() == null)
        {
            return 0;
        } else {
            count = session
                    .createQuery("select sum(o.amount) From OrderDetails o WHERE o.orderDetailsPK.idOrderDetails=:idO and o.stt = '1'", Long.class)
                    .setParameter("idO", idDetail)
                    .getSingleResult();
        }
        return Integer.parseInt(String.valueOf(count));
    }

    @Override
    public boolean updateOrderIdPaying(long idWait, String idSh, long idOrdN) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Query seperatedOrd = session.createSQLQuery("CALL seperateOrder2Shop(:idW,:idSh,:idN)")
                    .setParameter("idW", idWait)
                    .setParameter("idSh", idSh)
                    .setParameter("idN", idOrdN);

            seperatedOrd.executeUpdate();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    @Override
    public long totalOfOrderPerShop(long idOr, String idS) {
        if (idOr != 0) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            ////
            Query query = session.createQuery("from OrderDetails where orderDetailsPK.idOrderDetails=:id and product.idShop.idShopStore =: idSh");
            query.setParameter("id", idOr);
            query.setParameter("idSh", idS);
            List<OrderDetails> lst = query.getResultList();
            long sum = 0;
            for (OrderDetails c : lst) {
                sum += (c.getAmount() * c.getUnitPrice());
            }

            long minus = 0;
            List<ShopProducts> lst_sp = new ArrayList<>();
            lst_sp = this.shopProductRepository.getShopProducts();

            for(OrderDetails c : lst){
                minus += (c.getAmount() * c.getValueDiscount());
            }

            return sum - minus;
        }
        return 0;
    }

    @Override
    public List<String> listIDOrderToStringByIdShop(String idS, String stt, String kw_time, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        int start = 0;
        if (page > 0) {
            start = (page - 1) * 20;
        }

        List<String> nameID = new ArrayList<>();
        Query query = session.createSQLQuery("CALL getFullOrderWaittingByIDShop(:idS,:st,:time_kw,:posData)")
                .setParameter("idS", idS)
                .setParameter("st", stt)
                .setParameter("time_kw", kw_time)
                .setParameter("posData", start);
        List<Object[]> lst = query.getResultList();
        for(Object[] i : lst){
            nameID.add(i[0].toString());
        }

        return nameID;
    }

    @Override
    public boolean updateSTTAccept_OrderDetailsShopByID_Ord(long idDetail) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Orders o = session.get(Orders.class,idDetail);
        o.setStatus("2");

        Query query = session.createQuery("update OrderDetails o set o.stt = '2', o.dateShopaccept =:date where orderDetailsPK.idOrderDetails=:id ");
        query.setParameter("id", idDetail);
        query.setParameter("date", new Date());


        try {
            session.update(o);
            query.executeUpdate();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public List<OrderDetails> getOrderDetailsByIDCustomer_SttOrder(String idCus, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL GetOrderByIDCustomer_SttOrder(:idC,:st)")
                .setParameter("idC", idCus)
                .setParameter("st", stt)
                .addEntity(OrderDetails.class);

        return query.getResultList();
    }

    @Override
    public boolean updateSTTCancle_OrderDetailsShopByID_Ord(long idDetail,String reason, String from) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Orders o = session.get(Orders.class,idDetail);
        o.setStatus("CANCLE");
        o.setReasonCancle(reason);
        o.setCancleFrom(from);
        o.setTimeCancle(new Date());

        Query query = session.createQuery("update OrderDetails o set o.stt = 'CANCLE', o.dateShopaccept =:date where orderDetailsPK.idOrderDetails=:id ");
        query.setParameter("id", idDetail);
        query.setParameter("date", new Date());

        try {
            session.update(o);
            query.executeUpdate();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }


}
