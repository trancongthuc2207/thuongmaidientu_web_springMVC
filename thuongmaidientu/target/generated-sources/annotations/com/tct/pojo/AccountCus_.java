package com.tct.pojo;

import com.tct.pojo.Customers;
import com.tct.pojo.PositionStaff;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-13T17:56:10")
@StaticMetamodel(AccountCus.class)
public class AccountCus_ { 

    public static volatile SingularAttribute<AccountCus, String> passwordC;
    public static volatile SingularAttribute<AccountCus, String> usernameC;
    public static volatile SingularAttribute<AccountCus, Customers> customers;
    public static volatile SingularAttribute<AccountCus, String> idAccountCus;
    public static volatile SingularAttribute<AccountCus, PositionStaff> idPos;

}