package com.tct.pojo;

import com.tct.pojo.DiscountCode;
import com.tct.pojo.Product;
import com.tct.pojo.ShopProductsPK;
import com.tct.pojo.ShopStore;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(ShopProducts.class)
public class ShopProducts_ { 

    public static volatile SingularAttribute<ShopProducts, DiscountCode> idDiscount;
    public static volatile SingularAttribute<ShopProducts, Integer> amount;
    public static volatile SingularAttribute<ShopProducts, Product> product;
    public static volatile SingularAttribute<ShopProducts, Date> timeBegin;
    public static volatile SingularAttribute<ShopProducts, ShopProductsPK> shopProductsPK;
    public static volatile SingularAttribute<ShopProducts, ShopStore> shopStore;
    public static volatile SingularAttribute<ShopProducts, Date> timeFinish;

}