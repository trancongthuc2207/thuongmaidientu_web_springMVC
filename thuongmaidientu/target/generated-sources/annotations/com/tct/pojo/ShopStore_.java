package com.tct.pojo;

import com.tct.pojo.AccountShop;
import com.tct.pojo.DiscountCode;
import com.tct.pojo.Orders;
import com.tct.pojo.Product;
import com.tct.pojo.ShopProducts;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(ShopStore.class)
public class ShopStore_ { 

    public static volatile SingularAttribute<ShopStore, String> idShopStore;
    public static volatile SingularAttribute<ShopStore, AccountShop> idAccountS;
    public static volatile SingularAttribute<ShopStore, String> nameStore;
    public static volatile SetAttribute<ShopStore, DiscountCode> discountCodeSet;
    public static volatile SetAttribute<ShopStore, ShopProducts> shopProductsSet;
    public static volatile SetAttribute<ShopStore, Orders> ordersSet;
    public static volatile SetAttribute<ShopStore, Product> productSet;

}