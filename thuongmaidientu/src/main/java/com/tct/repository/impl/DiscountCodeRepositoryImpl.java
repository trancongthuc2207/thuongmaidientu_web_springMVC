package com.tct.repository.impl;

import com.tct.pojo.DiscountCode;
import com.tct.pojo.ShopStore;
import com.tct.repository.DiscountCodeRepository;
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
public class DiscountCodeRepositoryImpl implements DiscountCodeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<DiscountCode> getDiscountByID_Shop(String idShop, int status) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("select d from DiscountCode d, ShopStore s where d.idShopDeli.idShopStore=:id and  d.status=:stt and s.idShopStore=:idS and d.idDiscount != '1'");
        query.setParameter("id", idShop);
        query.setParameter("stt", status);
        query.setParameter("idS", idShop);
        return query.getResultList();
    }

    @Override
    public boolean addNewDiscount(DiscountCode dis, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        ShopStore shopStore = session.get(ShopStore.class, idShop);
        dis.setIdDiscount(idShop + "#" + dis.getIdDiscount());
        dis.setStatus(1);
        dis.setIdShopDeli(shopStore);
        try {
//            if(dis.getIdDiscount().contains("#")){
            session.save(dis);
            return true;
//            } else
//                return false;
        } catch (Exception ex) {
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean updateSttDiscount(String idDis, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("update DiscountCode set status =:st where idDiscount =: idDis ");
        query.setParameter("idDis", idDis);
        query.setParameter("st", Integer.parseInt(stt));

        Query query_ShopPro = session.createQuery("update ShopProducts set idDiscount.idDiscount = '1' where idDiscount.idDiscount =: idDis ");
        query_ShopPro.setParameter("idDis", idDis);

        try {
            query.executeUpdate();
            if (Integer.parseInt(stt) == 0) {
                query_ShopPro.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<DiscountCode> getDiscountByEmployee(int page, int stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(stt == 1){
            Query query = session.createQuery("from DiscountCode where status = 1 and idDiscount != '1'");
            if (page > 0) {
                int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
                int start = (page - 1) * size;
                query.setFirstResult(start);
                query.setMaxResults(size);
            }
            return query.getResultList();
        }
        if(stt == 0){
            Query query = session.createQuery("from DiscountCode where status = 0 and idDiscount != '1'");
            if (page > 0) {
                int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
                int start = (page - 1) * size;
                query.setFirstResult(start);
                query.setMaxResults(size);
            }
            return query.getResultList();
        }
        if(stt == 2){
            Query query = session.createQuery("from DiscountCode where status = 2 and idDiscount != '1'");
            if (page > 0) {
                int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
                int start = (page - 1) * size;
                query.setFirstResult(start);
                query.setMaxResults(size);
            }
            return query.getResultList();
        }
        if(stt == 100){
            Query query = session.createQuery("from DiscountCode where idDiscount != '1'");
            if (page > 0) {
                int size = Integer.parseInt(env.getProperty("pageOrderShop.size").toString());
                int start = (page - 1) * size;
                query.setFirstResult(start);
                query.setMaxResults(size);
            }
            return query.getResultList();
        }
        return null;
    }

    @Override
    public int countDiscountCode(int stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(stt == 1){
            Query query = session.createQuery("from DiscountCode where status = 1 and idDiscount != '1'");
            return query.getResultList().size();
        }
        if(stt == 0){
            Query query = session.createQuery("from DiscountCode where status = 0 and idDiscount != '1'");

            return query.getResultList().size();
        }
        if(stt == 2){
            Query query = session.createQuery("from DiscountCode where status = 2 and idDiscount != '1'");
            return query.getResultList().size();
        }
        if(stt == 100){
            Query query = session.createQuery("from DiscountCode where idDiscount != '1'");
            return query.getResultList().size();
        }
        return 0;
    }

}
