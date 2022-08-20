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

        Predicate predicate = b.equal(root.get("idAcc"),id);
        q.where(predicate);

        Query query = session.createQuery(q);
        return (Customers) query.getSingleResult();
    }
}
