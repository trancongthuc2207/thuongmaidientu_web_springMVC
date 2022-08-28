package com.tct.controllers;


import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.service.CustomerService;
import com.tct.service.OrdersService;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@ControllerAdvice
public class Cus_Orders_ManagerController {
    @Autowired
    private UserService_Cus accountService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService_Cus userDetailsService;

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/user/cus-orders-manager")
    public String Cus_Orders_Manager(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            String idStatus = params.getOrDefault("idStatus", "1");
            int page = Integer.parseInt(params.getOrDefault("pageOrder", "1"));
            model.addAttribute("orders_count", this.ordersService.countOrdersByID_Cus(customers.getIdCustomer()));
            model.addAttribute("orders_cus", this.ordersService.getOrdersByID_Cus_Status(params, page, customers.getIdCustomer(), idStatus));


        }
        return "user/cus-orders-manager";
    }
}
