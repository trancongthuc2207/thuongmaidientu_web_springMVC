/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository.impl;

import com.tct.pojo.*;
import com.tct.repository.ProductRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        Root rootShopProduct = q.from(ShopProducts.class);
        q.select(root);


        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");

            Predicate stt = b.equal(root.get("status"), 1);
            predicates.add(stt);

            Predicate main = b.equal(root.get("idProduct"), rootShopProduct.get("product"));
            predicates.add(main);

            Predicate main2 = b.greaterThan(rootShopProduct.get("amount").as(Integer.class), 1);
            predicates.add(main2);

            String type_Id = params.get("type_Id");
            if (type_Id != null) {
                Predicate p = b.equal(root.get("idTypeProduct"), Integer.parseInt(type_Id));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public List<Product> getProductsByType(Map<String, String> params, int page, int type) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        Root rootShopProduct = q.from(ShopProducts.class);
        q.select(root);
        
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");

            Predicate stt = b.equal(root.get("status"), 1);
            predicates.add(stt);

            Predicate main = b.equal(root.get("idProduct"), rootShopProduct.get("product"));
            predicates.add(main);

            Predicate main2 = b.greaterThan(rootShopProduct.get("amount").as(Integer.class), 1);
            predicates.add(main2);

            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("nameProduct").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            String tp = params.get("toPrice");
            if (tp != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(tp));
                predicates.add(p);
            }

            String type_Id = params.get("type_Id");
            if (type_Id != null) {
                Predicate p = b.equal(root.get("typeOfProduct"), Integer.parseInt(type_Id));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public int countProduct(String full, int type) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        int sl = 0;
        if(full == "full"){
            Query q = session.createQuery("FROM Product o,ShopProducts s " +
                    "where o.idProduct=s.shopProductsPK.idProduct and o.status = 1 and s.amount > 1" +
                    "group by o.idProduct");
            sl = q.getResultList().size();
        }
        if(full != "full"){
            Query q = session.createQuery("FROM Product o,ShopProducts s " +
                    "where o.idProduct=s.shopProductsPK.idProduct and o.status = 1 and s.amount > 1" +
                    "and o.typeOfProduct.idTypeProduct =: idTy " +
                    "group by o.idProduct").setParameter("idTy",type);
            sl = q.getResultList().size();
        }
        return sl;
    }

    @Override
    public List<Product> getProductByID(Map<String, String> params, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String ID_Product = params.get("ID_Product");
            if (ID_Product != null) {
                Predicate p = b.equal(root.get("idProduct"), id);
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean updateProductByID_Product(int idPro, String name, Long unitPrice, String decrip,int typePro,String manufac, String image) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        TypeProduct type = session.get(TypeProduct.class,typePro);

        Product pro = session.get(Product.class,idPro);
        pro.setNameProduct(name);
        pro.setUnitPrice(unitPrice);
        pro.setProductDescription(decrip);
        pro.setTypeOfProduct(type);
        pro.setManufacturer(manufac);
        pro.setImage(image);
        pro.setDateCreated(new Date());
        try{
            session.update(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean updateStatusDelete_ProductByID_Product(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Product pro = session.get(Product.class,idPro);
        pro.setStatus(999);
        try{
            session.update(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean addNewProduct(String name, Long unitPrice, String decrip, int typePro, String manufac, String image, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        ShopStore shopStore = session.get(ShopStore.class,idShop);
        TypeProduct type = session.get(TypeProduct.class,typePro);

        Product pro = new Product();
        pro.setIdProduct(getID_max()+1);
        pro.setNameProduct(name);
        pro.setUnitPrice(unitPrice);
        pro.setProductDescription(decrip);
        pro.setTypeOfProduct(type);
        pro.setManufacturer(manufac);
        pro.setImage(image);
        pro.setIdShop(shopStore);
        pro.setStatus(100);
        pro.setDateCreated(new Date());
        try{
            session.save(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public int getID_max() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("from Product o ORDER BY o.idProduct DESC");
        Product pro = (Product) query.getResultList().get(0);
        return pro.getIdProduct();
    }

    @Override
    public List<Product> getProductsWaittingByID_Shop(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("select o from Product o,ShopStore s where o.idShop.idShopStore = s.idShopStore and s.idShopStore=:ids and o.status = 100 ORDER BY o.dateCreated DESC");
        query.setParameter("ids",idShop);
        return query.getResultList();
    }

    @Override
    public List<Product> getProductsDeletedByID_Shop(String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("select o from Product o,ShopStore s where o.idShop.idShopStore = s.idShopStore and s.idShopStore=:ids and o.status = 999 ORDER BY o.dateCreated DESC");
        query.setParameter("ids",idShop);
        return query.getResultList();
    }

    @Override
    public boolean updateStatusRestore_ProductByID_Product(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Product pro = session.get(Product.class,idPro);
        pro.setStatus(100);
        try{
            session.update(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean addNewProduct(Product pro,String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        ShopStore shopStore = session.get(ShopStore.class,idShop);
        pro.setIdProduct(getID_max()+1);
        pro.setIdShop(shopStore);
        pro.setStatus(100);
        pro.setDateCreated(new Date());
        try{
            session.save(pro);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public boolean updateProductByID_Product(Product proD, String idShop) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        ShopStore shopStore = session.get(ShopStore.class,idShop);
        proD.setIdShop(shopStore);
        proD.setStatus(1);
        proD.setDateCreated(new Date());
        if(proD.getFile() == null){
            Product product = session.get(Product.class, proD.getIdProduct());
            proD.setImage(product.getImage());
        }
        try{
            session.update(proD);
            return true;
        }catch (Exception ex){
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public List<Product> getProductsWaittingComfirm() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("select o from Product o where o.status = 100 ORDER BY o.dateCreated");
        return query.getResultList();
    }

    @Override
    public boolean addProduct2Shop(int idPro) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Product product = session.get(Product.class,idPro);
        product.setStatus(1);

        DiscountCode dis = session.get(DiscountCode.class,"1");

        ShopProductsPK pk = new ShopProductsPK();
        pk.setIdProduct(product.getIdProduct());
        pk.setIdShop(product.getIdShop().getIdShopStore());

        ShopProducts shopProducts = new ShopProducts();
        shopProducts.setShopProductsPK(pk);
        shopProducts.setAmount(0);
        shopProducts.setTimeBegin(new Date());
        shopProducts.setIdDiscount(dis);
        try{
            session.save(shopProducts);
            session.update(product);
            return true;
        }catch (Exception exception){

        }
        return false;
    }

    @Override
    public List<Product> getProductFavoriteOfCustomers(String idCus) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Query query = session.createSQLQuery("CALL getProductFavoriteOfCustomer(:idCus)")
                .setParameter("idCus", idCus);
        List<Object[]> lst = query.getResultList();
        if(lst.size() > 5 && lst != null){
            List<Integer> typeFavor = new ArrayList<>();
            for(Object[] t : lst){
                typeFavor.add(Integer.parseInt(t[1].toString()));
            }
            Query getPr = session.createSQLQuery("CALL getProductByFavorite(:fv1,:fv2,:fv3,:fv4,:fv5)")
                    .addEntity(Product.class)
                    .setParameter("fv1", typeFavor.get(0))
                    .setParameter("fv2", typeFavor.get(1))
                    .setParameter("fv3", typeFavor.get(2))
                    .setParameter("fv4", typeFavor.get(3))
                    .setParameter("fv5", typeFavor.get(4));
            return getPr.getResultList();
        }
        else
            return null;
    }

    @Override
    public long valueDiscountOfProduct(Product p) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Product product = session.get(Product.class,p.getIdProduct());
        ShopProductsPK sp_pk = new ShopProductsPK();
        sp_pk.setIdShop(product.getIdShop().getIdShopStore());
        sp_pk.setIdProduct(p.getIdProduct());

        ShopProducts sp = session.get(ShopProducts.class,sp_pk);
        long sum_minus = 0;
        if(sp.getIdDiscount().getValueDiscount() != null){
            sum_minus = sp.getIdDiscount().getValueDiscount();
        }
        if (sp.getIdDiscount().getPercentDiscount() != null){
            sum_minus = (sp.getIdDiscount().getPercentDiscount() * product.getUnitPrice())/100;
        }

        return sum_minus;
    }

    @Override
    public List<Product> GetProductByIDShop_Kw_Stt_posData_haveDiscount_AmountFull_increDes(String idShop, String kw, int stt, int page, String isDiscount, String isFull, String incre_des) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        int start = 0;
        if (page > 0) {
            start = (page - 1) * 20;
        }


        Query query = session.createSQLQuery("CALL GetProductByIDShop_All_Kw(:idS,:kw,:stt,:posData,:isDis,:isF,:incre_des)")
                .setParameter("idS", idShop)
                .setParameter("kw", kw)
                .setParameter("stt", stt)
                .setParameter("posData", start)
                .setParameter("isDis", isDiscount)
                .setParameter("isF", isFull)
                .setParameter("incre_des", incre_des).addEntity(Product.class);

        List<Product> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Product> GetProductIndex_All_Kw(String kw, String disCount, String incre_des, int stt, int page, String isFull) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        int start = 0;
        if (page > 0) {
            start = (page - 1) * 8;
        }


        Query query = session.createSQLQuery("CALL GetProductIndex_All_Kw(:kw,:isDis,:incre_des,:stt,:posData,:isF)")
                .setParameter("kw", kw)
                .setParameter("isDis", disCount)
                .setParameter("incre_des", incre_des)
                .setParameter("stt", stt)
                .setParameter("posData", start)
                .setParameter("isF", isFull)
                .addEntity(Product.class);

        List<Product> lst = query.getResultList();

        return lst;
    }

    @Override
    public List<Object[]> GetProductHotSaleByIdShop(String idShop, Date dateMonth) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        List<Object[]> lst = new ArrayList<>();

        if(dateMonth == null){
            Query query = session.createSQLQuery("CALL getProductSaledHotByIDShop_Full(:idS)")
                    .setParameter("idS", idShop);
            lst = query.getResultList();
        }
        if(dateMonth != null){
            Query query = session.createSQLQuery("CALL getProductSaledHotByIDShop_Month(:idS,:dateM)")
                    .setParameter("idS", idShop)
                    .setParameter("dateM", dateMonth);
            lst = query.getResultList();
        }

        return lst;
    }

}
