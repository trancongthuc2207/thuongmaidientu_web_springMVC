package com.tct.service.impl;

import com.tct.pojo.Report;
import com.tct.repository.ReportRepository;
import com.tct.service.ReportService;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportRepository reportRepository;

    @Override
    public boolean addReportConfirmProFromEmploy2Shop(int typeRp, String idShop, String descrip, String idEmploy, int idPro) {
        return this.reportRepository.addReportConfirmProFromEmploy2Shop(typeRp,idShop,descrip,idEmploy,idPro);
    }

    @Override
    public int countReportShop(String idShop) {
        return this.reportRepository.countReportShop(idShop);
    }

    @Override
    public List<Report> getReportByID_Shop(Map<String, String> params, String idShop, String pos) {
        return this.reportRepository.getReportByID_Shop(params,idShop,pos);
    }

    @Override
    public boolean confirmOrderReportByShop( int idPro) {
        return this.reportRepository.confirmOrderReportByShop(idPro);
    }

    @Override
    public boolean checkReportByShop_Pro(int idPro) {
        return this.reportRepository.checkReportByShop_Pro(idPro);
    }

    @Override
    public List<Report> getReportForCus(Map<String, String> params, String pos) {
        return this.reportRepository.getReportForCus(params,pos);
    }

    @Override
    public boolean addReportFromCus2Product(int typeRp, String idShop, String descrip, String idCus, int idPro) {
        return this.reportRepository.addReportFromCus2Product(typeRp,idShop,descrip,idCus,idPro);
    }

    @Override
    public List<Report> getListReportOfCustomerToShopProduct(String kw, String stt, int page) {
        return this.reportRepository.getListReportOfCustomerToShopProduct(kw, stt, page);
    }

}
