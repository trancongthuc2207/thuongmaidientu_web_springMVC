package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.ShopProducts;
import com.tct.pojo.ShopStore;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@ControllerAdvice
public class AddProductController {
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

    @RequestMapping("/shop-manager/add-product")
    public String index(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        return "shop-manager/add-product";
    }

//    @GetMapping("/shop-manager/edit/back")
//    public String back(@RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
//
//        return "redirect:/user/customer-orders";
//    }
}
