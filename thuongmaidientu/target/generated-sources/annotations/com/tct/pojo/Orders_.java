package com.tct.pojo;

import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SetAttribute<Orders, OrderDetails> orderDetailsSet;
    public static volatile SingularAttribute<Orders, Date> timeDelivery;
    public static volatile SingularAttribute<Orders, Date> timeCancle;
    public static volatile SingularAttribute<Orders, String> reasonCancle;
    public static volatile SingularAttribute<Orders, Long> totalMoney;
    public static volatile SingularAttribute<Orders, String> paymentMethod;
    public static volatile SingularAttribute<Orders, Date> timeBooked;
    public static volatile SingularAttribute<Orders, String> cancleFrom;
    public static volatile SingularAttribute<Orders, Long> idOrders;
    public static volatile SingularAttribute<Orders, String> status;
    public static volatile SingularAttribute<Orders, Customers> customer;

}