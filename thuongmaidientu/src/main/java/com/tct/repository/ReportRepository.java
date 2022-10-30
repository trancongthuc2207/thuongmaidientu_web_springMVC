package com.tct.repository;

import com.tct.pojo.Report;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;

import java.util.List;
import java.util.Map;

public interface ReportRepository {
    int getID_max();
    boolean addReportConfirmProFromEmploy2Shop(int typeRp,String idShop, String descrip,String idEmploy, int idPro);

    int countReportShop(String idShop);

    List<Report> getReportByID_Shop(Map<String, String> params, String idShop, String pos);

    boolean confirmOrderReportByShop(int idPro);

    boolean checkReportByShop_Pro(int idPro);

    List<Report> getReportForCus(Map<String, String> params, String pos);


    boolean addReportFromCus2Product(int typeRp,String idShop, String descrip,String idCus, int idPro);

    List<Report> getListReportOfCustomerToShopProduct(String kw, String stt, int page);
}
