package com.tct.controllers;

import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_ManagerController {
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
    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/shop-manager")
    public String customer_prodAttr(Model model, @RequestParam Map<String, String> params, HttpSession session , Authentication authentication) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int type = Integer.parseInt(params.getOrDefault("type_Id", "1"));
        model.addAttribute("products", this.productService.getProductsByType(params, page, type));
        model.addAttribute("productCounter", this.productService.countProduct());
        model.addAttribute("cartCounter", session.getAttribute("cart"));
//        if (authentication != null) {
//            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
//        }
        return "shop-manager";
    }
}
