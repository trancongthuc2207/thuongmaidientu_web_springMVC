package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@ControllerAdvice
public class Employee_MainController {
    @Autowired
    private Type_ProductService type_ProductService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService_Cus accountService;
    @Autowired
    private ShopStoreService shopStoreService;
    @Autowired
    private ShopProductService shopProductService;

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService_Cus userDetailsService;
    @Autowired
    private OrderDetailsService orderDetailsService;
    @Autowired
    private DiscountCodeService discountCodeService;

    @GetMapping("/employee")
    public String employee_main(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("pageOrder","1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            session.setAttribute("listOrder", this.ordersService.getOrderByEmployee(params, page));
            session.setAttribute("listOrderDetails", this.orderDetailsService.getOrderDetails(params, page));
            session.setAttribute("idEmployee",customers.getIdCustomer());

            session.setAttribute("listTypeProduct",this.type_ProductService.getTypeProducts());
            session.setAttribute("listProduct",this.productService.getProductsWaittingComfirm());
        }
        return "employee";
    }
}
