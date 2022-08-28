package com.tct.repository.impl;

import com.tct.pojo.ShopStore;
import com.tct.repository.ShopStoreRepository;
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
public class ShopStoreRepositoryImpl implements ShopStoreRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;


    @Override
    public List<ShopStore> getShopstoreByIdAcc(int idAccS) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("SELECT s from Account o, ShopStore s where o.idAccount=:id and  s.idAcc=:id");
        query.setParameter("id",idAccS);

        return query.getResultList();
    }
}
