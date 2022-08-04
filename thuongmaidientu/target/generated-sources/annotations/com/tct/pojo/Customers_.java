package com.tct.pojo;

import com.tct.pojo.Orders;
import com.tct.pojo.PositionStaff;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(Customers.class)
public class Customers_ { 

    public static volatile SingularAttribute<Customers, PositionStaff> vipPos;
    public static volatile SingularAttribute<Customers, String> nameC;
    public static volatile SingularAttribute<Customers, String> phoneNumber;
    public static volatile SingularAttribute<Customers, String> address;
    public static volatile SingularAttribute<Customers, String> sex;
    public static volatile SingularAttribute<Customers, String> serialNumberC;
    public static volatile SetAttribute<Customers, Orders> ordersSet;
    public static volatile SingularAttribute<Customers, String> idCustomer;

}