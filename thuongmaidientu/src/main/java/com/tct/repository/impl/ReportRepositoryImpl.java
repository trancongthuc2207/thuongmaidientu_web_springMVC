package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.ReportRepository;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;
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
import java.util.Map;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class ReportRepositoryImpl implements ReportRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public int getID_max() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Report o ORDER BY o.idRp DESC");
        Report report = (Report) query.getResultList().get(0);
        return report.getIdRp();
    }

    @Override
    public boolean addReportConfirmProFromEmploy2Shop(int typeRp, String idShop, String descrip, String idEmploy, int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        TypeReport type = session.get(TypeReport.class, typeRp);
        ShopStore shopStore = session.get(ShopStore.class, idShop);
        Product product = session.get(Product.class, idPro);

        Report report = new Report();
        report.setIdRp(getID_max() + 1);
        report.setIdTypeReport(type);
        report.setIdShopStore(shopStore);
        report.setDescriptionRp(descrip);
        report.setIdProduct(product);
        report.setDateRp(new Date());
        report.setStt("1");

        try {
            session.save(report);
            return true;
        } catch (Exception ex) {

        }
        return false;
    }

    @Override
    public int countReportShop(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Report o where o.idShopStore.idShopStore=:idS and o.stt = '1' ");
        query.setParameter("idS", idShop);
        return query.getResultList().size();
    }

    @Override
    public List<Report> getReportByID_Shop(Map<String, String> params, String idShop, String pos) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Report o where o.idTypeReport.pos=:posit and o.idShopStore.idShopStore=:idS and o.stt = '1' ");
        query.setParameter("idS", idShop);
        query.setParameter("posit", pos);
        return query.getResultList();
    }

    @Override
    public boolean confirmOrderReportByShop(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Product product = session.get(Product.class,idPro);
        try {
            Query query = session.createSQLQuery("CALL confirmOrderReportByShop(:idS,:idP)")
                    .addEntity(Report.class)
                    .setParameter("idS", product.getIdShop().getIdShopStore())
                    .setParameter("idP", idPro);
            query.executeUpdate();
            return true;
        } catch (Exception exception) {

        }
        return false;
    }

    @Override
    public boolean checkReportByShop_Pro(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Product product = session.get(Product.class,idPro);

        Query query = session.createQuery("from Report o where o.idProduct.idProduct=:idP and o.idTypeReport.pos=:posit and o.idShopStore.idShopStore=:idS and o.stt = '1' ");
        query.setParameter("idS", product.getIdShop().getIdShopStore());
        query.setParameter("idP", idPro);
        query.setParameter("posit", "app");
        if(query.getResultList().size() > 0)
            return true;
        return false;
    }

    @Override
    public List<Report> getReportForCus(Map<String, String> params, String pos) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Report o where o.idTypeReport.pos=:posit and o.stt = '1' ");
        query.setParameter("posit", pos);
        return query.getResultList();
    }

    @Override
    public boolean addReportFromCus2Product(int typeRp, String idShop, String descrip, String idCus, int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        TypeReport type = session.get(TypeReport.class, typeRp);
        ShopStore shopStore = session.get(ShopStore.class, idShop);
        Product product = session.get(Product.class, idPro);
        Customers customers = session.get(Customers.class,idCus);


        Report report = new Report();
        report.setIdRp(getID_max() + 1);
        report.setIdTypeReport(type);
        report.setIdShopStore(shopStore);
        report.setDescriptionRp(descrip);
        report.setIdProduct(product);
        report.setDateRp(new Date());
        report.setStt("1");
        report.setIdCus(customers);
        try {
            session.save(report);
            return true;
        } catch (Exception ex) {

        }
        return false;
    }

    @Override
    public List<Report> getListReportOfCustomerToShopProduct(String kw, String stt, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Report o where o.idTypeReport.pos = 'customer' and o.stt =:st ")
                .setParameter("st", stt);
        return query.getResultList();
    }
}
