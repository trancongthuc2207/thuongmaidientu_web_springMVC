package com.tct.pojo;

import com.tct.pojo.Report;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-22T18:25:28")
@StaticMetamodel(TypeReport.class)
public class TypeReport_ { 

    public static volatile SingularAttribute<TypeReport, String> pos;
    public static volatile SingularAttribute<TypeReport, String> nameRp;
    public static volatile SingularAttribute<TypeReport, Integer> idTypeRp;
    public static volatile SetAttribute<TypeReport, Report> reportSet;

}