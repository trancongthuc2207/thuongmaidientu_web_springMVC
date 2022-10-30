/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


import com.cloudinary.Cloudinary;
import com.tct.pojo.*;
import com.tct.service.*;

import java.util.ArrayList;
import java.util.List;
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

    @Autowired
    private ShopProductService shopProductService;

    @Autowired
    private Cloudinary cloudinary;

    @ModelAttribute
    public void commomAttrs(Model model, HttpSession session,Authentication authentication,@RequestParam Map<String, String> params) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        session.setAttribute("type_products", this.type_ProductService.getTypeProducts());
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        //session.setAttribute("type_products", this.type_ProductService.getTypeProducts());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int type = Integer.parseInt(params.getOrDefault("type_Id", "0"));
        ////////
        String kw_All = params.getOrDefault("kwAll", "");
        String isDiscount = params.getOrDefault("isDiscount","");
        String incre_des = params.getOrDefault("incre_des","");
        boolean checkSearch = false;
        if(kw_All != "" || isDiscount != "" || incre_des != ""){
            checkSearch = true;
            model.addAttribute("checkSearch",checkSearch);
            model.addAttribute("kwAll",kw_All);
            model.addAttribute("isDiscount",isDiscount);
            model.addAttribute("incre_des",incre_des);
        }

        List<Product> lstPro = new ArrayList<>();
        lstPro = this.productService.GetProductIndex_All_Kw(kw_All, isDiscount,incre_des,1,page,"NO");
        model.addAttribute("products", lstPro);
        model.addAttribute("productCounter", this.productService.GetProductIndex_All_Kw(kw_All, isDiscount,incre_des,1,page,"FULL").size());
        model.addAttribute("shop_product",this.shopProductService.getShopProducts());
        if(type > 0){
            model.addAttribute("type", type);
            model.addAttribute("productCounter", this.productService.countProduct("notFull",type));
        }
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());


            if (accCur.getIdPos().getIdPosition() == 2) {
                Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
                long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
                session.setAttribute("amountPro", this.orderDetailsService.countProductInOrderWaitting(idOrderWaitting));
                List<Product> fvr = this.productService.getProductFavoriteOfCustomers(customers.getIdCustomer());
                if(fvr != null)
                {
                    model.addAttribute("lstProductFavor", fvr);
                }
                model.addAttribute("idOr",idOrderWaitting);
                model.addAttribute("idCust", customers.getIdCustomer());
                session.setAttribute("nameCus",customers.getNameC());
            }
        }
        return "index";
    }

    @RequestMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("account", new Account());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute(value = "account") Account account, Model model) {

        if (account.getUsernameC() != null) {
            if (account.getPasswordC().equals(account.getConfirmPassword())) {
                if (this.userDetailsService.addUser(account) == true) {
                    return "redirect:/login";
                }
            } else {
                model.addAttribute("msgEr", "Hai mật khẩu không trùng nhau!!");
            }
        } else {
            model.addAttribute("msgEr", "Chưa nhập tài khoản");
        }
        return "register";
    }


    @RequestMapping("/order-details")
    public String orderDetails(Model model, @RequestParam Map<String, String> params,Authentication authentication) {
        long idOr = 0;
        String idShop_param = params.getOrDefault("idShop","");
//        model.addAttribute("shop_product",this.shopProductService.getShopProducts());
        if(params.get("idOder") != null)
        {
            idOr = Long.parseLong(params.get("idOder"));
        }

        long idOrFrom_S = 0;
        if(params.get("idOderFromShop") != null)
        {
            idOrFrom_S = Long.parseLong(params.get("idOderFromShop"));
        }

        if(idOr != 0 && idShop_param == ""){
            List<OrderDetails> lstOrdFromShop = new ArrayList<>();
            long total_non_discount = 0;
            long total_minus = 0;
            List<OrderDetails> lst_Order = this.orderDetailsService.getOrdersDetailsByID_Order_Pro(params,idOr);
            for(OrderDetails s : lst_Order){
                    lstOrdFromShop.add(s);
                    total_non_discount += (s.getAmount() * s.getUnitPrice());
                    total_minus += s.getValueDiscount();
            }
            long total = this.orderDetailsService.totalOfOrderPerShop(idOr,lstOrdFromShop.get(0).getProduct().getIdShop().getIdShopStore());

            Customers cus = this.customerService.getCustomerByIDCus(lstOrdFromShop.get(0).getOrders().getCustomer().getIdCustomer());
            model.addAttribute("listOrder", lstOrdFromShop);
            model.addAttribute("totals_non_discount", total_non_discount);
            model.addAttribute("totals_minus", total_minus);
            model.addAttribute("totals", total);
            //model.addAttribute("cus",cus);
            Orders orders = this.ordersService.getOrders(idOr).get(0);
            model.addAttribute("Orders",orders);
            model.addAttribute("cus",orders.getCustomer());
        } else if(idOrFrom_S != 0){
            String idShop = params.get("idShop");
            List<OrderDetails> lstOrdFromShop = new ArrayList<>();
            long total_non_discount = 0;
            long total_minus = 0;
            List<OrderDetails> lst_Order = this.orderDetailsService.getOrdersDetailsByID_Order_Pro(params,idOrFrom_S);
            for(OrderDetails s : lst_Order){
                if(s.getProduct().getIdShop().getIdShopStore().equals(idShop))
                {
                    lstOrdFromShop.add(s);
                    total_non_discount += (s.getAmount() * s.getUnitPrice());
                    total_minus += (s.getAmount() * s.getValueDiscount());
                }
            }
            long total = this.orderDetailsService.totalOfOrderPerShop(idOrFrom_S,idShop);
            Customers cus = this.customerService.getCustomerByIDCus(lstOrdFromShop.get(0).getOrders().getCustomer().getIdCustomer());
            model.addAttribute("listOrderS", lstOrdFromShop);
            model.addAttribute("totals_non_discount", total_non_discount);
            model.addAttribute("totals_minus", total_minus);
            model.addAttribute("totals", total);
            //model.addAttribute("cus",cus);
            model.addAttribute("shopID",idShop);
            Orders orders = this.ordersService.getOrders(idOrFrom_S).get(0);
            model.addAttribute("Orders",orders);
            model.addAttribute("cus",orders.getCustomer());
        }

        return "order-details";
    }

}
