package com.tct.controllers;


import com.tct.pojo.Product;
import com.tct.pojo.Report;
import com.tct.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiReportController {
//    int typeRp, String idShop, String descrip, String idEmploy
    @Autowired
    private ReportService reportService;

    @PostMapping(path = "/send-rp-employee-shop" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Report> updatePro(@RequestBody Map<String,String> params){
        int typeRp = Integer.parseInt(params.get("typeRp"));
        String idShop = params.get("idShop");
        String descript = params.get("descrip");
        String idEmploy = params.get("idEmp");
        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.reportService.addReportConfirmProFromEmploy2Shop(typeRp,idShop,descript,idEmploy,idPro))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/send-rp-pro-customer" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Report> reportPro(@RequestBody Map<String,String> params){
        int typeRp = Integer.parseInt(params.get("typeRp"));
        String idShop = params.get("idShop");
        String descript = params.get("descrip");
        String idCus = params.get("idCus");
        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.reportService.addReportFromCus2Product(typeRp,idShop,descript,idCus,idPro))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
