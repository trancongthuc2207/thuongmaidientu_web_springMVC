package com.tct.repository.impl;

import com.tct.pojo.DiscountCode;
import com.tct.repository.DiscountCodeRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class DiscountCodeRepositoryImpl implements DiscountCodeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<DiscountCode> getDiscountByID_Shop(String idShop, int status) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("select d from DiscountCode d, ShopStore s where d.idShopDeli.idShopStore=:id and  d.status=:stt and s.idShopStore=:idS");
        query.setParameter("id",idShop);
        query.setParameter("stt",status);
        query.setParameter("idS",idShop);
        return query.getResultList();
    }
}
