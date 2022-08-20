package com.tct.pojo;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.ShopProducts;
import com.tct.pojo.ShopStore;
import com.tct.pojo.TypeProduct;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-08-20T21:24:43")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Long> unitPrice;
    public static volatile SetAttribute<Product, OrderDetails> orderDetailsSet;
    public static volatile SingularAttribute<Product, String> image;
    public static volatile SingularAttribute<Product, ShopStore> idShop;
    public static volatile SingularAttribute<Product, TypeProduct> typeOfProduct;
    public static volatile SingularAttribute<Product, Integer> idProduct;
    public static volatile SetAttribute<Product, ShopProducts> shopProductsSet;
    public static volatile SingularAttribute<Product, String> nameProduct;
    public static volatile SingularAttribute<Product, String> productDescription;
    public static volatile SingularAttribute<Product, String> manufacturer;
    public static volatile SingularAttribute<Product, Integer> status;

}