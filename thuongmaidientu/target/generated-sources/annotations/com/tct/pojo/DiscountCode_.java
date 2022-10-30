package com.tct.pojo;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.ShopProducts;
import com.tct.pojo.ShopStore;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(DiscountCode.class)
public class DiscountCode_ { 

    public static volatile SetAttribute<DiscountCode, OrderDetails> orderDetailsSet;
    public static volatile SingularAttribute<DiscountCode, String> idDiscount;
    public static volatile SingularAttribute<DiscountCode, Long> valueDiscount;
    public static volatile SingularAttribute<DiscountCode, Date> dateFinishDis;
    public static volatile SingularAttribute<DiscountCode, ShopStore> idShopDeli;
    public static volatile SingularAttribute<DiscountCode, Date> dateBeginDis;
    public static volatile SingularAttribute<DiscountCode, String> nameDiscount;
    public static volatile SetAttribute<DiscountCode, ShopProducts> shopProductsSet;
    public static volatile SingularAttribute<DiscountCode, Long> percentDiscount;
    public static volatile SingularAttribute<DiscountCode, Integer> status;

}