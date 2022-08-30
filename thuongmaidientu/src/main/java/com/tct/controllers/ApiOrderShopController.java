package com.tct.controllers;


import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;
import com.tct.service.OrderDetailsService;
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

    @PostMapping(path = "/accept-order" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<OrderDetails> update_Pro_OrderFromShop(@RequestBody Map<String,String> params){
        Long idOrderDetails = Long.parseLong(params.get("idOrd"));
        int idProduct = Integer.parseInt(params.get("idPro"));
        if(this.orderDetailsService.updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(idOrderDetails,idProduct))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
