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
import java.util.List;
import java.util.Map;

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

    @Override
    public List<ShopProducts> getShopProductByID_Shop(Map<String, String> params, int page, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query q = session.createQuery("from ShopProducts where shopProductsPK.idShop=:idPK");
        q.setParameter("idPK", idShop);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }

        return q.getResultList();
    }

    @Override
    public int countProduct_ShopByID_Shop(String idShop) {
        if(idShop != null){
            Session session = this.sessionFactory.getObject().getCurrentSession();

            Query q = session.createQuery("from ShopProducts where shopProductsPK.idShop=:idPK");
            q.setParameter("idPK", idShop);

            return q.getResultList().size();
        }
        return 0;
    }

    @Override
    public boolean updateAmountPro_Shop(String idShop, int idProduct, int sl) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            ShopProductsPK pk = new ShopProductsPK();
            pk.setIdShop(idShop);
            pk.setIdProduct(idProduct);

            ShopProducts shopPro = session.get(ShopProducts.class, pk);
            shopPro.setAmount(sl);
            session.update(shopPro);
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }
}
