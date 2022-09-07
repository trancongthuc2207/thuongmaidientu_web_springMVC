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
        query.setParameter("id", idAccS);

        return query.getResultList();
    }

    @Override
    public boolean updateIn4ShopStore(ShopStore store) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        ShopStore shopStore = session.get(ShopStore.class, store.getIdShopStore());
        shopStore.setNameStore(store.getNameStore());
        shopStore.setMainType(store.getMainType());
        shopStore.setMainType(store.getOrtherType1());
        shopStore.setMainType(store.getOrtherType2());
        if (store.getFile() != null) {
            shopStore.setImageS(store.getImageS());
        }
        try {
            session.update(shopStore);
            return true;
        } catch (Exception ex) {

        }
        return false;
    }

    @Override
    public List<ShopStore> getShopstoreByID_Shop(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("SELECT s from ShopStore s where s.idShopStore=:idS");
        query.setParameter("idS", idShop);

        return query.getResultList();
    }
}
