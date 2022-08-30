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
public class OrdersAcceptedController {
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

    @GetMapping("/shop-manager/orders-accepted")
    public String orderAcceptAttr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String kw = params.get("kw");
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()).size();
            if(kw == null || kw.isEmpty()){
                model.addAttribute("countOrd", slOrd);
                model.addAttribute("listOrdFilter",this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()));
            }else {
                model.addAttribute("countOrd", slOrd);
                model.addAttribute("listOrdFilter",this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW_All(params,page,shopStore.getIdShopStore()));
            }
        }
        return "shop-manager/orders-accepted";
    }

    @GetMapping("/shop-manager/orders-accepted/today")
    public String orderAccept_Today_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()).size();

            model.addAttribute("countOrd", slOrd);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW_Today(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders-accepted";
    }

    @GetMapping("/shop-manager/orders-accepted/yesterday")
    public String orderAccept_yesterday_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()).size();

            model.addAttribute("countOrd", slOrd);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW_Yesterday(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders-accepted";
    }

    @GetMapping("/shop-manager/orders-accepted/moreday")
    public String orderAccept_moreday_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()).size();

            model.addAttribute("countOrd", slOrd);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getIs_Accepted_OrderDetailsForShopByID_ShopKW_MoreDay(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders-accepted";
    }
}
