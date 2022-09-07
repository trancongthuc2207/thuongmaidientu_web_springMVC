package com.tct.repository.impl;

import com.tct.pojo.TypeProduct;
import com.tct.pojo.TypeReport;
import com.tct.repository.Type_ReportRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class Type_ReportRepositoryImpl implements Type_ReportRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private Environment env;

    @Override
    public List<TypeReport> getType_Report(String pos) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from TypeReport o where o.pos=:posit");
        query.setParameter("posit", pos);
        return query.getResultList();
    }
}
