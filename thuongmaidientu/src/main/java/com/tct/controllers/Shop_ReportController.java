package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.ShopStore;
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
public class Shop_ReportController {
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

    @Autowired
    private ReportService reportService;

    @GetMapping("/shop-manager/reports")
    public String reports(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);


            model.addAttribute("listReportApp",this.reportService.getReportByID_Shop(params,shopStore.getIdShopStore(),"app"));
        }
        return "shop-manager/reports";
    }
}
