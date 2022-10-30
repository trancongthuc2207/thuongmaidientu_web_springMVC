package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.OrderDetails;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_OrdersShopController {
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

    @GetMapping("/shop-manager/orders")
    public String customer_prodAttr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String kw = params.get("kw");
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.countOrderDetailsForShopById_Order(shopStore.getIdShopStore(),"1");

            List<String> list_IdOrder = new ArrayList<>();
            list_IdOrder = this.orderDetailsService.listIDOrderToStringByIdShop(shopStore.getIdShopStore(),"1","",page);

            if(kw == null || kw.isEmpty()){
                model.addAttribute("countOrd", slOrd);
                model.addAttribute("lst_IDOrder", list_IdOrder);
                model.addAttribute("listOrdFilter",this.orderDetailsService.getOrderDetailsForShopByID_ShopKW(params,page,shopStore.getIdShopStore()));
            }else {
                model.addAttribute("countOrd", slOrd);
                model.addAttribute("lst_IDOrder", list_IdOrder);
                model.addAttribute("listOrdFilter",this.orderDetailsService.getOrderDetailsForShopByID_ShopKW_All(params,page,shopStore.getIdShopStore()));
            }

        }

        return "shop-manager/orders";
    }
    @GetMapping("/shop-manager/orders/today")
    public String orderAccept_Today_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.countOrderDetailsForShopById_Order(shopStore.getIdShopStore(),"1");

            List<String> list_IdOrder = new ArrayList<>();
            list_IdOrder = this.orderDetailsService.listIDOrderToStringByIdShop(shopStore.getIdShopStore(),"1","today",page);


            model.addAttribute("countOrd", slOrd);
            model.addAttribute("lst_IDOrder", list_IdOrder);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getOrderDetailsForShopByID_ShopKW_Today(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders";
    }

    @GetMapping("/shop-manager/orders/yesterday")
    public String orderAccept_yesterday_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.countOrderDetailsForShopById_Order(shopStore.getIdShopStore(),"1");

            List<String> list_IdOrder = new ArrayList<>();
            list_IdOrder = this.orderDetailsService.listIDOrderToStringByIdShop(shopStore.getIdShopStore(),"1","yesterday",page);

            model.addAttribute("lst_IDOrder", list_IdOrder);
            model.addAttribute("countOrd", slOrd);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getOrderDetailsForShopByID_ShopKW_Yesterday(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders";
    }

    @GetMapping("/shop-manager/orders/moreday")
    public String orderAccept_moreday_Attr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slOrd = this.orderDetailsService.countOrderDetailsForShopById_Order(shopStore.getIdShopStore(),"1");

            List<String> list_IdOrder = new ArrayList<>();
            list_IdOrder = this.orderDetailsService.listIDOrderToStringByIdShop(shopStore.getIdShopStore(),"1","moreday",page);
            model.addAttribute("lst_IDOrder", list_IdOrder);
            model.addAttribute("countOrd", slOrd);
            model.addAttribute("listOrdFilter",this.orderDetailsService.getOrderDetailsForShopByID_ShopKW_MoreDay(params,page,shopStore.getIdShopStore()));
        }
        return "shop-manager/orders";
    }
}
