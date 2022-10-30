package com.tct.controllers;


import com.tct.pojo.OrderDetails;
import com.tct.pojo.Orders;
import com.tct.pojo.Product;
import com.tct.service.OrderDetailsService;
import com.tct.service.OrdersService;
import com.tct.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
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

    @PostMapping(path = "/update-per-order-details-accepted" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<OrderDetails> updateOrderDetails_stt_per(@RequestBody Map<String,String> params){
        Long idOrderDetails = Long.parseLong(params.get("idOrd"));

        if(this.orderDetailsService.updateSTTAccept_OrderDetailsShopByID_Ord(idOrderDetails))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/get-list-order-waitting" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Orders> getListOrder_WaittingShop(@RequestBody Map<String,String> params, HttpSession session){
        String idSh = params.get("idS");
        int pageOrdWaitting = Integer.parseInt(params.getOrDefault("pageOr_W", "0"));
        String kw = params.get("kw_wait");
        String inc_desW = params.getOrDefault("filDate","incre");
        List<Orders> lst = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(idSh,kw,"1",pageOrdWaitting,inc_desW);
        session.setAttribute("list_OrderWaitting2", lst);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping(path = "/update-per-order-details-cancle" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<OrderDetails> updateCancleOrderDetails_stt_per(@RequestBody Map<String,String> params){
        Long idOrderDetails = Long.parseLong(params.get("idOrd"));
        String reason = params.get("reason");
        String fr = params.get("from");

        if(this.orderDetailsService.updateSTTCancle_OrderDetailsShopByID_Ord(idOrderDetails,reason,fr))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
