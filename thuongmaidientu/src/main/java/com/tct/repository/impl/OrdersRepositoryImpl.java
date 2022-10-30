package com.tct.repository.impl;

import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
import com.tct.pojo.Orders;
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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    private OrdersRepository ordersRepository;

//    @Autowired
//    private OrderDetailsRepository orderDetailsRepository;

    @Override
    public List<Orders> getOrders(long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        List<Orders> lst = new ArrayList<>();
        Orders orders = session.get(Orders.class,idOrder);
        lst.add(orders);

        return lst;
    }

    @Override
    public int countOrdersByID_Cus(String idCus, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        int sl = 0;
        Query query = session.createQuery("from OrderDetails ord, Orders o where o.customer.idCustomer =: idC " +
                "and o.idOrders = ord.orderDetailsPK.idOrderDetails and o.status =: st group by ord.orderDetailsPK.idOrderDetails")
                .setParameter("idC",idCus)
                .setParameter("st",stt);
        sl = query.getResultList().size();
        return sl;
    }

    @Override
    public List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page, String idCus, String status) {
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
        Predicate p2 = b.equal(rootOder.get("status"), status);

        predicates.add(p);
        predicates.add(p1);
        predicates.add(p2);
        query.where(predicates.toArray(new Predicate[predicates.size()]));
        query.multiselect(rootOder.get("idOrders"), rootOder.get("totalMoney"), rootOder.get("timeBooked")
                , rootOder.get("status"));
        query.orderBy(b.desc(rootOder.get("timeBooked")));

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

        if(q.getResultList().size() == 0){
            return Long.valueOf(String.valueOf(0.1));
        }
        return Long.parseLong(q.getResultList().get(0).toString());
    }

    @Override
    public boolean saveOrderWaitting(long idOr, String idCus, long totalMoney) {
        if (idOr != 0) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime localDateTime = LocalDateTime.now();
            Session session = this.sessionFactory.getObject().getCurrentSession();

            String st = "WAITTING";
            try {
                Orders ord = session.get(Orders.class, idOr);
                ord.setStatus("1");
                ord.setTimeBooked(new Date());
                ord.setTotalMoney(totalMoney);
                session.update(ord);

                Customers cus = session.get(Customers.class, idCus);
                Orders ordersNew = new Orders();
                ordersNew.setStatus(st);
                ordersNew.setCustomer(cus);
                ordersNew.setOrderDetailsSet(null);
                ordersNew.setTotalMoney(Long.parseLong("0"));
                ordersNew.setTimeBooked(null);
                ordersNew.setIdOrders(this.ordersRepository.getID_max() + 1);

                session.save(ordersNew);

                return true;
            } catch (Exception ex) {
                session.getTransaction().rollback();
                return false;
            }
        }
        return false;
    }

    @Override
    @Transactional
    public boolean saveOrderShop(Orders ord, long idOrdW, String idS,long totalMoney) {
        if (ord.getIdOrders() != 0) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime localDateTime = LocalDateTime.now();
            Session session = this.sessionFactory.getObject().getCurrentSession();

            try {
                ord.setStatus("1");
                ord.setTimeBooked(new Date());
                ord.setTotalMoney(totalMoney);
                session.save(ord);
                return true;

            } catch (Exception ex) {
                return false;
            }
        }
        return false;
    }

    @Override
    public long getID_max() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Orders o ORDER BY o.idOrders DESC");
        Orders ord = (Orders) query.getResultList().get(0);
        return ord.getIdOrders();
    }

    @Override
    public List<Orders> getOrderByEmployee(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Orders o where o.status != :st");
        query.setParameter("st","WAITTING");
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        return query.getResultList();
    }

    @Override
    public boolean submitOrderFull(long idOrder) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Orders orders = session.get(Orders.class,idOrder);
        orders.setStatus("2");
        try {
            session.update(orders);
            return true;
        }catch (Exception exception){

        }
        return false;
    }

    @Override
    public List<Orders> getOrderByIDShop_Kw_Stt_Page_IncreDes(String idShop, String kw, String stt, int page, String Incre_Des) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        int start = 0;
        if (page > 0) {
            start = (page - 1) * 20;
        }

        List<Orders> lst = new ArrayList<>();
        Query query = session.createSQLQuery("CALL GetOrderAll_Kw_Stt(:idS,:kww,:stt,:pos,:in_des)")
                .setParameter("idS", idShop)
                .setParameter("kww", kw)
                .setParameter("stt", stt)
                .setParameter("pos", start)
                .setParameter("in_des", Incre_Des).addEntity(Orders.class);
        lst = query.getResultList();
        return lst;
    }

    @Override
    public List<Orders> getOrderByIDCustomer_Kw_Stt_Page_IncreDes(String idCus, String kw, String stt, int page, String Incre_Des) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        int start = 0;
        if (page > 0) {
            start = (page - 1) * 20;
        }

        List<Orders> lst = new ArrayList<>();
        Query query = session.createSQLQuery("CALL GetOrderByCustomerAll_Kw_Stt(:idC,:kww,:stt,:pos,:in_des)")
                .setParameter("idC", idCus)
                .setParameter("kww", kw)
                .setParameter("stt", stt)
                .setParameter("pos", start)
                .setParameter("in_des", Incre_Des).addEntity(Orders.class);
        lst = query.getResultList();
        return lst;
    }

    @Override
    public List<String> getEveryNameInOrderWaittingByIDCus(String idCus, String stt, int page, String isFull) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        int start = 0;
        if (page > 0) {
            start = (page - 1) * 20;
        }

        List<String> lstName = new ArrayList<>();
        Query query = session.createSQLQuery("CALL getEveryNameInOrderSTTByIDCus(:idC,:st,:page,:isF)")
                .setParameter("idC", idCus)
                .setParameter("st", stt)
                .setParameter("page", start)
                .setParameter("isF", isFull);
        List<Object> lst = query.getResultList();
        lst = query.getResultList();

        lst.forEach(h -> {
            lstName.add(h.toString());
        });

        return lstName;
    }

    @Override
    public List<Object[]> getOrderByTimeActionByIdShop(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        List<Object[]> lst = new ArrayList<>();
        Query query = session.createSQLQuery("CALL getOrderByTimeAction(:idS)")
                .setParameter("idS", idShop);
        lst = query.getResultList();

        return lst;
    }

    @Override
    public int countOrderFullByEmployee() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Orders o where o.status != :st");
        query.setParameter("st","WAITTING");

        return query.getResultList().size();
    }

    @Override
    public List<Orders> getOrderByEmployee_Kw_SttOfOrder(String kw, String stt, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Orders o where o.status = :st");
        query.setParameter("st",stt);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        return query.getResultList();
    }

    @Override
    public int countOrderFullByEmployee_Kw_SttOfOrder(String kw, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Orders o where o.status = :st");
        query.setParameter("st",stt);

        return query.getResultList().size();
    }
}
