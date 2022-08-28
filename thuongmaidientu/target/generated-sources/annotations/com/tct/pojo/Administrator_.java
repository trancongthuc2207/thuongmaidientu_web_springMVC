package com.tct.pojo;

import com.tct.pojo.PositionStaff;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-27T18:48:05")
@StaticMetamodel(Administrator.class)
public class Administrator_ { 

    public static volatile SingularAttribute<Administrator, String> idAcc;
    public static volatile SingularAttribute<Administrator, Integer> idAdmin;
    public static volatile SingularAttribute<Administrator, String> usernameAd;
    public static volatile SingularAttribute<Administrator, PositionStaff> positionStaff;
    public static volatile SingularAttribute<Administrator, String> passwordAd;
    public static volatile SingularAttribute<Administrator, Integer> idPos;

}