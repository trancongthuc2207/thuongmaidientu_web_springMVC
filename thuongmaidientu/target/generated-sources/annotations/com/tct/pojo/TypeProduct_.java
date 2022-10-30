package com.tct.pojo;

import com.tct.pojo.Product;
import com.tct.pojo.ShopStore;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(TypeProduct.class)
public class TypeProduct_ { 

    public static volatile SetAttribute<TypeProduct, ShopStore> shopStoreSet;
    public static volatile SetAttribute<TypeProduct, ShopStore> shopStoreSet2;
    public static volatile SetAttribute<TypeProduct, ShopStore> shopStoreSet1;
    public static volatile SingularAttribute<TypeProduct, String> typeName;
    public static volatile SingularAttribute<TypeProduct, String> description;
    public static volatile SingularAttribute<TypeProduct, Integer> idTypeProduct;
    public static volatile SetAttribute<TypeProduct, Product> productSet;

}