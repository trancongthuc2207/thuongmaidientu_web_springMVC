package com.tct.repository.impl;

import com.tct.pojo.Account;
import com.tct.repository.AccountRepository;
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
public class AccountRepositoryImpl implements AccountRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Account> getAccountByEmployee() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Account");
        return query.getResultList();
    }

    @Override
    public boolean updateSTT_Account(int idAcc_role, int idAccUpdate, String stt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query_accRole = session.createQuery("from Account where idAccount =:stRole").setParameter("stRole",idAcc_role);
        Account role = (Account) query_accRole.getResultList().get(0);
        System.out.println("ABCCCCCCC: "+ role.getStt());
        if(role.getStt().equals("actived")){
            Query query_accUpdate = session.createQuery("update Account set stt =: st where idAccount =:stU")
                    .setParameter("stU",idAccUpdate)
                    .setParameter("st",stt);
            try{
                query_accUpdate.executeUpdate();
                return true;
            }catch (Exception e){
                return false;
            }
        }

        return false;
    }
}
