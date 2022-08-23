/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.Product;
import com.tct.service.*;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

        return "index";
    }
    @GetMapping("/add_pro/{idPro}")
    public String add_product(@PathVariable("idPro") Integer productID, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            int id_pro = productID;
            this.orderDetailsService.addOrUpdateProdToOrderDetails_WAITTING(params,idOrderWaitting,id_pro,customers.getIdCustomer());
        }
        return "redirect:/";
    }
}
