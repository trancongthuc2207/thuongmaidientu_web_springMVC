package com.tct.repository.impl;

import com.tct.pojo.ShopProducts;
import com.tct.pojo.ShopProductsPK;
import com.tct.repository.ShopProductRepository;
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
public class ShopProductRepositoryImpl implements ShopProductRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public boolean updateAmountPro_booked(String idShop, int idProduct, int sl) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            ShopProductsPK pk = new ShopProductsPK();
            pk.setIdShop(idShop);
            pk.setIdProduct(idProduct);

            ShopProducts shopPro = session.get(ShopProducts.class, pk);
            int stamp = shopPro.getAmount();
            shopPro.setAmount(stamp - sl);
            session.update(shopPro);
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean checkAmount_book(String idShop, int idProduct, int sld) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            ShopProductsPK pk = new ShopProductsPK();
            pk.setIdShop(idShop);
            pk.setIdProduct(idProduct);

            ShopProducts shopPro = session.get(ShopProducts.class, pk);
            if (sld > 0 && sld < shopPro.getAmount())
                return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public List<ShopProducts> getShopProductByPK(String idShop, int idProduct) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        ShopProductsPK pk = new ShopProductsPK();
        pk.setIdShop(idShop);
        pk.setIdProduct(idProduct);

        Query q = session.createQuery("from ShopProducts where shopProductsPK=:idPK");
        q.setParameter("idPK", pk);

        return q.getResultList();
    }
}
