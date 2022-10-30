package com.tct.pojo;

import com.tct.pojo.Account;
import com.tct.pojo.DiscountCode;
import com.tct.pojo.Product;
import com.tct.pojo.Report;
import com.tct.pojo.ShopProducts;
import com.tct.pojo.TypeProduct;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(ShopStore.class)
public class ShopStore_ { 

    public static volatile SingularAttribute<ShopStore, String> imageS;
    public static volatile SingularAttribute<ShopStore, TypeProduct> ortherType1;
    public static volatile SingularAttribute<ShopStore, TypeProduct> ortherType2;
    public static volatile SingularAttribute<ShopStore, Integer> rating;
    public static volatile SetAttribute<ShopStore, ShopProducts> shopProductsSet;
    public static volatile SingularAttribute<ShopStore, TypeProduct> mainType;
    public static volatile SetAttribute<ShopStore, Product> productSet;
    public static volatile SingularAttribute<ShopStore, Date> dateBegin;
    public static volatile SingularAttribute<ShopStore, Account> idAcc;
    public static volatile SingularAttribute<ShopStore, String> idShopStore;
    public static volatile SingularAttribute<ShopStore, String> nameStore;
    public static volatile SetAttribute<ShopStore, DiscountCode> discountCodeSet;
    public static volatile SetAttribute<ShopStore, Report> reportSet;

}