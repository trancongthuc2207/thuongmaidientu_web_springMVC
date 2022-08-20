/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


import com.tct.service.*;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author admin
 */
@Controller
@ControllerAdvice
public class IndexController {
    @Autowired
    private Type_ProductService type_ProductService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService_Cus accountService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService_Cus userDetailsService;
    @Autowired
    private OrderDetailsService orderDetailsService;

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int type = Integer.parseInt(params.getOrDefault("type_Id", "1"));
        model.addAttribute("products", this.productService.getProductsByType(params, page, type));
        model.addAttribute("productCounter", this.productService.countProduct());
        model.addAttribute("cartCounter", session.getAttribute("cart"));
//        if (authentication != null) {
//            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            AccountCus accCur = this.userDetailsService.getByUsername(authentication.getName());
//            Customers customers = this.customerService.getCustomersByID(accCur.getIdAccountCus());
//            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
//            int id_pro = Integer.parseInt(params.get("idPro"));
//            Product pro = this.productService.getProductByID(params,id_pro).get(0);
//            model.addAttribute("book_pro",this.orderDetailsService.addOrUpdateProdToOrderDetails_WAITTING(params,idOrderWaitting,pro,customers.getIdCustomer()));
//        }
        return "index";
    }
}
