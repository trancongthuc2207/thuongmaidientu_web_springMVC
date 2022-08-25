package com.tct.pojo;

import com.tct.pojo.Account;
import com.tct.pojo.DiscountCode;
import com.tct.pojo.Product;
import com.tct.pojo.ShopProducts;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-24T18:44:47")
@StaticMetamodel(ShopStore.class)
public class ShopStore_ { 

    public static volatile SingularAttribute<ShopStore, Account> idAcc;
    public static volatile SingularAttribute<ShopStore, String> idShopStore;
    public static volatile SingularAttribute<ShopStore, String> nameStore;
    public static volatile SetAttribute<ShopStore, DiscountCode> discountCodeSet;
    public static volatile SetAttribute<ShopStore, ShopProducts> shopProductsSet;
    public static volatile SetAttribute<ShopStore, Product> productSet;

}