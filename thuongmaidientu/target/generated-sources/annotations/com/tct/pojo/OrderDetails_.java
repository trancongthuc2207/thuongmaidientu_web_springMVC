package com.tct.pojo;

import com.tct.pojo.DiscountCode;
import com.tct.pojo.OrderDetailsPK;
import com.tct.pojo.Orders;
import com.tct.pojo.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Long> unitPrice;
    public static volatile SingularAttribute<OrderDetails, OrderDetailsPK> orderDetailsPK;
    public static volatile SingularAttribute<OrderDetails, DiscountCode> idDiscount;
    public static volatile SingularAttribute<OrderDetails, Integer> amount;
    public static volatile SingularAttribute<OrderDetails, Product> product;
    public static volatile SingularAttribute<OrderDetails, Orders> orders;

}