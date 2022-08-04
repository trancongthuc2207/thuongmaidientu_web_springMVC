package com.tct.pojo;

import com.tct.pojo.AccountShop;
import com.tct.pojo.Administrator;
import com.tct.pojo.Customers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(PositionStaff.class)
public class PositionStaff_ { 

    public static volatile SetAttribute<PositionStaff, AccountShop> accountShopSet;
    public static volatile SingularAttribute<PositionStaff, Administrator> administrator;
    public static volatile SingularAttribute<PositionStaff, Integer> idPosition;
    public static volatile SingularAttribute<PositionStaff, String> namePosition;
    public static volatile SetAttribute<PositionStaff, Customers> customersSet;
    public static volatile SingularAttribute<PositionStaff, String> descriptions;

}