package com.tct.pojo;

import com.tct.pojo.PositionStaff;
import com.tct.pojo.ShopStore;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-04T15:43:25")
@StaticMetamodel(AccountShop.class)
public class AccountShop_ { 

    public static volatile SingularAttribute<AccountShop, String> idAccountS;
    public static volatile SingularAttribute<AccountShop, String> passwordS;
    public static volatile SetAttribute<AccountShop, ShopStore> shopStoreSet;
    public static volatile SingularAttribute<AccountShop, String> usernameS;
    public static volatile SingularAttribute<AccountShop, PositionStaff> idPos;

}