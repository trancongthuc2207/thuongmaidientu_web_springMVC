package com.tct.pojo;

import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
import com.tct.pojo.ShopStore;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SetAttribute<Orders, OrderDetails> orderDetailsSet;
    public static volatile SingularAttribute<Orders, ShopStore> idShopStore;
    public static volatile SingularAttribute<Orders, Long> totalMoney;
    public static volatile SingularAttribute<Orders, Date> timeBooked;
    public static volatile SingularAttribute<Orders, Long> idOrders;
    public static volatile SingularAttribute<Orders, String> status;
    public static volatile SingularAttribute<Orders, Customers> idCustomer;

}