package com.tct.repository.impl;

import com.tct.pojo.Customers;
import com.tct.repository.CustomerRepository;
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

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class CustomerRepositoryImpl implements CustomerRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public Customers getCustomersByID_acc(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Customers> q = b.createQuery(Customers.class);
        Root root = q.from(Customers.class);
        q.select(root);

        Predicate predicate = b.equal(root.get("idAcc"), id);
        q.where(predicate);

        Query query = session.createQuery(q);
        return (Customers) query.getSingleResult();
    }

    @Override
    public boolean updateCustomer(Customers cus) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Customers customers = session.get(Customers.class, cus.getIdCustomer());

        customers.setNameC(cus.getNameC());
        customers.setSex(cus.getSex());
        customers.setSerialNumberC(cus.getSerialNumberC());
        customers.setPhoneNumber(cus.getPhoneNumber());
        customers.setAddress(cus.getAddress());
        customers.setImage(cus.getImage());
        customers.setEmail(cus.getEmail());
        try {
            session.update(customers);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean checkInfor2Order(Customers cus) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Customers customers = session.get(Customers.class, cus.getIdCustomer());


        List<String> quanHuyen = new ArrayList<>();
        quanHuyen.add("q.");
        quanHuyen.add("quận");
        quanHuyen.add("huyện");
        quanHuyen.add("h.");
        quanHuyen.add("quan");
        quanHuyen.add("huyen");

//        List<String> tpTinh = new ArrayList<>();
//        tpTinh.add("tỉnh");
//        tpTinh.add("t.");
//        tpTinh.add("tp.");
//        tpTinh.add("thành phố");
//        tpTinh.add("tinh");
//        tpTinh.add("thanh pho");
        boolean checkActive = false;
        boolean checkEmail = false;
        boolean checkAddress = false;
        boolean checkAdd1 = false;
        boolean checkAdd2 = true;
        if (cus.getNameC() == null || cus.getNameC().isEmpty() || cus.getPhoneNumber() == null ||
                cus.getPhoneNumber().isEmpty() || cus.getAddress() == null ||
                cus.getAddress().isEmpty() || cus.getEmail() == null || cus.getEmail().isEmpty()
                || !cus.getEmail().contains("@") )
            return false;
        else if (!cus.getAddress().isEmpty()) // Kiểm tra địa chỉ
        {
            for(String s : quanHuyen){
                if(cus.getAddress().toLowerCase().contains(s))
                {
                    checkAdd1 = true;
                }
            }
            if (!cus.getEmail().isEmpty() && cus.getEmail().contains("@") )
                checkEmail = true;
//            for(String s : tpTinh){
//                if(cus.getAddress().toLowerCase().contains(s))
//                {
//                    checkAdd2 = true;
//                }
//            }
            if(checkAdd1 == checkAdd2 && checkAdd2 == true && checkAdd1 == true && checkEmail == true)
                checkAddress = true;
        }

        return checkAddress;
    }

    @Override
    public Customers getCustomerByIDCus(String idCus) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Customers customers = session.get(Customers.class, idCus);
        return customers;
    }

    @Override
    public boolean checkCanComment(String idCus, int idPro) {
        Session session = sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("SELECT distinct ord from Customers c, Orders o, OrderDetails ord where o.idOrders = ord.orderDetailsPK.idOrderDetails" +
                " and o.customer.idCustomer = c.idCustomer and o.status != '1' and o.status != 'CANCLE' and o.status != 'WAITTING'" +
                " and ord.product.idProduct =: idP and c.idCustomer =:idC");
        query.setParameter("idP", idPro);
        query.setParameter("idC", idCus);
        if(query.getResultList().size() > 0)
            return true;
        return false;
    }

    @Override
    public List<Customers> getCustomersByEmployee(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Customers o");
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        return query.getResultList();
    }

    @Override
    public int countCustomerByEmployee(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Customers o");
        int len = 0;
        if(query.getResultList() != null){
            len = query.getResultList().size();
        }
        return len;
    }
}
