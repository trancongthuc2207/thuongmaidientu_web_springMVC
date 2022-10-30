package com.tct.pojo;

import com.tct.pojo.PositionStaff;
import com.tct.pojo.ShopStore;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(Account.class)
public class Account_ { 

    public static volatile SingularAttribute<Account, Integer> idAccount;
    public static volatile SingularAttribute<Account, String> stt;
    public static volatile SingularAttribute<Account, String> passwordC;
    public static volatile SetAttribute<Account, ShopStore> shopStoreSet;
    public static volatile SingularAttribute<Account, String> usernameC;
    public static volatile SingularAttribute<Account, PositionStaff> idPos;

}