package com.tct.controllers;

import com.tct.service.CustomerService;
import com.tct.service.OrderDetailsService;
import com.tct.service.OrdersService;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@ControllerAdvice
public class Customer_OrdersController {
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

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/user/customer-orders")
    public String customer_prodAttr(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            AccountCus accCur = this.userDetailsService.getByUsername(authentication.getName());
//            Customers customers = this.customerService.getCustomersByID(accCur.getIdAccountCus());
//            String idStatus = params.getOrDefault("idStatus", "1");
//            int page = Integer.parseInt(params.getOrDefault("pageOrder", "1"));
//            model.addAttribute("orders_cus", this.ordersService.getOrdersByID_Cus_Status(params, page, customers.getIdCustomer(), idStatus));
//            model.addAttribute("orders_count", this.ordersService.countOrdersByID_Cus(customers.getIdCustomer()));
//
//
//            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
//            model.addAttribute("order_details_waitting", this.orderDetailsService.getOrderDetailsByID_Order(idOrderWaitting));
        }
        return "user/customer-orders";
    }

//    @GetMapping("/user/customer-orders/waitting-cart")
//    public String customer_prodAttr1(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
//        if (authentication != null) {
//            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            AccountCus accCur = this.userDetailsService.getByUsername(authentication.getName());
//            Customers customers = this.customerService.getCustomersByID(accCur.getIdAccountCus());
//            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
//            model.addAttribute("order_details_waitting", this.orderDetailsService.getOrderDetailsByID_Order(idOrderWaitting));
//        }
//        return "user/customer-orders";
//    }
}
