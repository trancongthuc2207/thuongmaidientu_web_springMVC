/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.service.*;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
@ControllerAdvice
public class ProductController {
    
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService_Cus userDetailsService;

    @Autowired
    private ShopStoreService shopStoreService;
    @Autowired
    private ShopProductService shopProductService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;

    @Autowired
    private Type_ReportService type_reportService;

    @RequestMapping("/products")
    public String index(Model model, @RequestParam Map<String, String> params,Authentication authentication) {
        int id = Integer.parseInt(params.getOrDefault("ID_Product", "1"));
        model.addAttribute("productByID", this.productService.getProductByID(params,id));

        if(authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());

            model.addAttribute("idOr",idOrderWaitting);
            model.addAttribute("idCust", customers.getIdCustomer());
            model.addAttribute("listReportCus",this.type_reportService.getType_Report("customer"));
        }

        return "products";
    }
}
