/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


import com.cloudinary.Cloudinary;
import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;
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
    private Cloudinary cloudinary;

    @ModelAttribute
    public void commomAttrs(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int type = Integer.parseInt(params.getOrDefault("type_Id", "1"));
        model.addAttribute("products", this.productService.getProductsByType(params, page, type));
        model.addAttribute("productCounter", this.productService.countProduct());
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
            }
        }
        return "index";
    }

    @GetMapping("/add_pro/{idPro}")
    public String add_product(@PathVariable("idPro") Integer productID, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            int id_pro = productID;
            this.orderDetailsService.addOrUpdateProdToOrderDetails_WAITTING(params, idOrderWaitting, id_pro, customers.getIdCustomer());
        }
        return "redirect:/";
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
        if(params.get("idOder") != null)
        {
            idOr = Long.parseLong(params.get("idOder"));
        }

        long idOrFrom_S = 0;
        if(params.get("idOderFromShop") != null)
        {
            idOrFrom_S = Long.parseLong(params.get("idOderFromShop"));
        }

        if(idOr != 0){
            model.addAttribute("listOrder", this.orderDetailsService.getOrdersDetailsByID_Order_Pro(params,idOr));
        } else if(idOrFrom_S != 0){
            String idShop = params.get("idShop");
            List<OrderDetails> lstOrdFromShop = new ArrayList<>();
            for(OrderDetails s : this.orderDetailsService.getOrdersDetailsByID_Order_Pro(params,idOrFrom_S)){
                if(s.getProduct().getIdShop().getIdShopStore().equals(idShop))
                {
                    lstOrdFromShop.add(s);
                }
            }
            model.addAttribute("listOrderS", lstOrdFromShop);
        }

        return "order-details";
    }

}
