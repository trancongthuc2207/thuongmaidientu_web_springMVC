package com.tct.pojo;

import com.tct.pojo.Customers;
import com.tct.pojo.Product;
import com.tct.pojo.ShopStore;
import com.tct.pojo.TypeReport;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-27T18:48:05")
@StaticMetamodel(Report.class)
public class Report_ { 

    public static volatile SingularAttribute<Report, Customers> idCus;
    public static volatile SingularAttribute<Report, String> stt;
    public static volatile SingularAttribute<Report, ShopStore> idShopStore;
    public static volatile SingularAttribute<Report, TypeReport> idTypeReport;
    public static volatile SingularAttribute<Report, Integer> idRp;
    public static volatile SingularAttribute<Report, Product> idProduct;
    public static volatile SingularAttribute<Report, String> idEmplSolve;
    public static volatile SingularAttribute<Report, String> dateRp;
    public static volatile SingularAttribute<Report, String> descriptionRp;
    public static volatile SingularAttribute<Report, String> dateSolve;

}