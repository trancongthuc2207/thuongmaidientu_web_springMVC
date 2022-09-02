package com.tct.controllers;


import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;
import com.tct.service.OrderDetailsService;
import com.tct.service.OrdersService;
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
public class ApiOrderShopController {
    @Autowired
    private OrderDetailsService orderDetailsService;
    @Autowired
    private ReportService reportService;
    @Autowired
    private OrdersService ordersService;

    @PostMapping(path = "/accept-order" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<OrderDetails> update_Pro_OrderFromShop(@RequestBody Map<String,String> params){
        Long idOrderDetails = Long.parseLong(params.get("idOrd"));
        int idProduct = Integer.parseInt(params.get("idPro"));

        if(this.reportService.checkReportByShop_Pro(idProduct)){
            this.reportService.confirmOrderReportByShop(idProduct);
        }
        if(this.orderDetailsService.updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(idOrderDetails,idProduct))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/confirm-order-full" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<OrderDetails> confirm_order_full(@RequestBody Map<String,String> params){
        Long idOrderDetails = Long.parseLong(params.get("idOrd"));

        if(this.ordersService.submitOrderFull(idOrderDetails))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
