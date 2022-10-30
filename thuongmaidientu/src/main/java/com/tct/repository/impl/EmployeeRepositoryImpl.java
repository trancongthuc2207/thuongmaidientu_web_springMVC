package com.tct.repository.impl;


import com.tct.pojo.ShopStore;
import com.tct.repository.EmployeeRepository;
import com.tct.repository.OrdersRepository;
import com.tct.repository.ShopProductRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class EmployeeRepositoryImpl implements EmployeeRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Autowired
    private OrdersRepository ordersRepository;
    @Autowired
    private ShopProductRepository shopProductRepository;


    @Override
    public List<Object[]> getFullIn4Shop(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        int start = 0;
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            start = (page - 1) * size;
        }


        List<Object[]> in4 = new ArrayList<>();
        Query query_CanBuy = session.createSQLQuery("CALL getIn4ShopAndSLProductCanBuy(:kw,:page)")
                .setParameter("kw", "")
                .setParameter("page", start);
        List<Object[]> lst_canBuy = query_CanBuy.getResultList();

        for(Object[] i : lst_canBuy){
            Query query_waitingBuy = session.createSQLQuery("CALL getSLProductCanTBuyByIDShop(:idShop,:stt_pro)")
                    .setParameter("idShop", i[0].toString())
                    .setParameter("stt_pro", 100);
            List<Object[]> lst_waiting = query_waitingBuy.getResultList();

            Query query_rpNoRep = session.createSQLQuery("CALL getSLReportByIDShop(:idShop,:stt_rp)")
                    .setParameter("idShop", i[0].toString())
                    .setParameter("stt_rp", 1);
            List<Object[]> lst_rp = query_rpNoRep.getResultList();

            boolean checkWaitingBuy = false;
            boolean checkRpNoRep = false;
            if(lst_waiting.size() != 0)
                checkWaitingBuy = true;
            if(lst_rp.size() != 0)
                checkRpNoRep = true;

            if(checkWaitingBuy == false && checkRpNoRep == false){
                Object[] obj = new Object[]{
                        i[0].toString(),
                        i[1].toString(),
                        i[2].toString(),
                        i[3].toString(),
                        String.valueOf(0),
                        String.valueOf(0),
                        i[4].toString()
                };
                in4.add(obj);
            } else if (checkWaitingBuy == true && checkRpNoRep == false) {
                Object[] obj = new Object[]{
                        i[0].toString(),
                        i[1].toString(),
                        i[2].toString(),
                        i[3].toString(),
                        lst_waiting.get(0)[1].toString(),
                        String.valueOf(0),
                        i[4].toString()
                };
                in4.add(obj);
            } else if (checkWaitingBuy == false && checkRpNoRep == true) {
                Object[] obj = new Object[]{
                        i[0].toString(),
                        i[1].toString(),
                        i[2].toString(),
                        i[3].toString(),
                        String.valueOf(0),
                        lst_rp.get(0)[1].toString(),
                        i[4].toString()
                };
                in4.add(obj);
            } else if (checkWaitingBuy && checkRpNoRep) {
                Object[] obj = new Object[]{
                        i[0].toString(),
                        i[1].toString(),
                        i[2].toString(),
                        i[3].toString(),
                        lst_waiting.get(0)[1].toString(),
                        lst_rp.get(0)[1].toString(),
                        i[4].toString()
                };
                in4.add(obj);
            }

        }

        return in4;
    }

    @Override
    public int countShopActive() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from ShopStore ");

        return query.getResultList().size();
    }
}
