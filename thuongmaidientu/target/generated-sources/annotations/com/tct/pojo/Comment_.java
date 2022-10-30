package com.tct.pojo;

import com.tct.pojo.Customers;
import com.tct.pojo.Product;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, Product> idProCmt;
    public static volatile SingularAttribute<Comment, Integer> idComment;
    public static volatile SingularAttribute<Comment, Customers> idCusCmt;
    public static volatile SingularAttribute<Comment, String> stt;
    public static volatile SingularAttribute<Comment, Integer> rate;
    public static volatile SingularAttribute<Comment, Date> dateRepair;
    public static volatile SingularAttribute<Comment, Date> dateCreate;
    public static volatile SingularAttribute<Comment, String> content;

}