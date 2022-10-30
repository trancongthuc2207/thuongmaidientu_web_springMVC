package com.tct.pojo;

import com.tct.pojo.Comment;
import com.tct.pojo.Orders;
import com.tct.pojo.Report;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(Customers.class)
public class Customers_ { 

    public static volatile SingularAttribute<Customers, Integer> vipPos;
    public static volatile SingularAttribute<Customers, String> image;
    public static volatile SingularAttribute<Customers, String> nameC;
    public static volatile SingularAttribute<Customers, String> address;
    public static volatile SingularAttribute<Customers, String> sex;
    public static volatile SetAttribute<Customers, Orders> ordersSet;
    public static volatile SingularAttribute<Customers, String> idCustomer;
    public static volatile SingularAttribute<Customers, Integer> idAcc;
    public static volatile SingularAttribute<Customers, String> phoneNumber;
    public static volatile SetAttribute<Customers, Comment> commentSet;
    public static volatile SingularAttribute<Customers, String> serialNumberC;
    public static volatile SingularAttribute<Customers, String> email;
    public static volatile SetAttribute<Customers, Report> reportSet;

}