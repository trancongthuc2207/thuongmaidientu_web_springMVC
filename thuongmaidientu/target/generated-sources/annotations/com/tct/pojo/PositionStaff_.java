package com.tct.pojo;

import com.tct.pojo.Account;
import com.tct.pojo.Administrator;
import com.tct.pojo.Customers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-20T21:24:43")
@StaticMetamodel(PositionStaff.class)
public class PositionStaff_ { 

    public static volatile SingularAttribute<PositionStaff, Administrator> administrator;
    public static volatile SingularAttribute<PositionStaff, Integer> idPosition;
    public static volatile SetAttribute<PositionStaff, Account> accountSet;
    public static volatile SingularAttribute<PositionStaff, String> namePosition;
    public static volatile SetAttribute<PositionStaff, Customers> customersSet;
    public static volatile SingularAttribute<PositionStaff, String> descriptions;

}