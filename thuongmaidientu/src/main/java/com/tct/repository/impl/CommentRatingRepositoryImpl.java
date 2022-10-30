package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.CommentRatingRepository;
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
public class CommentRatingRepositoryImpl implements CommentRatingRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;


    @Override
    public List<Comment> getCommentsByIdProduct(int idPro, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createQuery("from Comment c where c.idProCmt.idProduct =: idP and c.stt = '1' order by c.dateCreate desc ")
                .setParameter("idP",idPro);

        if (page > 0) {
            int start = (page - 1) * 20;
            query.setFirstResult(start);
            query.setMaxResults(20);
        }

        return query.getResultList();
    }

    @Override
    public boolean addNewComment(Comment cmt, int idPro, String idCus) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Product pro = session.get(Product.class,idPro);
        Customers cus = session.get(Customers.class,idCus);
        cmt.setIdCusCmt(cus);
        cmt.setIdProCmt(pro);
        cmt.setStt("1");
        cmt.setDateCreate(new Date());
        try{
            session.save(cmt);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public int getIdCommentMax() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Comment c ORDER BY c.idComment DESC");
        Comment cmt = (Comment) query.getResultList().get(0);
        return cmt.getIdComment();
    }
}
