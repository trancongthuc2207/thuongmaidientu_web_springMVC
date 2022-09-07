package com.tct.repository.impl;

import com.tct.pojo.OrderDetails;
import com.tct.repository.ShopOtherRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.Date;
import java.util.List;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class ShopOtherRepositoryImpl implements ShopOtherRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Object[]> getTotalMoneyOrderDetailsByDate_ID_Shop(Date day, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getTotalMoneyOrderDetailsByDate_ID_Shop(:d,:idS)")
                .setParameter("d", day)
                .setParameter("idS", idShop);
        List<Object[]> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Object[]> getTotalMoneyOrderDetailsByMonth_ID_Shop(Date day, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getTotalMoneyOrderDetailsByMonth_ID_Shop(:d,:idS)")
                .setParameter("d", day)
                .setParameter("idS", idShop);
        List<Object[]> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Object[]> getTotalAmountProductByMonth_ID_Shop(Date day, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getTotalAmountProductByMonth_ID_Shop(:d,:idS)")
                .setParameter("d", day)
                .setParameter("idS", idShop);
        List<Object[]> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Object[]> getTotalAmountProductByDate_ID_Shop(Date day, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getTotalAmountProductByDate_ID_Shop(:d,:idS)")
                .setParameter("d", day)
                .setParameter("idS", idShop);
        List<Object[]> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Object[]> getTotalAmountProductByYear_ID_Shop(Date day, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getTotalAmountProductByYear_ID_Shop(:d,:idS)")
                .setParameter("d", day)
                .setParameter("idS", idShop);
        List<Object[]> lst = query.getResultList();

        return lst;
    }
}
