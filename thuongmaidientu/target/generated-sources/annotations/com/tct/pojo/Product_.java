package com.tct.pojo;

import com.tct.pojo.Comment;
import com.tct.pojo.OrderDetails;
import com.tct.pojo.Report;
import com.tct.pojo.ShopProducts;
import com.tct.pojo.ShopStore;
import com.tct.pojo.TypeProduct;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Long> unitPrice;
    public static volatile SingularAttribute<Product, String> image;
    public static volatile SingularAttribute<Product, ShopStore> idShop;
    public static volatile SingularAttribute<Product, TypeProduct> typeOfProduct;
    public static volatile SetAttribute<Product, ShopProducts> shopProductsSet;
    public static volatile SingularAttribute<Product, String> manufacturer;
    public static volatile SetAttribute<Product, OrderDetails> orderDetailsSet;
    public static volatile SingularAttribute<Product, Date> dateCreated;
    public static volatile SetAttribute<Product, Comment> commentSet;
    public static volatile SingularAttribute<Product, Integer> idProduct;
    public static volatile SingularAttribute<Product, String> nameProduct;
    public static volatile SingularAttribute<Product, String> productDescription;
    public static volatile SetAttribute<Product, Report> reportSet;
    public static volatile SingularAttribute<Product, Integer> status;

}